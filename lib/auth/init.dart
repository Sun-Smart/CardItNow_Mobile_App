import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../api_endpoints.dart';
import '../base_client.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



//main
var loginStore;

class InitCon extends GetxController with BaseController {
// home
  var homeSlidPage = 0.obs;
  final PageController homeSliderController = PageController(initialPage: 0);
  var statistic = 'Today'.obs;

//profile
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController birthDay = TextEditingController();
  TextEditingController weightCon = TextEditingController();
  TextEditingController heightCon = TextEditingController();
  var gender = 1.obs;

  //notification
  var notificationList = [];

  //feedback
  TextEditingController subject = TextEditingController();
  TextEditingController relatedTo = TextEditingController();
  TextEditingController priority = TextEditingController();
  TextEditingController message = TextEditingController();

  //support
  TextEditingController supportSearch = TextEditingController();

  //payment
  var paymentHistoryList = [];
  var planList = [];

  //diet
  var dietPlanList = [];

  @override
  void onInit() {
    super.onInit();
    getLoginDetails();
  }

  getLoginDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token').toString() != 'null') {}
  }

  void updateProfileAPI() async {
    showLoading();

    final uri = Uri.parse(
      API().baseURL + API().profileUpdate,
    );
    var request = http.MultipartRequest('POST', uri);

    request.headers['Content-type'] = 'application/json';
    request.headers['Accept'] = 'application/json';
    request.fields['member_name'] = fullName.text;
    request.fields['gender'] = gender.toString();
    request.fields['dob'] = birthDay.text;
    request.fields["email"] = email.text;
    request.fields['height'] = heightCon.text;
    request.fields['weight'] = weightCon.text;
    // AuthCon auth = AuthCon();
    // if (auth.avatarImage != null) {
    //   var singleImage = await http.MultipartFile.fromPath(
    //       'avatar', auth.avatarImage.path.toString());
    //   request.files.add(singleImage);
    // }

    var response = await http.Response.fromStream(await request.send());
    if (response == null) return;
    final responseString = await response.body;
    var data = json.decode(responseString);

    hideLoading();
    if (data['status']) {
      Fluttertoast.showToast(msg: data['message']);
    } else {
      Fluttertoast.showToast(msg: data['message']);
    }
  }

  void notificationListAPI() async {
    var response =
        await BaseClient().get(API().notificationList).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    if (data['status']) {
      // notificationList = data["data"];
    } else {
      Fluttertoast.showToast(msg: data['message']);
    }
  }

  void notificationViewAPI(String foodID, String planID) async {
    showLoading();
    var body = {
      'date': "",
      'meal_plan_food_id': foodID,
      'meal_plan_id': planID,
      'is_taken': "1"
    };
    var response = await BaseClient()
        .post(API().viewNotification, body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);

    hideLoading();
    if (data['status']) {
      Fluttertoast.showToast(msg: data['message']);
    } else {
      Fluttertoast.showToast(msg: data['message']);
    }
  }

  void planListAPI() async {
    var response =
        await BaseClient().get(API().planList).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    if (data['status']) {
      // planList = data["data"];
    } else {
      Fluttertoast.showToast(msg: data['message']);
    }
  }

  void planPayAPI(String packageID, String paymentMode, String transactionID,
      String status, String notes) async {
    showLoading();
    var body = {
      'membership_id': loginStore,
      'membership_package_id': packageID,
      'payment_mode': paymentMode,
      'transaction_id': transactionID,
      'transaction_status': status,
      'notes': notes
    };
    var response =
        await BaseClient().post(API().addPlan, body).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);

    hideLoading();
    if (data['status']) {
      Fluttertoast.showToast(msg: data['message']);
    } else {
      Fluttertoast.showToast(msg: data['message']);
    }
  }

  void paymentHistoryListAPI() async {
    var response =
        await BaseClient().get(API().paymentHistory).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    if (data['status']) {
      // paymentHistoryList = data["data"];
    } else {
      Fluttertoast.showToast(msg: data['message']);
    }
  }

  void dietPlanListAPI() async {
    var response = await BaseClient()
        .get("${API().dietPlanList}?date=5-12-2022")
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    if (data['status']) {
      // dietPlanList = data["data"];
    } else {
      Fluttertoast.showToast(msg: data['message']);
    }
  }

  void updateDietPlanAPI(String foodID, String planID) async {
    showLoading();
    var body = {
      'date': "",
      'meal_plan_food_id': foodID,
      'meal_plan_id': planID,
      'is_taken': "1"
    };
    var response = await BaseClient()
        .post(API().updateDietPlan, body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);

    hideLoading();
    if (data['status']) {
      Fluttertoast.showToast(msg: data['message']);
    } else {
      Fluttertoast.showToast(msg: data['message']);
    }
  }
}
