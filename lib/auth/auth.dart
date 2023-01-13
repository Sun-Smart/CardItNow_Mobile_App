// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/ui/payment_method/manula_card_screen.dart';
import 'package:cardit/ui/register/verify_userid_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api_endpoints.dart';
import '../base_client.dart';
import '../ui/register/4digit_passcode_screen.dart';
import '../ui/register/profile_information_screen.dart';
import '../ui/register/register_loading_screen.dart';
import '../ui/register/select_avatar_screen.dart';
import '../ui/register/twofactor.dart';
import '../ui/register/verify_email_screen.dart';
import 'init.dart';

class AuthCon extends GetxController with BaseController {
  @override
  void onInit() {
    termsconditions();
    showAvatorMaster();
    geoaccess();
    creditCardgetAPI();
    super.onInit();
  }

  File? image;
  var isUAE = false.obs;

  // terms and conditions
  var termscond = '';

  // avatar
  var avatarImageList = [];

  // geoaccess
  var geoacclist;

  // gender
  var gender = 1.obs;

  //credit card get
  var creditCardGet = {}.obs;

  //weight
  var selectedUnits = "LBS".obs;
  var selectedWeight = 50.0.obs;

  //weight
  var drawercountry = "CM".obs;
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
  RxBool newExcercise = false.obs;
  RxBool workoutWithoutOutSide = false.obs;
  RxBool fitEveryDay = false.obs;
  var regDoc = '';
  var uploadimg = '';
  String choosedDocId = '';

  var googleMail = '';

  // login
  final TextEditingController userNameCon = TextEditingController();
  final TextEditingController mobileCon = TextEditingController();
  final emailController = TextEditingController();
  var otp = ''.obs;
  var token = ''.obs;

  //Get Storage
  final box = GetStorage();

  //otp
  final TextEditingController otpCon = TextEditingController();

  //loginApi
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

  //loginOtp
  void loginOTP() async {
    if (otp.value == otpCon.text) {
      otp = ''.obs;
      if (1 == 0) {
        InitCon acon = InitCon();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var result = prefs.setString('token', token.value);
        print(
            '**********************  login OTP  ${result}   **********************');
        acon.getLoginDetails();
        // Get.offAll(BottomNav());
      } else {
        // Get.to(AvatarPageView());
      }
    } else {
      Fluttertoast.showToast(msg: "OTP Mismatch");
    }
  }

