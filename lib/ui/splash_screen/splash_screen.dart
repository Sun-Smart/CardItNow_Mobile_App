// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:local_auth/local_auth.dart';

import '../../auth/auth.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreens> {
  AuthCon authcon = AuthCon();

  @override
  void initState() {
    super.initState();
    _navigation();
  }

  bool _authorizedOrNot = false;
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> _authenticateMe() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        options: AuthenticationOptions(biometricOnly: true, stickyAuth: true),
        localizedReason: "Authenticate to use app",
      );
      print(authenticated.toString() + 'sss');
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _authorizedOrNot = authenticated ? true : false;
      if (_authorizedOrNot) {
        auth.stopAuthentication();
      }
      print(_authorizedOrNot.toString() + 'ggg');
    });
  }

  _bioAuth() async {
    if (GetStorage().read('bioAuth').toString() == 'true') {
      try {
//kkkk
        final bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate',
            options: const AuthenticationOptions(biometricOnly: true));
        if (didAuthenticate) {
          await authcon.getLoginToken();
          Get.offAll(() => DashbordScreen());
        }
      } catch (e) {
        print(e.toString());
        Get.toNamed('/home');
      }
    } else {
      await authcon.getLoginToken();
      Get.offAll(() => DashbordScreen());
    }
  }

  _navigation() async {
    await Future.delayed(const Duration(milliseconds: 8500), () {});
    if (GetStorage().read('save_token') == null) {
      Get.toNamed('/home');
    } else {
      _bioAuth();
    }
    // Get.toNamed('/home');
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
                  // height: 220,
                  //color: Colors.blueGrey,
                ),
                // SvgPicture.asset('assets/lodaingimg.svg',
                //     width: 230, height: 65),
                SizedBox(height: 30),
                // Text("${"MAKE  YOUR  LIFE  EASY"}",
                //     style: TextStyle(
                //         fontSize: 15, color: Colors.white, fontFamily: 'sora')),
              ],
            ),
          )),
    );
  }
}
