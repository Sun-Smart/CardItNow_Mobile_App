// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cardit/api/payment_api.dart';
import 'package:cardit/ui/auth/update_password_code_screen.dart';
import 'package:cardit/ui/dashboard/paynow_menu/payment_loading.dart';
import 'package:cardit/ui/auth/login_screen.dart';
import 'package:cardit/ui/landingscreens/choose_securityqus.dart';
import 'package:cardit/ui/payment_method/choose_payment_method.dart';
import 'package:cardit/ui/register/congratsfiles/passcodecongrats.dart';
import 'package:cardit/ui/auth/update_password_screen.dart';
import 'package:cardit/ui/register/twofactor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import '../ui/register/verify_email_screen.dart';
import '../ui/splash/home_screen.dart';
import '../widgets/stepper.dart';
var mocktermscond;
var ShuftiProValues;
 Shuftipro web=  Shuftipro();
           
class RegisterAPI extends GetxController with BaseController {
  PaymentAPI pay = PaymentAPI();
  var profileinfo = {}.obs;
  var scandocs = '';
  File? image;

  // terms and conditions
  var termscond = [];
  var banklist = [];
  var paymentpurposelist = [];

  var invoicejson = {};

  // avatar
  var avatarImageList = [];

  // geoaccess
  var geoacclist;

  var drawercountry = "CM".obs;

  var documenttypelist = [];
  var regDoc = '';
  var uploadimg = '';
  String choosedDocId = '';
  var googleMail = '';

  //your Details
  var Owner = {}.obs;

  //choose country
  var pickcountry = [];
  var securedetailslist = [].obs;
  var privacycontent = {}.obs;
  var questionslist = [].obs;
  RxList pickcity = [].obs;
  RxList pickdoc = [].obs;

  RxList securityQuestionList = [].obs;

  // login
  final emailController = TextEditingController();
  final securityquestioncontroller = TextEditingController();


  dynamic dropdownvalue;
  dynamic dropdownvalueCity;
  dynamic countrywisedoc;
  dynamic securequestions;

  //PROFILE INFORMATION SCREEN
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController dateOfBrithController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController expiredDateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController buildingNameController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();

  //VERIFY USERID SCREEN
  TextEditingController documentIDController = TextEditingController();
  

  @override
  void onInit() {
      //web.loadreference();
    termsconditionsfun();
    geoaccess();
    countryselection();
    getSecurityQuestionAPI();
    privacypolicy();

    if (GetStorage().read('save_token').toString() != "null") {
      docselect();
      taxDetailsGetApi();
      banklistget();
      documenttypeget();
      paymentpurposeget();
      invoicegetmethod();
      pay.transactionListAPI();
    }
    super.onInit();
  }

  getLoginToken() {
    var token = GetStorage().read('save_token');
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    print(payload);
    MyApp.logindetails = payload;
    if (GetStorage().read("customer_type") != null) {
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
    if (data1 != "Your account already register") {
      var data = json.decode(data1);
      GetStorage().write("custid", data["customerid"]);
      print(data);
      print(data["OTP"]);
      if (data["status"]=="success") {
        if(kIsWeb){
           pageController!.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.linear);
        }
        else{
            Get.to(VerifyEmail());
        }
        Fluttertoast.showToast(msg: data["message"].toString());
      } else {
        Fluttertoast.showToast(msg: data["message"].toString());
      }
    }else{
      Fluttertoast.showToast(msg: "Your Account Already Register");
    }

  }

