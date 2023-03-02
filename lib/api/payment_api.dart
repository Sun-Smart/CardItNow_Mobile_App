// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../api_endpoints.dart';
import '../base_client.dart';
import '../main.dart';
import '../ui/dashboard/paynow_menu/payment_overview_dashboard.dart';
import '../ui/loan_screen/payment_successful.dart';
import '../ui/payment/payee_loading.dart';
import '../ui/payment/purpose_details.dart';
import '../ui/register/register_loading_screen.dart';
import 'card_api.dart';

class PaymentAPI extends GetxController with BaseController {
  CardAPI card = CardAPI();
  var paymentPurposeList = [{"name":"Rent"}];
  var paymentPurpose;
  var paymentSubPurposeList = [{"name":"Monthly Rent"},{"name":"Advance Rent"},{"name":"Security Deposit"}];
  var paymentSubPurpose;
  var provinceList = [{"name":"Vellore"},];
  var province;
  var cityList = [{"name":"Tirupattur"}];
  var city;
  final propertyOwnerNameCnl = TextEditingController();
  final addressNoCnl = TextEditingController();
  final streetNameCnl = TextEditingController();
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  final postalCode = TextEditingController();
  var pickedFile;

  //LGU payee
  var lguPurposeList = [].obs;
  var lguPurpose;
  var lguProvinceList = [];
  var lguProvince;
  final PINCnl = TextEditingController();
  final billAmountCnl = TextEditingController();

  //purpose details
  var payeeTypeList = [{"name":"Property Owner"}, {"name":"Property Management Company"}];
  var payeeType;
  final payeeNameCnl = TextEditingController();
  final payeeEmailCnl = TextEditingController();
  final payeeMobileCnl = TextEditingController();
  final accountNoCnl = TextEditingController();
  var bankDetails;
  var accountTypeList = ["Saving", "Current"];
  String? accountType = "Saving";
  TextEditingController paymentController = TextEditingController();

