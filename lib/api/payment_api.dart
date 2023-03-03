// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:get_storage/get_storage.dart';
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


  //transaction
  var transactionList = [];

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
        "uploadDoc": pickedFile
      };
      var response = await BaseClient()
          .post(API().lguPaymentDocument, body)
          .catchError(handleError);
      Get.back();
      if (response == null) {
        Fluttertoast.showToast(msg: "Upload Statement of Account Failed");
      } else {
        var data = json.decode(response);
        if (data["status"] == "success") {
           var jsonResponse = json.encode(data["data"]);
           var responce1 = json.decode(jsonResponse);
            var responce = json.decode(responce1);
           var payee = {
          "payee": lguProvince,
          "purpose": lguPurpose,
          "date": {
            "start": startDate.text,
            "end": endDate.text
          }
        };
        // var responce;
        // responce = {
        //   "KEYVALUE": {
        //     "PIN": "003-19-003-07-004",
        //     "Taxpayer": "NACION, FELIX & EDITHA SPS",
        //     "Bill Date": "November 15, 2022",
        //     "Declared Owner": " NACION, FELIX & EDITHA SPS",
        //     "Location": "SAN BARTOLOME",
        //     "BILL AMOUNT": "P 75.68",
        //     "BAR CODE": "00319220022090"
        //   },
        //   "DOCNAME": "MUNICIPAL STATEMENT",
        //   "TableResult": {
        //     "statement summary": [
        //       {
        //         "A/V": "4,730.00",
        //         "PERIOD": "2023",
        //         "BASIC": "47.30",
        //         "D/P1": "-9.46",
        //         "TOTAL": "75.68"
        //       }
        //     ]
        //   }
        // };

        var dateList = responce["TableResult"]["statement summary"] ?? [];
        startYearList = dateList ?? [];
        endYearList = dateList ?? [];
        startYear = startYearList.first;
        endYear = endYearList.last;
        Get.to(PurposeDetails(
            paymentType: type, payee: payee, purpose: responce));
        } else {
          Fluttertoast.showToast(msg: "This is an existing Relationship");
        }
      }}
    else {
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
    if (response == null){
      Fluttertoast.showToast(msg: "Payment Validation Failed");
    } else{
    var dataValue = json.decode(response);
    var data = json.decode(dataValue);
    if (data != null) {
      var date = {
        "start": startYear,
        "end": endYear
      };
    Get.to(OverviewPayment(payee: payee, purpose: purpose, paymentType: type, payment: data, date: date,));
    } else {
      Fluttertoast.showToast(msg: "Payment Validation Wrong");
    }}
  }

  finalPaymentAPI(String type, var payee, var purpose, var payment, var date) async {
    showLoading();
    var body = {
      "transactionid":null,
      "uid": MyApp.logindetails["uid"],
      "recipientuid": payee["payee"]["uid"],
      "recipientid":payee["payee"]["customerid"],
      "PrivateID": null,
      "TransactionType":payee["purpose"]["masterdatadescription"] == "Real property TAX" ? "P": "R",
      "recipientname": '${payee["payee"]["firstname"]} ${payee["payee"]["lastname"] ?? ""}',
      "documentnumber": purpose["KEYVALUE"]["BAR CODE"],
      "additionaldocumentnumber":"",
      "startdate": payee["date"]["start"],
      "expirydate": payee["date"]["end"],
      "address": purpose["KEYVALUE"]["Location"],
      "billdate": purpose["KEYVALUE"]["Bill Date"],
      "contractamount": payment["billamount"],
      "discount": "0.0",
      "carditconvfee": payment["CC_carditnowfee"],
      "payamount": payment["CC_totalamount"],
      "payid": 1,
      "paytype":"O",
      "status":""
    };
    var uri = Uri.parse(API().baseURL + API().lguPayment);
    var payload = json.encode(body);
    var tokens = GetStorage().read("save_token");

    var response = await http
        .post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokens',
          'accept': 'application/json',
        },
        body: payload)
        .timeout(const Duration(seconds: 20));
    hideLoading();
    print(response.statusCode.toString());
    print("body : " + response.body.toString());
    try{
    if (response.statusCode == 200){

        var data = json.decode(response.body);
        if (data != null) {
          var transaction =  data["transactionmaster"];
          Get.to(PaymentSuccessful(payee: payee, purpose: purpose, paymentType: type, payment: payment,transaction: transaction,));
        } else {
          Fluttertoast.showToast(msg: "$data");
        }

    } else {
      var data = json.decode(response.body);
      Fluttertoast.showToast(msg: data);
    }}
    catch(ex){
    Fluttertoast.showToast(msg: "$ex");
    }}


  void transactionListAPI() async {
    var response = await BaseClient()
        .get(API().Paymentpurposedropdown)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    transactionList = data;
  }
}