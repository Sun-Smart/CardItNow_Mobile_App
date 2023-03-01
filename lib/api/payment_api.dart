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
import '../ui/payment/payee_loading.dart';
import '../ui/payment/purpose_details.dart';

class PaymentAPI extends GetxController with BaseController {
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
  var lguPurposeList = [
    {
    "id": 1,
    "name":" Real Property Tax,"
    }
  ];
  var lguPurpose;
  var lguProvinceList = [
    {
    "id": 1,
    "municipality":"TNMuni",
      "province":"Vellore"
    },
    {
      "id": 2,
      "municipality":"TNMuni 1",
      "province":"Vellore"
    },
  ];
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
       showLoading();
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
       hideLoading();
       if (response == null) return;
       var data = json.decode(response);
       if (data.toString() == "Success") {
         Get.to(PurposeDetails(paymentType:type, payee: payee, purpose: body));
       } else {
         Fluttertoast.showToast(msg: "This is an existing Relationship");
       }
     }
      else{
       Fluttertoast.showToast(msg: "Please Upload Contract/Invoice");
     }
  }

  //LGU Payee Verification
  lguPaymentVerificationAPI(String type, var payee) async {
    showLoading();
    var body = {
      "customerid": MyApp.logindetails["userid"],
      "purpose": lguProvince["name"],
      "municipality": lguProvince["municipality"],
      "province": lguProvince["province"],
      "pin": PINCnl.text,
      "billamount": billAmountCnl.text,
      "startdate": startDate.text,
      "enddate": endDate.text,
    };
    Get.to(PurposeDetails(paymentType:type, payee: payee, purpose: body));
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

  void lguPaymentDocumentAPI(String type, var payee) async {
    //if(pickedFile != null) {
    //  showLoading();
      var body = {
        "customerid": MyApp.logindetails["userid"],
        "purpose": lguProvince["name"],
        "municipality": lguProvince["municipality"],
        "province": lguProvince["province"],
        "pin": PINCnl.text,
        "billamount": billAmountCnl.text,
        "startdate": startDate.text,
        "enddate": endDate.text,
        "file": pickedFile
      };
      // var file = await http.MultipartFile.fromPath(
      //     'file', pickedFile!.path);
      // var response = await BaseClient()
      //     .post(API().newPaymentDocument, body, isMultiPart: true)
      //     .catchError(handleError);
      // hideLoading();
      // if (response == null) return;
      // var data = json.decode(response);
      // if (data.toString() == "Success") {
      var responce =  {
          "payeeid": "1",
          "ownername": lguProvince["municipality"],
        "image":"url",
        "location": lguProvince["province"],
        "billamount": billAmountCnl.text,
        "year":[
          {
            "id":"1",
            "year":"2022",
            "amount": "200"
          },
          {
            "id":"2",
            "year":"2023",
            "amount": "200"
          },
          {
            "id":"3",
            "year":"2024",
            "amount": "200"
          }
        ],
        "pin": PINCnl.text,
        "purpose": lguProvince["name"],
    };
      startYearList = responce["year"];
      endYearList = responce["year"];
      startYear = startYearList.first;
      endYear = endYearList.last;
        Get.to(PurposeDetails(paymentType:type, payee: payee, purpose: responce));
    //   } else {
    //     Fluttertoast.showToast(msg: "This is an existing Relationship");
    //   }
    // }
    // else{
    //   Fluttertoast.showToast(msg: "Please Upload Statement of Account");
    // }
  }

  //LGU Payee Verification
  lguPaymentDetailsAPI(String type, var payee, var purpose, String billAmount) async {
    // showLoading();
    var body = {
      "customerid": MyApp.logindetails["userid"],
      "owner": purpose["ownername"] ?? "",
      "location": purpose["location"] ?? "",
      "billamount": billAmount,
      "startyear": startYear["id"],
      "endyear": endYear["id"],
      "pin": purpose["pin"] ?? ""
    };
    // var response = await BaseClient()
    //     .post(API().newPaymentVerify, body)
    //     .catchError(handleError);
    // hideLoading();
    // if (response == null) return;
    // var data = json.decode(response);
    // if (data.toString() == "Success") {
    var responce = {
      "txdid": "13232",
      "invoiceno": "11222",
      "paystatus": "paying",
      "billamount": billAmount,
      "carditnowfee": "40",
      "totalamount": (double.parse(billAmount) + 40).toString(),
      "feereason": "free reason content",
    };
    Get.to(OverviewPayment(payee: payee, purpose: purpose, paymentType: type, payment: responce,));
    // } else {
    //   Fluttertoast.showToast(msg: "This is an existing Relationship");
    //   return null;
    // }
  }
}