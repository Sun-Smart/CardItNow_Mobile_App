// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

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

  _navigation() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    if (GetStorage().read('save_token') == null) {
      Get.toNamed('/home');
    } else {
      Get.toNamed('/dashbordScreen');
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
