// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:cardit/api/regster_api.dart';
import 'package:cardit/api/regster_api.dart';
import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/widgets/drawer_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../base_client.dart';
import '../main.dart';
import '../ui/payment_method/recievermethodscreens/credit_prepaid_screen.dart';
import '../ui/register/verify_userid_screen.dart';

class LoginAPI extends GetxController with BaseController {


  //loginApi
  void loginAPI(email, password, bool ischecked_checkbox,context) async {
    showLoading();
    var response = await BaseClient()
        .get("Token?email=$email&Password=$password")
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    hideLoading();
//
    if (data["token"].toString()!="null") {
      RegisterAPI auth = RegisterAPI();
      GetStorage().write("save_token", data["token"].toString());
      await auth.getLoginToken();
      auth.onInit();
      GetStorage().write("getuserid", MyApp.logindetails["userid"].toString());
      if(MyApp.logindetails["status"] == "A"){
        Get.offAll(kIsWeb?DrawerWeb():MyApp.logindetails["customertype"] == "I" ? DashbordScreen() : CreditPrepaidScreen());
      } else{
         RegisterAPI con1 = Get.find();
         con1.emailController.text = email;
         if(con1.pickcountry.isNotEmpty){
           RegisterAPI.dropdownvalue = con1.pickcountry.where((element) => element["geoid"].toString() == MyApp.logindetails["geoid"]).first;
         }
         GetStorage().write("custid", MyApp.logindetails["userid"].toString());
        Get.to(VerifyUserId());
      }
    } else {
      _showMyDialog(context);
      // Fluttertoast.showToast(msg: data["message"].toString());
    }
  }
  _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
   // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title:const Icon(Icons.warning,color: Colors.red,),
        content:  const Text('Oh Oh ! Invalid credentials. Please try again or click help me to continue',
        style: TextStyle(
          fontSize: 14,
          fontFamily: "Sora"
        ),),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

}