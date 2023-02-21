// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cardit/ui/dashboard/paynow_menu/payment_loading.dart';
import 'package:cardit/ui/login/login_screen.dart';
import 'package:cardit/ui/payment_method/choose_payment_method.dart';
import 'package:cardit/ui/register/congratsfiles/passcodecongrats.dart';
import 'package:cardit/ui/update_psw_screen/update_password_code_screen.dart';
import 'package:cardit/ui/update_psw_screen/update_password_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import '../api_endpoints.dart';
import '../base_client.dart';
import '../main.dart';
import '../ui/register/4digit_passcode_screen.dart';
import '../ui/register/register_loading_screen.dart';
import '../ui/register/security_question.dart';
import '../ui/register/select_avatar_screen.dart';
import '../ui/register/terms&condition.dart';
import '../ui/register/twofactor.dart';
import '../ui/register/verify_email_screen.dart';
import '../ui/startingscreen/home_screen.dart';


class AuthCon extends GetxController with BaseController {
  var profileinfo = {}.obs;
  var scandocs = '';

  @override
  void onInit() {
    termsconditions();
    // showAvatorMaster();
    geoaccess();
    countryselection();
    getSecurityQuestionAPI();
    if(GetStorage().read('save_token').toString() != "null"){
      docselect();
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
  var termscond = [];
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
  RxList pickdoc = [].obs;

  var securityQuestionList = [].obs;




  // login
  final TextEditingController userNameCon = TextEditingController();
  final TextEditingController mobileCon = TextEditingController();
  final emailController = TextEditingController();
  final forgotemailController = TextEditingController();

  //securityquestion controllers
  List<TextEditingController> controllers = [];

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
  dynamic countrywisedoc;

  getLoginToken(){
    var token = GetStorage().read('save_token');
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    print(payload);
    MyApp.logindetails = payload;
    if(GetStorage().read("customer_type") != null){
      MyApp.logindetails["customertype"] = GetStorage().read("user_type");
    }
  }
  //regsterApi
  void registerAPI(email) async {
    showLoading();
    var body ={
    "email":emailController.text,
    "geoid":dropdownvalue["geoid"]

    };

    var response = await BaseClient()
        .post(API().register, body)
        .catchError(handleError);
    if (response == null) return;

    var data1 = json.decode(response);



    hideLoading();
    if(data1!="Your account already register"){
      var data = json.decode(data1);
      GetStorage().write("custid", data["customerid"]);
      print(data);
      print(data["OTP"]);
      if (data["status"]=="success") {
        Get.to(VerifyEmail());
        Fluttertoast.showToast(msg: data["message"].toString());
      } else {
        Fluttertoast.showToast(msg: data["message"].toString());
      }
    }else{
      Fluttertoast.showToast(msg: "Your Account Already Register");
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
    if (data["status"] == "success") {
      GetStorage().write("custid", data["customerid"]);
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
    if(data !="Fail" && data != "not match"){
      if (data=="Success") {

        Get.to(() => Passcode());
        Fluttertoast.showToast(msg: "OTP validated");
      } else {

        Fluttertoast.showToast(msg: "OTP Not valid".toString());
      }
    }else{
      Fluttertoast.showToast(msg: "OTP Fail");
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
    var body = {
      "email": emailController.text,
      "firstname": firstName,
      "lastname": lastName,
      "nickname": "",
      "mobile": requiredno,
      "dateofbirth": dateofbrith,
      "address": address,
      "geoid": 0,
      "cityid": 0,
      "postalcode": postalcode,
    };
    var response = await BaseClient()
        .post(
            API().updateProfileInformation ,
            body)
        .catchError(handleError);
    if (response == null) return;
    var data1 = json.decode(response);
    var data = json.decode(data1);
    if (data["status"] == 'success') {
      GetStorage().write('username', firstName.toString());
      // Get.to(() => isChecked1 == true ? Twofactor() : AvatarPageView());
 //      if(kIsWeb){
 // Get.to(() => termsandconditions());
 //      } else{
 //         Get.to(() => Twofactor());
 //      }
      Get.to(SecurityQuestion());
      // Fluttertoast.showToast(msg: data.toString());
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
    var data1 = json.decode(response);
    var data = json.decode(data1);
    if (data["status"] == "success") {
      Get.to(()=>passcodecongrats());
      // Get.to(VerifyUserId());
      Fluttertoast.showToast(msg: data["message"].toString());
    } else {
      Fluttertoast.showToast(msg: data["message"].toString());
    }
  }
  var currentversion;
  //terms and condition
  void termsconditions() async {

    var response =
        await BaseClient().get(API().termsmaster).catchError(handleError);

    if (response == null) return;
    var data = json.decode(response);
    if(data != ""){

      termscond.clear();
      termscond = data.where((element) => element["currentversion"] == true).toList();
    }
  }

  //show Avator Master
  // void showAvatorMaster() async {
  //   var response =
  //       await BaseClient().get(API().showAvatorMaster).catchError(handleError);
  //   if (response == null) return;
  //   var data = json.decode(response);
  //   if(data["status"] == "success"){
  //     avatarImageList = data[data];
  //   }
  //
  // }

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
      'document':scandocs.toString(),
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
      accountnumber, swiftcode) async {
    var body = {
      "customerid": GetStorage().read("getuserid"),
      "firstname": firstName,
      "email": email,
      "businessregnumber": businessRegnumber,
      "mobile": phonenumber,
      "bankname": bank,
      "accountnumber": accountnumber,
      "swiftcode": swiftcode,
      // "documnettype": doctypedropdown,
      // "documnet": doc
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
    if (response == null) return;
    var data = jsonDecode(response);
    var data1 = json.decode(data);
    print("-----data" + data);
    // Get.to(AmountPay());
    invoicejson = data1;
    print("------inovice----${invoicejson["Rent"]}");
    // Fluttertoast.showToast(msg: data.toString());
  }

  //forgot password
  void updateForgotPassword(String password) async {
    showLoading();
    var body = {
      "email": emailController.text,
      "password": password
    };
    var response = await BaseClient()
        .post(
        API().updateForgotPassword,
        body)
        .catchError(handleError);
    hideLoading();
    if (response == null) return;
    var data1 = json.decode(response);
    var data = json.decode(data1);

    if (data["status"] == "success") {
      emailController.clear();
      Fluttertoast.showToast(msg: data["message"].toString());
      Get.offAll(Home());
    } else {
      Fluttertoast.showToast(msg: data["message"].toString());
    }
  }



  //forgot password otp
  void forgotPasswordOTP(String email) async {
    showLoading();
    var body = {"email": email};
    var response = await BaseClient()
        .post(
      API().forgotSendOTP,
      body,
    )
        .catchError(handleError);
    hideLoading();
    if (response == null) return;
    var data1 = json.decode(response);
    var data = json.decode(data1);


    if (data["status"] == "success") {
      Get.to(UpdatePasswordCode());
    } else {
      Fluttertoast.showToast(msg: "Something wrong");
    }
  }

  //forgot otp verify
  void forgotOTPVerify(String email,String otp) async {
    showLoading();
    var body = {"email": email,  "otp": otp};
    var response = await BaseClient()
        .post(
        API().forgotOTPVerify,
        body)
        .catchError(handleError);
    hideLoading();
    if (response == null) return;

    var data1 = json.decode(response);
    var data = json.decode(data1);

    if (data["status"] == "success") {
      Get.to(() => UpdatePassword());
    } else {
      Fluttertoast.showToast(msg: data["message"].toString());
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

  //termsandconditions post

  void Termspost() async {

    DateTime datetime = DateTime.now();
    String dateaccpt = datetime.toString();
    var customerids = GetStorage().read("custid");

    var body = {
      "customertermid":"" ,
      "termid": termscond[0]["termid"],
      "termiddesc":termscond[0]["termdetails"],
      "version":termscond[0]["termid"],
      "customerid":customerids,
      "customeriddesc":"",
      "dateofacceptance":dateaccpt,
      "status":termscond[0]["status"]
    };
    var response = await BaseClient()
        .post(API().termsacceptance, body)
        .catchError(handleError);
    log(body.toString());
    if (response == null) return;
    var data = json.decode(response);
    if (data != null) {
      if(data["token"] !=null){
        AuthCon auth = AuthCon();
        GetStorage().write("save_token", data["token"].toString());
        print(data["token"]);
        await auth.getLoginToken();
        auth.onInit();
        GetStorage().write("getuserid", MyApp.logindetails["userid"].toString());
        Get.to(ChoosePaymentPage());

      }

      Fluttertoast.showToast(msg: "success");
    } else {
      Fluttertoast.showToast(msg: "Fail");
    }
  }

  //countrywise document selection api
  void docselect() async {
    if(dropdownvalue != null || MyApp.logindetails != null) {
      var body = {
        "geoid": dropdownvalue != null ? dropdownvalue["geoid"].toString() : MyApp
            .logindetails["geoid"]
      };
      var response = await BaseClient()
          .post(API().countrydoc, body)
          .catchError(handleError);

      if (response == null) return;
      var data = json.decode(response);
      pickdoc.value = data;
    }
  }

  void mandatoryPayeeAPI(String brn) async{
    var body = {
      "brn": brn
    };
    var response = await BaseClient()
        .post(API().mandatoryPayee, body)
        .catchError(handleError);

    if (response == null) return;
    var data = json.decode(response);
    if(data["mandatoryPayee"] != null){

    }
  }


  void getSecurityQuestionAPI() async{

    var response = await BaseClient()
        .get(API().getSecurityQuestion)
        .catchError(handleError);

    if (response == null) return;
    var data = json.decode(response);
    GetStorage().write("questionid", data["questionid"]);
    if(data != [])
    {
      securityQuestionList.value = data;
    }
  }

//security question post api
  void securityPost(String brn) async{
    var customerids = GetStorage().read("custid");
    var questionids = GetStorage().read("questionid");
    var body = {
      {
        "securityquestionid":questionids,
        "customerid":customerids,
        "questionid":questionids,
        "answer":controllers[0],
        "status":""
      }
    };
    var response = await BaseClient()
        .post(API().mandatoryPayee, body)
        .catchError(handleError);

    if (response == null) return;
    var data = json.decode(response);
    if(data["mandatoryPayee"] != null){

    }
  }

}




