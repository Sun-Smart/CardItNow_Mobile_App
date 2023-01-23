// ignore_for_file: sort_child_properties_last, constant_identifier_names, avoid_print, prefer_interpolation_to_compose_strings, prefer_const_constructors, unnecessary_brace_in_string_interps, equal_keys_in_map

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
                // Txt(
                //   text: title,
                //   weight: FontWeight.bold,
                //   color: Get.theme.primaryColor,
                // ),
                // Txt(
                //   text: description ?? '',
                //   fsize: 12,
                //   weight: FontWeight.bold,
                //   color: Colors.black,
                // ),
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
    print(uri.toString());
    try {
      var response = await http.get(uri, headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $tokens',
        //  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb21wYW55aWQiOiIxIiwicGtjb2wiOiJOVHN5TURJekxUQXhMVEUySURJeU9qTTJPakl3TGpBd01USTNOaTB3Tmc9PSIsImNvZGUiOiIiLCJ1c2VybmFtZSI6ImFkbWluIiwidXNlcmlkIjoiNSIsInVzZXJ0eXBlIjoiNiIsImVtcGxveWVlaWQiOiIiLCJ1c2Vycm9sZWlkIjoiNiIsInJvbGUiOiIiLCJicmFuY2hpZCI6IiIsImJyYW5jaGlkZGVzYyI6IiIsImZpbnllYXJpZCI6IiIsImZpbnllYXJkZXNjIjoiIiwiY3VycmVuY3kiOiIiLCJlbWFpbCI6WyJteUBjYXJkaXRub3cuY29tIiwibXlAY2FyZGl0bm93LmNvbSJdLCJ1c2Vyc291cmNlIjoiIiwibGFuZ3VhZ2UiOiJlbiIsImRlZmF1bHRwYWdlIjoiIiwiY291bnRyeWNvZGUiOiIiLCJsYXlvdXRwYWdlIjoiIiwidGhlbWUiOiIiLCJsb2dpbmRhdGUiOiIxLzE2LzIwMjMgODozNjoyMCBQTSIsImV4cCI6MTY3NDExMDE4MCwiaXNzIjoiaHR0cDovLzEwOC42MC4yMTkuNDQ6NjM5MzkvIiwiYXVkIjoiaHR0cDovLzEwOC42MC4yMTkuNDQ6NjM5MzkvIn0.IRcjzsiRuM6AxOiqO8oHRvMIRsCu0ATHCrYGHVDJBts'
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
      print(response.statusCode);
      print(response.body);
      print(response);
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
      {isMultiPart = false, file, isDev = false}) async {
    var productionUrl = Uri.parse(API().baseURL + endPoint);
    var devUrl = Uri.parse(API().localUrl + endPoint);
    //Get Token Here
    var token = await GetStorage().read('token');
    var payload = json.encode(payloadObj);
    var tokens = GetStorage().read("save_token");

    // print('tokenn' + token);
    // print(uri);
    var uri = isDev ? devUrl : productionUrl;
    print(uri.toString() + "url");
    try {
      if (isMultiPart) {
        print('comess');
        var multiPartReq = http.MultipartRequest('POST', uri);
        print('yesss');
        multiPartReq.headers.addAll({"Content-type": "multipart/form-data"});
        multiPartReq.files.add(file);
        var response = await multiPartReq.send();
        final respStr = await response.stream.bytesToString();
        // var response = await
        // normalReq.timeout(const Duration(seconds: TIME_OUT_DURATION));
        print(respStr + "body");
        // var result = json.decode(respStr);
        print(response.statusCode.toString() + "body");
        // return _processResponse(result);
      } else {
        // print('sssss' + token + 'dsds');
        var response = await http
            .post(uri,
                headers: <String, String>{
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                  'Authorization': 'Bearer $tokens',
                  //'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb21wYW55aWQiOiIxIiwicGtjb2wiOiJOVHN5TURJekxUQXhMVEUySURJeU9qTTJPakl3TGpBd01USTNOaTB3Tmc9PSIsImNvZGUiOiIiLCJ1c2VybmFtZSI6ImFkbWluIiwidXNlcmlkIjoiNSIsInVzZXJ0eXBlIjoiNiIsImVtcGxveWVlaWQiOiIiLCJ1c2Vycm9sZWlkIjoiNiIsInJvbGUiOiIiLCJicmFuY2hpZCI6IiIsImJyYW5jaGlkZGVzYyI6IiIsImZpbnllYXJpZCI6IiIsImZpbnllYXJkZXNjIjoiIiwiY3VycmVuY3kiOiIiLCJlbWFpbCI6WyJteUBjYXJkaXRub3cuY29tIiwibXlAY2FyZGl0bm93LmNvbSJdLCJ1c2Vyc291cmNlIjoiIiwibGFuZ3VhZ2UiOiJlbiIsImRlZmF1bHRwYWdlIjoiIiwiY291bnRyeWNvZGUiOiIiLCJsYXlvdXRwYWdlIjoiIiwidGhlbWUiOiIiLCJsb2dpbmRhdGUiOiIxLzE2LzIwMjMgODozNjoyMCBQTSIsImV4cCI6MTY3NDExMDE4MCwiaXNzIjoiaHR0cDovLzEwOC42MC4yMTkuNDQ6NjM5MzkvIiwiYXVkIjoiaHR0cDovLzEwOC42MC4yMTkuNDQ6NjM5MzkvIn0.IRcjzsiRuM6AxOiqO8oHRvMIRsCu0ATHCrYGHVDJBts',
                  'Accept': 'application/json',
                },
                body: payload)
            .timeout(const Duration(seconds: TIME_OUT_DURATION));
        print(response.statusCode.toString() + "body");
        print('comess');
        return _processResponse(response);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    } catch (e) {
      print('catchhh');
      print(e.toString());
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
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
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
      DialogHelper.showErroDialog(description: err);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);
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
