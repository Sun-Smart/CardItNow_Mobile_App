// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'dart:async';

import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:local_auth/local_auth.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreens> {
  @override
  void initState() {
    super.initState();
    _navigation();
  }
  bool _authorizedOrNot=false ;
  final LocalAuthentication auth = LocalAuthentication();


  Future<void> _authenticateMe() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        options: AuthenticationOptions(
            biometricOnly: false, stickyAuth: true),
        localizedReason: "Authenticate to use app",

      );
      print(authenticated.toString()+'sss');
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _authorizedOrNot = authenticated ? true : false;
      if(_authorizedOrNot){
        auth.stopAuthentication();

      }
      print(_authorizedOrNot.toString()+'ggg');

    });
  }
  _bioAuth()async{
    if(GetStorage().read('bioAuth').toString()=='true'){
      try {

        final bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate',
            options: const AuthenticationOptions(biometricOnly: false));
        if(didAuthenticate){
          Get.offAll(()=>DashbordScreen());
        }
      } catch (e) {
        print(e.toString());

      }
    }else{
      Get.offAll(()=>DashbordScreen());
    }

  }



  _navigation() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
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
                SvgPicture.asset('assets/lodaingimg.svg',
                    width: 230, height: 65),
                SizedBox(height: 30),
                Text("${"MAKE  YOUR  LIFE  EASY"}",
                    style: TextStyle(
                        fontSize: 15, color: Colors.white, fontFamily: 'sora')),
              ],
            ),
          )),
    );
  }
}
