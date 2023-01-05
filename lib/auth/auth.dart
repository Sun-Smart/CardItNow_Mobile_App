import 'dart:convert';

import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/ui/register/password.dart';
import 'package:cardit/ui/register/terms&condition.dart';
import 'package:cardit/ui/register/verify_userid_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_endpoints.dart';
import '../base_client.dart';
import '../ui/register/verify_email_screen.dart';
import 'init.dart';

class AuthCon extends GetxController with BaseController {
  @override
  void onInit() {
    termsconditions();
    geoaccess();
    super.onInit();
  }

  var isUAE = false.obs;
//termsand conditions
  var termscond;
  //avatar
  var avatarImage;
  // geoaccess
  var geoacclist;
  //gender
  var gender = 1.obs;

  //weight
  var selectedUnits = "LBS".obs;
  var selectedWeight = 50.0.obs;

  //weight
  var selectedHeightUnits = "CM".obs;
  var selectedHeight = 50.0.obs;

  //current diet
  var dietType = "Vegetarian".obs;

  //fitness level
  var isBeginner = true.obs;
  var isIntermediate = false.obs;
  var isAdvanced = false.obs;

  //goals
  var manageWeight = false.obs;
  var increaseEnergy = false.obs;
  var inceaseMuscleMass = false.obs;
  var newExcercise = false.obs;
  var workoutWithoutOutSide = false.obs;
  var fitEveryDay = false.obs;

  // login
  final TextEditingController userNameCon = TextEditingController();
  final TextEditingController mobileCon = TextEditingController();
  final emailController = TextEditingController();
  var otp = ''.obs;
  var token = ''.obs;

  //otp
  final TextEditingController otpCon = TextEditingController();

  void loginAPI(email, password, bool ischecked_checkbox) async {
    print("working");
    showLoading();
    var response = await BaseClient()
        .get("Token?email=$email&Password=$password")
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    if (ischecked_checkbox == true) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      await _prefs.setString("save_token", data["token"].toString());

      print("--------${_prefs.getString("save_token")}");
    } else {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      await _prefs.clear();
      print("--------${_prefs.getString("save_token")}");
    }

    hideLoading();
    print("response " + data.toString());
    if (data["token"].toString().isNotEmpty) {
      Get.to(DashbordScreen());
      // token.value = userData["token"];
      // if (!resend) {
      //   // Get.to(OtpScreenView());
      // }
    } else {
      Fluttertoast.showToast(msg: "Check Your Login Credentials");
    }
  }

  void loginOTP() async {
    if (otp.value == otpCon.text) {
      otp = ''.obs;
      if (1 == 0) {
        InitCon acon = InitCon();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token.value);
        acon.getLoginDetails();
        // Get.offAll(BottomNav());
      } else {
        // Get.to(AvatarPageView());
      }
    } else {
      Fluttertoast.showToast(msg: "OTP Mismatch");
    }
  }

  void registerAPI(email) async {
    showLoading();

    var body = {"email": email};
    var response = await BaseClient()
        .post(API().register + '?email=' + email, body)
        .catchError(handleError);
    if (response == null) return;
    //Get.to(VerifyUserId());
    var data = json.decode(response);

    hideLoading();
    print('check' + data);

    if (data == "Success") {
      Get.to(VerifyEmail());
      // token.value = userData["token"];
      // if (!resend) {
      // Get.to(OtpScreenView());
      // }
    } else {
      Fluttertoast.showToast(msg: "Something wrong");
    }
  }
//verifyotp

  void verify(email, otp) async {
    showLoading();

    var body = {};
    var response = await BaseClient()
        .post(API().verifyotp + '?email=$email&otp=' + otp, body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);

    hideLoading();
    print('check' + data);

    if (data == "Success") {
      Get.to(() => Password());
      Fluttertoast.showToast(msg: data.toString());
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

  // password

  void passwordapi(email, password) async {
    showLoading();

    var body = {};
    var response = await BaseClient()
        .post(
            API().password + '?email=' + email + '&password=' + password, body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);

    hideLoading();
    print('pass' + data);

    if (data == "Success") {
      Get.to(VerifyUserId());
      // token.value = userData["token"];
      // if (!resend) {
      // Get.to(OtpScreenView());
      // }
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

  //
//pinset

  void pinsetapi(email, pin) async {
    showLoading();

    var body = {};
    var response = await BaseClient()
        .post(API().password + '?email=' + email + '&pin=' + pin, body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);

    hideLoading();
    print('pass' + data);

    if (data == "Success") {
      Get.to(termsandconditions());
      // token.value = userData["token"];
      // if (!resend) {
      // Get.to(OtpScreenView());
      // }
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }
  //

//terms and condition
  void termsconditions() async {
    // showLoading();

    var response =
        await BaseClient().get(API().termsmaster).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    // hideLoading();
    termscond = data[0];
    print('check' + data);
  }
  //profile info
  // void profileinfo()async {
  //    showLoading();

  //   var response = await BaseClient().post(API()., ).catchError(handleError);
  //   if (response == null) return;
  //   var data = json.decode(response);
  //    hideLoading();
  // }

  void geoaccess() async {
    showLoading();

    var response = await BaseClient().get(API().terms).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    hideLoading();
    geoacclist = data[0];
    print('check' + data);
  }

  void updateGoalAPI() async {
    showLoading();
    List<String> fitGoalList = [];
    if (manageWeight.value) {
      fitGoalList.add("1");
    }
    if (increaseEnergy.value) {
      fitGoalList.add("2");
    }
    if (inceaseMuscleMass.value) {
      fitGoalList.add("3");
    }
    if (newExcercise.value) {
      fitGoalList.add("4");
    }
    if (workoutWithoutOutSide.value) {
      fitGoalList.add("5");
    }
    if (fitEveryDay.value) {
      fitGoalList.add("6");
    }
    var body = {
      'fitness_goals[]': fitGoalList,
    };
    var response =
        await BaseClient().post(API().updateGoal, body).catchError(handleError);
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