  //resendotp
  void resend(email) async {
    showLoading();
    var body ={
      "email":emailController.text,
    };

    var response = await BaseClient()
        .post(API().ResendOTP, body)
        .catchError(handleError);
    if (response == null) return;

    var data1 = json.decode(response);
    var data = json.decode(data1);
      print(data);

    hideLoading();

      if (data["status"]=="success") {
        Fluttertoast.showToast(msg: data["message"].toString());
      } else {
        Fluttertoast.showToast(msg: data["message"].toString());
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
    if (data != "Fail" && data != "not match") {
      if (data == "success") {
        if (kIsWeb) {
          pageController!.nextPage(
              duration: Duration(milliseconds: 200), curve: Curves.linear);
        } else {
          Get.to(() => Passcode());
        }

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
  void profileInformatrion() async {

    var body = {
      "email": emailController.text,
      "firstname": firstNameController.text,
      "lastname": lastNameController.text,
      "nickname": nickNameController.text,
      "mobile": mobileNoController.text,
      "dateofbirth": dateOfBrithController.text,
      "address": addressController.text,
      "geoid": dropdownvalue["geoid"],
      "cityid": dropdownvalueCity["cityid"],
      "postalcode": postalCodeController.text,
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
      if (kIsWeb) {
        pageController!.nextPage(
            duration: Duration(milliseconds: 200), curve: Curves.linear);
      } else {
        Get.to(SecurityQuestion());
      }
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

  assignProfileInfo(){
    if(ShuftiProValues != null) {
      var values = ShuftiProValues["verification_data"];
      var shuftiName = values["document"]["name"];
      var info = ShuftiProValues["info"]["geolocation"];
      firstNameController.text = shuftiName["first_name"] ?? "";
      middleNameController.text = shuftiName["middle_name"] ?? "";
      lastNameController.text = shuftiName["last_name"] ?? "";
      nickNameController.text = "";
      mobileNoController.text = "";
      dateOfBrithController.text = values["document"]["dob"] ?? "";
      genderController.text = values["document"]["gender"] == "F" ? "Female" : "Male";
      addressController.text = "";
      buildingNameController.text = "";
      streetNameController.text = "";
      postalCodeController.text = info["postal_code"] ?? "";
      documentIDController.text = values["document"]["document_number"] ?? "";
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
                '?email=${googleMail == '' ? email : email}' +
                '&pin=' +
                pin,
            body)
        .catchError(handleError);
    if (response == null) return;
    var data1 = json.decode(response);
    var data = json.decode(data1);
    if (data["status"] == "success") {
      if (kIsWeb) {
        pageController!.nextPage(
            duration: Duration(milliseconds: 200), curve: Curves.linear);
      } else {
        Get.to(() => passcodecongrats());
      }

      // Get.to(VerifyUserId());
      Fluttertoast.showToast(msg: data["message"].toString());
    } else {
      Fluttertoast.showToast(msg: data["message"].toString());
    }
  }
  var currentversion;
  //terms and condition
  void termsconditionsfun() async {

    var response =
        await BaseClient().get(API().termsmaster).catchError(handleError);

    if (response == null) return;
    var data = json.decode(response);
    if (data != "") {
      termscond.clear();
      termscond =
          data.where((element) => element["currentversion"] == true).toList();
    }
  }

  //upload Avator and Selfi
  void avatorSelfi(avator) async {
    showLoading();
    var body = {};
    if (image != null) {
      var file = await http.MultipartFile.fromPath('Imagefile', image!.path);
      var response = await BaseClient()
          .post(API().uploadAvator, body,
              isMultiPart: true, file: file)
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
    log(scandocs);
    var response =
        await BaseClient().post(API().processocr, body).catchError(handleError);
    Get.back();
    if (response == null) return;
    var data = json.decode(response);

    if (data != null) {
      profileinfo.value = data;
      if (kIsWeb) {
        pageController!.nextPage(
            duration: Duration(milliseconds: 200), curve: Curves.linear);
      }
      // Get.to(AvatarPageView());
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

  void uploadDocx(email, docid) async {
    Get.to(Registerloading());
    var body = {
      'email': emailController.text,
      'documenttype': countrywisedoc["key"],
      'document':"",
      'documentid': docid.toString(),
      'selfi': ""
    };
    var response = await BaseClient()
        .post(
            API().uploadProcessDocument,
            body)
        .catchError(handleError);
    Get.back();
    var data1 = json.decode(response);
    var data = jsonDecode(data1);
    if (response == null) return;

    await Get.to(AvatarPageView());
    if (data["status"]=="success") {
      Get.offAll(AvatarPageView());
      Fluttertoast.showToast(msg:data["message"]);
    } else {
      Fluttertoast.showToast(msg:data["message"]);
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
      "swiftcode": swiftcode
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
    print("-----data-------$banklist");
  }

  void paymentpurposeget() async {
    var response = await BaseClient()
        .get(API().Paymentpurposedropdown)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    paymentpurposelist = data;

    print("-----data-------$paymentpurposelist");
  }

  void invoicegetmethod() async {
    var response =
        await BaseClient().get(API().invoiceget).catchError(handleError);
    if (response == null) return;
    var data = jsonDecode(response);
    var data1 = json.decode(data);
    print("-----data" + data);
    invoicejson = data1;
    print("------inovice----${invoicejson["Rent"]}");
  }

  //forgot password
  void updateForgotPassword(String password) async {
    showLoading();
    var body = {
      "email": emailController.text,
      "pin": password
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
  void forgotPasswordOTP(String email,) async {
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
      securitydetail(custidval: data["customerid"]);
      Get.to(ChooseSecQus(customeridqusestion: data["customerid"]));

      // Get.to(UpdatePasswordCode());
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
        RegisterAPI auth = RegisterAPI();
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

    if(data != [])

    {
      securityQuestionList.value = data;
    }
  }

//security question post api

  void securityPost(List answerList) async {

    var storedquestions = {
    "securityquestions":[{
    "questiondetails": answerList
    }]};

    var response = await BaseClient()
        .post(API().securitypost,storedquestions)
        .catchError(handleError);

    if (response == null) return;
    var data = json.decode(response);
    if (data != null) {
      if (kIsWeb) {
        pageController!.nextPage(
            duration: Duration(milliseconds: 200), curve: Curves.linear);

        // Get.to(termsandconditions());
      } else {
        Get.to(Twofactor());
      }
    } else {
      Fluttertoast.showToast(msg: "Something Went Wrong");
    }
  }

  //securityquestiondetails
  void securitydetail({custidval}) async {

    var response = await BaseClient()
        .get(API().securitydetails + custidval.toString())
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    securedetailslist.value = data["customersecurityquestiondetail"];
  }

  //security questions check

  void securitycheck(List checklist) async {

    var storedquestions = {
      "securityquestions":[{
        "questiondetails": checklist
      }]};

    var response = await BaseClient()
        .post(API().securityanswers,storedquestions)
        .catchError(handleError);

    if (response == null) return;
    var data = json.decode(response);
    if (data = true) {
      if (kIsWeb) {
        pageController!.nextPage(
            duration: Duration(milliseconds: 200), curve: Curves.linear);

        //
      } else {
        Get.to(UpdatePasswordCode());
        Fluttertoast.showToast(msg: "Success");
      }
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }

  //privacyclause get

  void privacypolicy() async {
    var response = await BaseClient()
        .get(API().privacyclausecontent)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    privacycontent.value = data["privacypolicy"];
  }

  }

Future<void> readJson() async {
  final String response = await rootBundle.loadString('assets/mockjsonfile.json');
  final data = await json.decode(response);
  print(data);

  mocktermscond.clear();
  mocktermscond = data;

}












