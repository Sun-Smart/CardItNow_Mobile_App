// ignore_for_file: sort_child_properties_last, constant_identifier_names, avoid_print, prefer_interpolation_to_compose_strings, prefer_const_constructors, unnecessary_brace_in_string_interps, equal_keys_in_map

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cardit/ui/splash/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

import 'api_endpoints.dart';

class DialogHelper {
  //show error dialog
  static void showErroDialog(
      {String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Oops!! Network Issue",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sora')),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      if (Get.isDialogOpen ?? true) Get.back();
                    },
                    child: const Text(
                      'Okay',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Loader(),
                  const Center(child: CupertinoActivityIndicator()),
                  const SizedBox(height: 10),
                  Text(message ?? 'Loading...'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen ?? true) Get.back();
  }

  //show error dialog
  static void showContinueDialog() {
    Timer  _timerCou;
    var _timerCount = 60.obs;
    const oneSec =  Duration(seconds: 1);
    _timerCou =  Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_timerCount.value == 0) {
            timer.cancel();
            GetStorage().remove('save_token');
            GetStorage().remove("customer_type");
            if (Get.isDialogOpen ?? true) Get.back();
            Get.offAll(Home());
        } else {
            _timerCount.value--;
        }
      },
    );
    Get.dialog(
        barrierDismissible: false,
      Dialog(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Your Session is going to end. Do You want to Continue (or) Close",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sora')),
                Obx(() =>
                Text("${_timerCount.value}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sora'))),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          GetStorage().remove('save_token');
                          GetStorage().remove("customer_type");
                          if (Get.isDialogOpen ?? true) Get.back();
                          _timerCou.cancel();
                          Get.offAll(Home());
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(HexColor('#CEE812')),
                        ),
                        child: const Text(
                          'Close',
                          style: TextStyle(color: Color(0XFF004751)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          if (Get.isDialogOpen ?? true) Get.back();
                          _timerCou.cancel();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(HexColor('#CEE812')),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(color: Color(0XFF004751)),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }

}

class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad Request', url);
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process', url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not responded in time', url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message, String? url])
      : super(message, 'UnAuthorized request', url);
}

class BaseClient {
  static const int TIME_OUT_DURATION = 20;

  //GET
  Future<dynamic> get(String endPoint) async {
    var uri = Uri.parse(API().baseURL + endPoint);
    var tokens = GetStorage().read("save_token");
    print("Get URL : " + uri.toString());
    if(endPoint == "")
      {
        return [];
      }
    try {
        var response = await http.get(uri, headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokens',
          'accept': 'application/json',
        }).timeout(const Duration(seconds: TIME_OUT_DURATION));
        print(response.statusCode);
        print("Get Body : " + response.body);
        return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> post(String endPoint, dynamic payloadObj,
      {isMultiPart = false, file}) async {
    var uri = Uri.parse(API().baseURL + endPoint);
    var payload = json.encode(payloadObj);
    var tokens = GetStorage().read("save_token");
    if(endPoint != "")
    {
      return "";
    }
    try {
      if (isMultiPart) {
        print("M-URL : " +uri.toString());
        var multiPartReq = http.MultipartRequest('POST', uri);
        multiPartReq.headers.addAll({"Content-type": "multipart/form-data"});
        if(file != null) {
          multiPartReq.files.add(file);
        }
        multiPartReq.fields.addAll(payloadObj);
        var response = await multiPartReq.send();
        final respStr = await response.stream.bytesToString();
        print(response.statusCode.toString());
        print("body : " + respStr);
      } else {
        print("URL : " +uri.toString());
        print("Req : "+ payload);
        var response = await http
            .post(uri,
                headers: <String, String>{
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                  'Authorization': 'Bearer $tokens',
                  'accept': 'application/json',
                },
                body: payload)
            .timeout(const Duration(seconds: TIME_OUT_DURATION));
        print(response.statusCode.toString());
        print("body : " + response.body.toString());
        return _processResponse(response);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    } catch (e) {
      print("API Exception: " + e.toString());
    }
  }

  //DELETE
  //OTHER

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        // throw BadRequestException(
        //     utf8.decode(response.bodyBytes), response.request!.url.toString());
        return;
      case 401:
        var message = json.decode(response.body);
        Fluttertoast.showToast(msg: "$message");
        return;
      case 417:
        var message = json.decode(response.body);
      Fluttertoast.showToast(msg: "$message");
      return;
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
        var message = json.decode(response.body);
        Fluttertoast.showToast(msg: "$message");
        return;
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      var err = json.decode(message!);
      Fluttertoast.showToast(msg: "$err");
      // DialogHelper.showErroDialog(description: err);
    } else if (error is FetchDataException) {
      var message = error.message;
      Fluttertoast.showToast(msg: "$message");
      // DialogHelper.showErroDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErroDialog(
          description: 'Oops! It took longer to respond.');
    }
  }

  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
