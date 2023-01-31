// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '../base_client.dart';

class loginauth extends GetxController with BaseController {

  @override
  void onInit() {
    super.onInit();
  }
  final emailController = TextEditingController();
  //loginApi
  void loginAPI(email, password, bool ischecked_checkbox) async {
    print("working");
    showLoading();
    var response = await BaseClient()
        .get("Token?email=$email&Password=$password")
        .catchError(handleError);
    print(email);
    print(password);
    if (response == null) return;
    var data = json.decode(response);
    if (ischecked_checkbox == true) {
      GetStorage().write("save_token", data["token"].toString());
    } else {

    }
    hideLoading();

    if (data["token"].toString()!="null") {
      String token = data.toString();
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      print("Chocoboy" + payload.toString());
      print("response " + data.toString());
      GetStorage().write("getuserid", payload["userid"].toString());
      print("useridcheck" + payload["userid"].toString());
      var getuserid = payload["userid"].toString();
      GetStorage().write("save_token", data["token"].toString());
      Get.to(DashbordScreen());

    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }
}