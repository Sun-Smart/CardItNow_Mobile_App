import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../api_endpoints.dart';
import '../base_client.dart';


class cardsapi extends GetxController with BaseController {

  @override
  void onInit() {

    creditCardgetAPI();

    super.onInit();
  }
  final emailController = TextEditingController();

  var banklist = [];
  var paymentpurposelist = [];

  var invoicejson = {};

  //credit card get
  var creditCardGet = [].obs;

  var documenttypelist = [];

  //your Details
  var Owner = {}.obs;


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


}