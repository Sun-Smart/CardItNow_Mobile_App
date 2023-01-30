// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cardit/ui/dashboard/paynow_menu/payment_loading.dart';
import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/ui/login/login_screen.dart';
import 'package:cardit/ui/register/verify_userid_screen.dart';
import 'package:cardit/ui/update_psw_screen/update_password_code_screen.dart';
import 'package:cardit/ui/update_psw_screen/update_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
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
  var profileinfo = {}.obs;
  var scandocs = '';

  @override
  void onInit() {
    termsconditions();
    showAvatorMaster();
    geoaccess();
    taxDetailsGetApi();
    creditCardgetAPI();
    banklistget();
    paymentpurposeget();
    invoicegetmethod();
    super.onInit();
  }

  File? image;
  var isUAE = false.obs;

  // terms and conditions
  var termscond = '';
  var doc64 = '';
  var banklist = [];
  var paymentpurposelist = [];

  var invoicejson = {};

  // avatar
  var avatarImageList = [];

  // geoaccess
  var geoacclist;

  // gender


  //credit card get
  var creditCardGet = [].obs;

  var drawercountry = "CM".obs;

  var documenttypelist = [];
  RxBool newExcercise = false.obs;
  RxBool workoutWithoutOutSide = false.obs;
  RxBool fitEveryDay = false.obs;
  var regDoc = '';
  var uploadimg = '';
  var uploaddoc = '';
  String choosedDocId = '';

  var googleMail = '';

  //your Details
  var Owner = {}.obs;



  // login
  final TextEditingController userNameCon = TextEditingController();
  final TextEditingController mobileCon = TextEditingController();
  final emailController = TextEditingController();
  final forgotemailController = TextEditingController();

  //  ItemScrollController itemScrollController = ItemScrollController();
  //  ItemPositionsListener itemPositionsListener =
  // ItemPositionsListener.create();
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
    print(email);
    print(password);
    if (response == null) return;
    var data = json.decode(response);
    if (ischecked_checkbox == true) {
      GetStorage().write("save_token", data["token"].toString());
    } else {

    }
    hideLoading();
    GetStorage().write("savedtoken", data.toString());

    if (data["token"].toString()!="null") {
      String token = data.toString();
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      print("Chocoboy" + payload.toString());
      print("response " + data.toString());
      GetStorage().write("getuserid", payload["userid"].toString());
      print("useridcheck" + payload["userid"].toString());
      var getuserid = payload["userid"].toString();
      GetStorage().write("save_token", data["token"].toString());
      Get.to(DashbordScreen());

    } else {
      Fluttertoast.showToast(msg: "Check Your Login Credentials");
    }
  }


  //regsterApi
  void registerAPI(email) async {
    showLoading();
    var body = {};
    var response = await BaseClient()
        .post(API().register + '?email=' + emailController.text, body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    hideLoading();

    if (data == "Success") {
      Get.to(VerifyEmail());
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
                '?email=${googleMail == '' ? email : googleMail}' +
                '&password=' +
                password,
            body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    print('pass' + data);
    if (data == "Success") {
      Get.to(Login());
      Fluttertoast.showToast(msg: data.toString());
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

  //profile Infomation
  void profileInformatrion(email, firstName, lastName, city, state, requiredno,
      dateofbrith, address, postalcode) async {
    var body = {};
    var response = await BaseClient()
        .post(
            API().updateProfileInformation +
                "?email=$email&firstname=$firstName&lastname=$lastName&mobile=$requiredno&dateofbirth=$dateofbrith&address=$address&geoid=1&cityid=2&postalcode=$postalcode&id",
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
                '?email=${googleMail == '' ? email : googleMail}' +
                '&pin=' +
                pin,
            body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    print('pass-------------------' + data);
    if (data == "Success") {
      Fluttertoast.showToast(msg: data.toString());
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

  //Set Card Default Post Method
  void setCardDefaultPost(payId) async {
    var userid = GetStorage().read("getuserid");
    print("checkuser" + userid.toString());
    var body = {"customerid": userid, "payid": payId};
    var response = await BaseClient()
        .post(API().setDefaultCard, body)
        .catchError(handleError);
    print(response);
    print(body);
    if (response == null) return;
    var data = json.decode(response);
    if (data == "Sucess") {
      creditCardgetAPI();
      Fluttertoast.showToast(msg: 'Card Activate Successfully...');
    } else {
      Fluttertoast.showToast(msg: "Something wrong...");
    }
  }

  //Social Media
  void socialmedia(
    email,
    firstName,
    lastName,
    city,
    state,
    requiredno,
    dateofbrith,
    address,
    postalcode,
  ) async {
    var body = {};
    var response = await BaseClient()
        .post(
            API().updateProfileInformation +
                "?email=${googleMail == '' ? email : googleMail}&firstname=$firstName&lastname=$lastName&mobile=$requiredno&dateofbirth=$dateofbrith&address=$address&geoid=1&cityid=2&postalcode=$postalcode",
            body)
        .catchError(handleError);
    if (response == null) return;
    var data = response;
    print(response);
    print('Pass' + data);
    if (data == 'Success') {
      GetStorage().write('username', firstName.toString());
      // Get.to(() => isChecked1 == true ? Twofactor() : AvatarPageView());
      Get.to(() => Passcode());
      Fluttertoast.showToast(msg: data.toString());
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

  void taxDetailsgetApi() async {
    var responce = await BaseClient()
        .get(API().taxDetailsGetApiData)
        .catchError(handleError);
    if (responce == null) return;
    var valueMap = jsonDecode(responce);
    var data = json.decode(valueMap);
    Owner.value = data;
  }

  //processocr

  void ocrdocument() async {
    var body = {"livestockphoto": scandocs};
    var response =
        await BaseClient().post(API().processocr, body).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    // print('Pass' + data);
    // log(data);
    // buildtitle1();

    if (data != null) {
      profileinfo = data;
      await Get.to(AvatarPageView());
      Fluttertoast.showToast(msg: data.toString());
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

  //upload credit card details
  void creditCardPostAPI(
      cardNumber, validity, cvv, cardName, bankName, nickName) async {
    DateTime datetime = DateTime.now();
    String dateStr = datetime.toString();
    var userid = GetStorage().read("getuserid");
    print("checkuser" + userid.toString());
    var body = {
      "customerid": userid,
      "uid": 0,
      "uiddesc": 0,
      "payid": null,
      "cardnumber": cardNumber.toString(),
      "cardname": cardName.toString(),
      "expirydate": validity.toString(),
      "bankname": bankName.toString(),
      "ibannumber": nickName.toString(),
      "status": "",
      "createdby": userid,
      "createddate": dateStr,
      "updatedby": userid,
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
      creditCardgetAPI();
      Get.back();
    } else {
      Fluttertoast.showToast(msg: "Something wrong");
    }
  }

  //get credit card details
  void creditCardgetAPI() async {
    var userid = GetStorage().read("getuserid");
    var response = await BaseClient()
        .get(API().creditCardGetLink + userid)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    print(data);
    creditCardGet.value = data;
    print('Credit Card Api Get Method' +
        creditCardGet.toString() +
        'Credit Card Api Get Method');
  }

  void uploadDocx(email, docid) async {
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
    Get.to(Registerloading());
    await Get.to(AvatarPageView());
    if (data == 'Success') {
      Fluttertoast.showToast(msg: "Data Saved");
      print("successsssssss");
    } else {
      print("---------failed");
    }
  }

  void geoaccess() async {
    var response = await BaseClient().get(API().terms).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    geoacclist = data[0];
    // print('check' + data);
  }



  //onboard payee
  void onboardPayee(firstName, email, businessRegnumber, phonenumber, bank,
      accountnumber, swiftcode, doctypedropdown, doc) async {
    var body = {
      "customerid": "17",
      "firstname": firstName,
      "email": email,
      "businessregnumber": businessRegnumber,
      "mobile": phonenumber,
      "bankname": bank,
      "accountnumber": accountnumber,
      "swiftcode": swiftcode,
      "documnettype": doctypedropdown,
      "documnet": doc
    };
    var response = await BaseClient()
        .post(API().onboardPayeePost, body)
        .catchError(handleError);
    print("---data-----$body");
    if (response == null) return;
    var data = json.decode(response);
    print('Pass' + data);
    if (data == 'Success') {
      //  print("--------$data");
      Get.to(PaymentLoading());
      // GetStorage().write('username', firstName.toString());
      // // Get.to(() => isChecked1 == true ? Twofactor() : AvatarPageView());
      // Get.to(() => Twofactor());
      Fluttertoast.showToast(msg: data.toString());
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

//get method
  void banklistget() async {
    var response =
        await BaseClient().get(API().banklistdropdown).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    banklist = data;
//banklist-dropdown
    print("-----data-------$banklist");
    // termscond = data[0]['termdetails'];
  }

  void paymentpurposeget() async {
    var response = await BaseClient()
        .get(API().Paymentpurposedropdown)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    paymentpurposelist = data;

    print("-----data-------$paymentpurposelist");
    // termscond = data[0]['termdetails'];
  }

  void invoicegetmethod() async {
    var response =
        await BaseClient().get(API().invoiceget).catchError(handleError);
    print("response" + response);
    if (response == null) return;
    var data = jsonDecode(response);
    var data1 = json.decode(data);
    print("-----data" + data);
    // Get.to(AmountPay());
    invoicejson = data1;
    print("------inovice----${invoicejson["Rent"]}");
    // Fluttertoast.showToast(msg: data.toString());
  }

  //forgotpasswordotp
  void forgotpasswordotp(email) async {
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
      Get.to(UpdatePasswordCode());
      // token.value = userData["token"];
      // if (!resend) {
      // Get.to(OtpScreenView());
      // }
    } else {
      Fluttertoast.showToast(msg: "Something wrong");
    }
  }

  //forgototpverify
  void forgototpverify(email, otp) async {
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
          '***************** OTP Token  &&&& ${storedEmail} &&&&  ************************');
      Get.to(() => UpdatePassword());
      Fluttertoast.showToast(msg: data.toString());
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

  void taxDetailsGetApi() async {
    var response = await BaseClient()
        .get(API().taxDetailsGetApiData)
        .catchError(handleError);
    if (response == null) return;
    var valueMap = jsonDecode(response);
    var data = json.decode(valueMap);
    Owner.value = data;
  }

//documenttype get
  void documenttypeget() async {
    var response = await BaseClient()
        .get(API().documenttypedropdown)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    documenttypelist = data;


  }

}