  //regsterApi
  void registerAPI(email) async {
    showLoading();
    var body = {};
    var response = await BaseClient()
        .post(
          API().register + '?email=' + email,
          body,
        )
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
        .post(
            API().verifyotp +
                '?email=${googleMail == '' ? email : googleMail}&otp=' +
                otp,
            body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    hideLoading();
    print('check' + data);
    if (data == "Success") {
      GetStorage().write('token', email);
      var storedEmail = GetStorage().read('token');
      print(
          '***************** OTP Token    &&&&   ${storedEmail}    &&&&      ************************');
      Get.to(() => Passcode());
      Fluttertoast.showToast(msg: data.toString());
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

  // password
  void passwordapi(email, password) async {
    var body = {};
    var response = await BaseClient()
        .post(
            API().password +
                '?email= ${googleMail == '' ? email : googleMail}' +
                '&password=' +
                password,
            body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    print('pass' + data);
    if (data == "Success") {
      Get.to(VerifyUserId());
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

  //profile Infomation
  void profileInformatrion(
    email,
    firstName,
    lastName,
    city,
    state,
    requiredno,
    dateofbrith,
    issuedate,
    expirydate,
    address,
    postalcode,
  ) async {
    var body = {};
    var response = await BaseClient()
        .post(
            API().updateProfileInformation +
                "?email=$email&firstname=$firstName&lastname=$lastName&mobile=$requiredno&dateofbirth=$dateofbrith&address=$address&geoid=1&cityid=2&postalcode=$postalcode&idissuedate=$issuedate",
            body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    print('Pass' + data);
    if (data == 'Success') {
      GetStorage().write('username', firstName.toString());
      // Get.to(() => isChecked1 == true ? Twofactor() : AvatarPageView());
      Get.to(() => Twofactor());
      Fluttertoast.showToast(msg: data.toString());
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

  //pinset
  void pinsetapi(email, pin) async {
    print(email);
    print(pin);
    var body = {};
    var response = await BaseClient()
        .post(
            API().pinset +
                '?email= ${googleMail == '' ? email : googleMail}' +
                '&pin=' +
                pin,
            body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    print('pass-------------------' + data);
    if (data == "Success") {
      Get.to(VerifyUserId());
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

  //terms and condition
  void termsconditions() async {
    var response =
        await BaseClient().get(API().termsmaster).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    termscond = data[0]['termdetails'];
  }

  //show Avator Master
  void showAvatorMaster() async {
    var response =
        await BaseClient().get(API().showAvatorMaster).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    avatarImageList = data;
    print("avatarcheck" + avatarImageList.length.toString());
  }

  //upload Avator and Selfi
  void avatorSelfi(avator) async {
    showLoading();
    print(avator);
    var body = {};

    if (image != null) {
      var file = await http.MultipartFile.fromPath('Imagefile', image!.path);

      var response = await BaseClient()
          .post(API().uploadAvator, body,
              isMultiPart: true, file: file, isDev: true)
          .catchError(handleError);
      if (response == null) return;
      var data = json.decode(response);
      if (data == "Success") {
        Fluttertoast.showToast(msg: 'Data Upload Successfully...');
        print(data.toString());
        // Get.to(termsandconditions());
        // token.value = userData["token"];
        // if (!resend) {
        // Get.to(OtpScreenView());
        // }
      } else {
        Fluttertoast.showToast(msg: data.toString());
      }
    }
  }

  //upload credit card details
  void creditCardPostAPI(
      cardNumber, validity, cvv, cardName, bankName, nickName) async {
    DateTime datetime = DateTime.now();
    String dateStr = datetime.toString();
    var body = {
      "customerid": 57,
      "uid": 0,
      "uiddesc": 0,
      "payid": null,
      "cardnumber": cardNumber,
      "cardname": cardName,
      "expirydate": validity,
      "bankname": bankName,
      "ibannumber": " ",
      "status": "A",
      "createdby": 57,
      "createddate": dateStr,
      "updatedby": 0,
      "updateddate": dateStr
    };
    var response = await BaseClient()
        .post(API().crediCardPost, body)
        .catchError(handleError);
    print(response);
    print(body);
    if (response == null) return;
    var data = json.decode(response);
    print('check' + data);
    if (data == "Success") {
      Fluttertoast.showToast(msg: 'Data Added Successfully.....');
      Get.to(const ManualCard());
    } else {
      Fluttertoast.showToast(msg: "Something wrong");
    }
  }

  //get credit card details
  void creditCardgetAPI() async {
    var response =
        await BaseClient().get(API().creditCardGetLink).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    creditCardGet.value = data['customerpaymode'];
    print('Credit Card Api Get Method' +
        creditCardGet.toString() +
        'Credit Card Api Get Method');
  }

  void uploadDocx(
    email,
    docid,
  ) async {
    var body = {};
    log(uploadimg + "DD");
    print(uploadimg + "BB");
    var response = await BaseClient()
        .post(
            API().uploadProcessDocument +
                "?email=$email&documenttype=$choosedDocId&document=$regDoc&documentid=$docid&selfi=$uploadimg",
            body)
        .catchError(handleError);
    if (response == null) return Get.to(ProfileInformation());
    var data = json.decode(response);
    print("--------------------------------$data");
    if (data == 'Success') {
      Get.to(Registerloading());
      await Get.to(AvatarPageView());
      Fluttertoast.showToast(msg: "Data Saved");
      print("successsssssss");
    } else {
      print("---------failed");
    }
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
    var response = await BaseClient().get(API().terms).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    geoacclist = data[0];
    // print('check' + data);
  }

  void updateGoalAPI() async {
    // showLoading();
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

    // hideLoading();
    if (data['status']) {
      Fluttertoast.showToast(msg: data['message']);
    } else {
      Fluttertoast.showToast(msg: data['message']);
    }
  }
}
