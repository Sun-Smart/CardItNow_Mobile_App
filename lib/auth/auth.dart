// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cardit/ui/dashboard/paynow_menu/payment_loading.dart';
import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/ui/login/login_screen.dart';
import 'package:cardit/ui/payment_method/choose_payment_method.dart';
import 'package:cardit/ui/register/verify_userid_screen.dart';
import 'package:cardit/ui/update_psw_screen/update_password_code_screen.dart';
import 'package:cardit/ui/update_psw_screen/update_password_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_endpoints.dart';
import '../base_client.dart';
import '../main.dart';
import '../ui/register/4digit_passcode_screen.dart';
import '../ui/register/profile_information_screen.dart';
import '../ui/register/register_loading_screen.dart';
import '../ui/register/select_avatar_screen.dart';
import '../ui/register/terms&condition.dart';
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
    countryselection();

    if(GetStorage().read('save_token').toString() != "null"){
      taxDetailsGetApi();
      banklistget();
      documenttypeget();
      paymentpurposeget();
      invoicegetmethod();
    }
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
//choose country
  var pickcountry = [];
  RxList pickcity = [].obs;



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

  dynamic dropdownvalue;
  dynamic dropdownvalueCity;

  getLoginToken(){
    var token = GetStorage().read('save_token');
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    print(payload);
    MyApp.logindetails = payload;
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
      Fluttertoast.showToast(msg: data.toString());
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

  //regsterApi
  void registerSignAPI(var body) async {
    showLoading();
    print(body.toString());
    var response = await BaseClient()
        .post(API().registerSign, body)
        .catchError(handleError);
    hideLoading();
    if (response == null) return;
    var data1 = json.decode(response);
    var data = json.decode(data1);
    print(data.toString());
    if (data["status"] == "success") {
      Get.to(Passcode());
      Fluttertoast.showToast(msg: data["message"].toString());
    } else {
      Fluttertoast.showToast(msg: data["message"].toString());
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
    if (data == "Success") {
     // GetStorage().write("save_token", email);
     print("hhheedds"+email.toString());
      Get.to(() => Passcode());
      Fluttertoast.showToast(msg: data.toString());
    } else {
      Fluttertoast.showToast(msg: "Invalid OTP");
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
    if (data == 'Success') {
      GetStorage().write('username', firstName.toString());
      // Get.to(() => isChecked1 == true ? Twofactor() : AvatarPageView());
      if(kIsWeb){
 Get.to(() => termsandconditions());
      } else{
         Get.to(() => Twofactor());
      }
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
    if (data == "Success") {
      Get.to(VerifyUserId());
      Fluttertoast.showToast(msg: data.toString());
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
  }

  //upload Avator and Selfi
  void avatorSelfi(avator) async {
    showLoading();
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
      } else {
        Fluttertoast.showToast(msg: data.toString());
      }
    }
  }

  //processocr
  void ocrdocument() async {
    Get.to(Registerloading());
    var body = {"livestockphoto": scandocs};
    var response =
        await BaseClient().post(API().processocr, body).catchError(handleError);
    Get.back();
    if (response == null) return;
    var data = json.decode(response);
    if (data != null) {
      profileinfo.value = data;
       Get.to(AvatarPageView());
      // Fluttertoast.showToast(msg: data.toString());
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }



  void uploadDocx(email, docid) async {
    Get.to(Registerloading());
    var body = {
      'email': email.toString(),
      'documenttype': choosedDocId.toString(),
      'document':regDoc.toString(),
      'documentid': docid.toString(),
      'selfi': uploadimg.toString()
    };
    var response = await BaseClient()
        .post(
            API().uploadProcessDocument,
            body)
        .catchError(handleError);
    Get.back();
    if (response == null) return;
    var data = json.decode(response);
    await Get.to(AvatarPageView());
    if (data == 'Success') {
      Fluttertoast.showToast(msg: "Data Saved");
    } else {
      print("---------failed");
    }
  }

  void geoaccess() async {
    var response = await BaseClient().get(API().terms).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    geoacclist = data[0];
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
      Get.to(PaymentLoading());
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
    documenttypelist.clear();
    var data = json.decode(response);
    documenttypelist.addAll(data);
  }

  //city country selctions api

  void countryselection() async {
    var response =
    await BaseClient().get(API().countryselect).catchError(handleError);
    if (response == null) return;
    var data = jsonDecode(response);
    pickcountry = data;
  }

  cityselection(
      String countryid
      ) async {
    dropdownvalueCity = null;
    var response =
    await BaseClient().get(API().cityselect+countryid).catchError(handleError);
    if (response == null) return;
    var data = jsonDecode(response);
    pickcity.value = data;
  }


  //cardstoken

  void cardsget(customerid) async {
    var body = {
    "customerid": customerid
    };
    var response = await BaseClient()
        .post(API().newtoken, body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    print('Pass' + data);
    if (data == 'Success') {
      Get.to(ChoosePaymentPage());

    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }


}




