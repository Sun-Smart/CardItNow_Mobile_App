// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'package:cardit/main.dart';
import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/ui/register/verify_userid_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:local_auth/local_auth.dart';
import '../../api/regster_api.dart';
import '../payment_method/recievermethodscreens/credit_prepaid_screen.dart';
import 'home_screen.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreens> {
  RegisterAPI authcon = RegisterAPI();
  final LocalAuthentication auth = LocalAuthentication();
  @override
  void initState() {
    super.initState();
    _navigation();
  }

  // bool _authorizedOrNot = false;


  // Future<void> _authenticateMe() async {
  //   bool authenticated = false;
  //   try {
  //     authenticated = await auth.authenticate(
  //       options: AuthenticationOptions(biometricOnly: true, stickyAuth: true),
  //       localizedReason: "Authenticate to use app",
  //     );
  //     print(authenticated.toString() + 'sss');
  //   } catch (e) {
  //     print(e);
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     _authorizedOrNot = authenticated ? true : false;
  //     if (_authorizedOrNot) {
  //       auth.stopAuthentication();
  //     }
  //     print(_authorizedOrNot.toString() + 'ggg');
  //   });
  // }

  _bioAuth() async {
    if (GetStorage().read('bioAuth').toString() == 'true') {
      try {
        final bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate',
            options: const AuthenticationOptions(biometricOnly: true));
        if (didAuthenticate) {
          await authcon.getLoginToken();
          Get.offAll(()=>MyApp.logindetails["status"] == "A"?
        MyApp.logindetails["customertype"] == "I" ? DashbordScreen() : CreditPrepaidScreen():
          VerifyUserId());

        }
      } catch (e) {
        print("BIO : " + e.toString());
        Get.offAll(Home());
      }
    } else {
      await authcon.getLoginToken();
      Get.offAll(()=>MyApp.logindetails["status"] == "N"?
      MyApp.logindetails["customertype"] == "I" ? DashbordScreen() : CreditPrepaidScreen():
      VerifyUserId());
    }
  }

  _navigation() async {
    await Future.delayed( Duration(milliseconds: 8000), () {});
    if (GetStorage().read('save_token') == null) {
      Get.offAll(Home());
    } else {
      _bioAuth();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: HexColor('#004751'),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/giflogo.gif",
                ),
                SizedBox(height: 30), ],
            ),
          )),
    );
  }
}
