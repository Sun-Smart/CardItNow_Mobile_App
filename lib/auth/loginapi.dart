// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:cardit/auth/auth.dart';
import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/widgets/drawer_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '../base_client.dart';
import '../main.dart';
import '../responsive/responsive.dart';
import '../ui/register/verify_userid_screen.dart';

class loginauth extends GetxController with BaseController {

  @override
  void onInit() {
    super.onInit();
  }

  final emailController = TextEditingController();

  //loginApi
  void loginAPI(email, password, bool ischecked_checkbox) async {
    showLoading();
    var response = await BaseClient()
        .get("Token?email=$email&Password=$password")
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    hideLoading();

    if (data["token"].toString()!="null") {
      AuthCon auth = AuthCon();
      GetStorage().write("save_token", data["token"].toString());
      await auth.getLoginToken();
      auth.onInit();
      GetStorage().write("getuserid", MyApp.logindetails["userid"].toString());
      if(MyApp.logindetails["status"] == "A"){
        // Get.to(DashbordScreen());
        // Get.to(kIsWeb?DrawerWeb():DashbordScreen());
        MaterialPageRoute(
            builder: (context) =>
                Responsive.isDesktop(context) ? DrawerWeb() : DashbordScreen());
      } else{
        Get.to(VerifyUserId());
      }
    } else {
      Fluttertoast.showToast(msg: data.toString());
    }
  }
}