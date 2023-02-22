// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:cardit/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../api_endpoints.dart';
import '../base_client.dart';
import '../ui/payment_method/recievermethodscreens/letsstartpage.dart';
import '../ui/register/register_loading_screen.dart';

class BankAPI extends GetxController with BaseController {
  String? businessType;
  var businessTypeList = ["LCU"];
  final businessNameCnl = TextEditingController();
  final businessRegNoCnl = TextEditingController();
  bool isVisibleToAll = false;

  var selectedBank;
  final accountNumberCnl = TextEditingController();
  final swiftCodeCnl = TextEditingController();
  final branchAddressCnl = TextEditingController();

  //loginApi
  void addBankAPI() async {
    Get.to(Registerloading());
    var customerID = GetStorage().read("custid");
    var body = {
        "customerid": customerID.toString(),
        "uid":"",
        "customertype":"R",
        "type":"B",
        "businessname":businessNameCnl.text,
        "ContactName":MyApp.logindetails["username"].toString(),
        "email": MyApp.logindetails["email"][0].toString(),
        "mobile":MyApp.logindetails["mobile"].toString(),
        "geocode": MyApp.logindetails["geoid"].toString(),
        "city":0,
        "pincode":"",
        "bankaccountnumber": accountNumberCnl.text,
        "brn": businessRegNoCnl.text,
        "accountname":accountNumberCnl.text,
        "visibletoall": isVisibleToAll,
        "bankname": selectedBank["bankname"],
        "iban":swiftCodeCnl.text
      };
    var response = await BaseClient()
        .post(API().addBankAccount, body)
        .catchError(handleError);
    Get.back();
    if (response == null) return;
    var data = json.decode(response);
    if (data.toString() == "Success") {
      GetStorage().write("customer_type", "R");
      clearBank();
      Get.off(Letsstartpage());
    } else {
      Fluttertoast.showToast(msg: "Add bank failed".toString());
    }
  }

  clearBank(){
   businessType = null;
   businessNameCnl.clear();
   businessRegNoCnl.clear();
   isVisibleToAll = false;
   selectedBank = null;
   accountNumberCnl.clear();
   swiftCodeCnl.clear();
   branchAddressCnl.clear();
  }
}