  //LGU purpose details
  var startYearList = [];
  var startYear;
  var endYearList = [];
  var endYear;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPurposeListAPI();
    getProvinceListAPI();
  }
  //Get LGU
  void getPurposeListAPI() async {
    var response = await BaseClient()
        .get(API().getLGUPurpose)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    lguPurposeList.value = data;
  }

  void getProvinceListAPI() async {
    var response = await BaseClient()
        .get(API().getLGUPayee)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    lguProvinceList = data;
  }

  //newPayVerifyAPI
   newPaymentVerificationAPI(String type, var payee) async {
    showLoading();
    var body = {
      "customerid": MyApp.logindetails["userid"],
      "purpose": paymentPurpose,
      "subpurpose": paymentSubPurpose,
      "province": province,
      "city": city,
      "owner": propertyOwnerNameCnl.text,
      "addressno": addressNoCnl.text,
      "streetname": streetNameCnl.text,
      "startdate": startDate.text,
      "enddate": endDate.text,
      "postal": postalCode.text,
    };
    var response = await BaseClient()
        .post(API().newPaymentVerify, body)
        .catchError(handleError);
    hideLoading();
    if (response == null) return;
    var data = json.decode(response);
    if (data.toString() == "Success") {
      return "Success";
    } else {
      Fluttertoast.showToast(msg: "This is an existing Relationship");
      return null;
    }
  }

  void newPaymentDocumentAPI(String type, var payee) async {
     if(pickedFile != null) {
       Get.to(Registerloading());
       var body = {
         "customerid": MyApp.logindetails["userid"],
         "purpose": paymentPurpose["name"],
         "subpurpose": paymentSubPurpose["name"],
         "province": province["name"],
         "city": city["name"],
         "owner": propertyOwnerNameCnl.text,
         "addressno": addressNoCnl.text,
         "streetname": streetNameCnl.text,
         "startdate": startDate.text,
         "enddate": endDate.text,
         "postal": postalCode.text,
         "file": pickedFile
       };
       var response = await BaseClient()
           .post(API().newPaymentDocument, body, isMultiPart: true)
           .catchError(handleError);
      Get.back();
       if (response == null) return;
       var data = json.decode(response);
       if (data.toString() == "Success") {
         Get.to(PurposeDetails(paymentType:type, payee: payee, purpose: body));
       } else {
         Fluttertoast.showToast(msg: "This is an existing Relationship");
       }
     }
      else{
       Fluttertoast.showToast(msg: "Please Upload Document");
     }
  }

  //LGU Payee Verification
  lguPaymentVerificationAPI(String type, var payee) async {
    showLoading();
    var body = {
      "customerid": MyApp.logindetails["userid"],
      "purpose": lguPurpose["masterdatadescription"] == "Real property TAX" ? "P": "",
      "municipality": lguProvince["customerid"],
      "province": "Ilocos Norte",
      "pin": PINCnl.text,
      "billamount": billAmountCnl.text,
      "startdate": startDate.text,
      "enddate": endDate.text,
    };
    var response = await BaseClient()
        .post(API().lguPaymentVerify, body)
        .catchError(handleError);
    hideLoading();
    if (response == null) return;
    var dataValue = json.decode(response);
    var data = json.decode(dataValue);
    if (data["status"] == "success") {
      return "Success";
    } else {
      Fluttertoast.showToast(msg: "This is an existing Relationship");
      return null;
    }
  }

  void lguPaymentDocumentAPI(String type, var payee) async {
    if(pickedFile != null) {
       Get.to(Registerloading());
      var body = {
        "customerid": MyApp.logindetails["userid"],
        "purpose": lguPurpose["masterdatadescription"] == "Real property TAX" ? "P": "",
        "municipality": lguProvince["customerid"],
        "province": "Ilocos Norte",
        "pin": PINCnl.text,
        "billamount": billAmountCnl.text,
        "startdate": startDate.text,
        "enddate": endDate.text,
        "uploadDoc": pickedFile
      };
      var response = await BaseClient()
          .post(API().lguPaymentDocument, body)
          .catchError(handleError);
       Get.back();
      if (response == null) return;
      var data = json.decode(response);
     // if (data["status"] == "success") {
        // var jsonResponse = json.encode(data["data"]);
        // var responce = json.decode(jsonResponse);
        var responce;
       responce = {
          "KEYVALUE": {
            "PIN":"003-19-003-07-004",
            "Taxpayer":"NACION, FELIX & EDITHA SPS",
            "Bill Date":"November 15, 2022",
            "Declared Owner":" NACION, FELIX & EDITHA SPS",
            "Location":"SAN BARTOLOME",
            "BILL AMOUNT":"P 75.68",
            "BAR CODE":"00319220022090"
          },
          "DOCNAME":"MUNICIPAL STATEMENT",
          "TableResult":{
            "statement summary":[
              {
                "A/V":"4,730.00",
                "PERIOD":"2023",
                "BASIC":"47.30",
                "D/P1":"-9.46",
                "TOTAL":"75.68"
              }
            ]
          }
        };

        var dateList = responce["TableResult"]["statement summary"] ?? [];
          startYearList = dateList ?? [];
          endYearList = dateList ?? [];
          startYear = startYearList.first;
          endYear = endYearList.last;
          Get.to(PurposeDetails(
              paymentType: type, payee: payee, purpose: responce));
      // } else {
      //   Fluttertoast.showToast(msg: "This is an existing Relationship");
      // }
    }
    else{
      Fluttertoast.showToast(msg: "Please Upload Statement of Account");
    }
  }

  //LGU Payee Verification
  lguPaymentDetailsAPI(String type, var payee, var purpose, String billAmount) async {
    showLoading();
    var body = {
      "billamount": billAmount,
    };
    var response = await BaseClient()
        .post(API().lguPaymentDetails, body)
        .catchError(handleError);
    hideLoading();
    if (response == null) return;
    var dataValue = json.decode(response);
    var data = json.decode(dataValue);
    if (data != null) {
    Get.to(OverviewPayment(payee: payee, purpose: purpose, paymentType: type, payment: data,));
    } else {
      Fluttertoast.showToast(msg: "This is an existing Relationship");
      return null;
    }
  }

  finalPaymentAPI(String type, var payee, var purpose, var payment) async {
    // showLoading();
    var body = {
      "customerid": MyApp.logindetails["userid"],
    };
    // var response = await BaseClient()
    //     .post(API().newPaymentVerify, body)
    //     .catchError(handleError);
    // hideLoading();
    // if (response == null) return;
    // var data = json.decode(response);
    // if (data.toString() == "Success") {
    Get.to(PaymentSuccessful(payee: payee, purpose: purpose, paymentType: type, payment: payment,));
    // } else {
    //   Fluttertoast.showToast(msg: "This is an existing Relationship");
    //   return null;
    // }
  }

}