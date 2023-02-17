// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'dart:convert';
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
    //customerID.toString()
    var body = {
        "customerid":"232",
        "uid":"",
        "customertype":"R",
        "type":"B",
        "businessname":businessNameCnl.text,
        "ContactName":"",
        "email":"",
        "mobile":"",
        "geocode":"",
        "city":0,
        "pincode":"",
        "bankaccountnumber": accountNumberCnl.text,
        "brn": businessRegNoCnl.text,
        "accountname":accountNumberCnl.text,
        "visibletoall": isVisibleToAll ? "1" : "0",
        "bankname": selectedBank["bankname"],
        "iban":swiftCodeCnl.text
      };
    var response = await BaseClient()
        .post(API().addBankAccount, body)
        .catchError(handleError);
    Get.back();
    if (response == null) return;
    var data = json.decode(response);
    if (data["status"].toString() == "true") {
      clearBank();
      Get.to(Letsstartpage());
    } else {
      Fluttertoast.showToast(msg: data["message"].toString());
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