import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/auth_button.dart';
import '../widgets/custom_input.dart';

class Registerloading extends StatefulWidget {
  const Registerloading({Key? key}) : super(key: key);

  @override
  State<Registerloading> createState() => _RegisterloadingState();
}

class _RegisterloadingState extends State<Registerloading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            color: Color(0XFFffffff),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  topBanner(),
                  buildtitle(),
                ]))));
  }

  Widget topBanner() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0XFFF7F7F7),
        image: DecorationImage(
          image: AssetImage("assets/loading-banner.png"),
          fit: BoxFit.cover,
        ),
      ),
      width: MediaQuery.of(context).size.width / 0.8,
      height: 400,
    );
  }

  Widget buildtitle() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Take a Few Minutes to Relax !',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Sora',
                color: HexColor('#036D7B'),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              'We are verifying your ID and Details. We will notify you once done',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Sora',
                color: Color.fromRGBO(4, 19, 22, 0.6),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              "assets/loading.gif",
              height: 220,
            ),
          ],
        ));
  }
}
