import 'dart:async';

import 'package:cardit/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    await Future.delayed(const Duration(seconds: 5), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: HexColor('#004751'),
          body: Center(
            child: SvgPicture.asset(
              'assets/lodaingimg.svg',
              width: 190,
              height: 58,
            ),
          )),
    );
  }
}
