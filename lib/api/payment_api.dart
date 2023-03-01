// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../api_endpoints.dart';
import '../base_client.dart';
import '../main.dart';
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

  //loginApi
   newPaymentVerificationAPI() async {
    // showLoading();
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
    Get.to(PurposeDetails(purpose: body,));
    // var response = await BaseClient()
    //     .post(API().newPaymentVerify, body)
    //     .catchError(handleError);
    // hideLoading();
    // if (response == null) return;
    // var data = json.decode(response);
    // if (data.toString() == "Success") {
    //   return "Success";
    // } else {
    //   Fluttertoast.showToast(msg: "This is an existing Relationship");
    //   return null;
    // }
  }

  void newPaymentDocumentAPI() async {
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
       };
       var file = await http.MultipartFile.fromPath(
           'file', pickedFile!.path);
       var response = await BaseClient()
           .post(API().newPaymentDocument, body, isMultiPart: true, file: file)
           .catchError(handleError);
       hideLoading();
       if (response == null) return;
       var data = json.decode(response);
       if (data.toString() == "Success") {
         Get.to(PurposeDetails());
       } else {
         Fluttertoast.showToast(msg: "This is an existing Relationship");
       }
     }
      else{
       Fluttertoast.showToast(msg: "Please Upload Contract/Invoice");
     }
  }
}