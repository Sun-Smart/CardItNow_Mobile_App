import 'dart:convert';

import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/ui/register/password.dart';
import 'package:cardit/ui/register/verify_userid_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../api_endpoints.dart';
import '../base_client.dart';
import '../ui/register/verify_email_screen.dart';
import 'init.dart';

class AuthCon extends GetxController with BaseController {

  @override
  void onInit() {
    termsconditions();
    super.onInit();
  }
  var isUAE = false.obs;
//termsand conditions
  var termscond;
  //avatar
  var avatarImage;

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
  var otp = ''.obs;
  var token = ''.obs;

  //otp
  final TextEditingController otpCon = TextEditingController();

  void loginAPI(email,password) async {
    showLoading();
    // var body = {
    //   'email': emailController.text,
    // };
    var response =
    await BaseClient().get("Token?email=$email&Password=$password").catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);

    hideLoading();
    print("hii"+data.toString());
    if (data["token"].toString().isNotEmpty) {
      Get.to(DashbordScreen());
      // token.value = userData["token"];
      // if (!resend) {
      //   // Get.to(OtpScreenView());
      // }
    } else {
      Fluttertoast.showToast(msg:"Check Your Login Credentials");
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

    var body={
      "email":email
    };
    var response =
    await BaseClient().post(API().register+'?email='+email,body).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);

    hideLoading();
    print('check'+data);

    if (data=="Success") {
      Get.to(VerifyEmail());
      // token.value = userData["token"];
      // if (!resend) {
      //   // Get.to(OtpScreenView());
      // }
    } else {

      Fluttertoast.showToast(msg:"Something  wrong");
    }
  }
//verifyotp

  void verify(email,otp) async {
    showLoading();

    var body={

    };
    var response =
    await BaseClient().post(API().verifyotp+'?email=$email&otp='+otp,body).catchError(handleError);
    if (response == null) return ;
    var data = json.decode(response);

    hideLoading();
    print('check'+data);

    if (data=="Success") {
      Get.to(()=>Password());
      Fluttertoast.showToast(msg: data.toString());

    } else {

      Fluttertoast.showToast(msg:

      data.toString()
    );
    }
  }


  void termsconditions() async {
    showLoading();

    var response = await BaseClient().get(API().terms).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    hideLoading();
    termscond= data[0];
    print('check'+data);

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
