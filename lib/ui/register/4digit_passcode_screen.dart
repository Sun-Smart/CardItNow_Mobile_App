// ignore_for_file: unnecessary_import, avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, unnecessary_new, unrelated_type_equality_checks, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:cardit/auth/auth.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';

class Passcode extends StatefulWidget {
  const Passcode({super.key});

  @override
  State<Passcode> createState() => _PasscodeState();
}

class _PasscodeState extends State<Passcode> {
  var otpResult = '';

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5.0));
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController otpCon = TextEditingController();
  final TextEditingController confirmotp = TextEditingController();
  final AuthCon con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bulildbutton(),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(top: 20, bottom: 30),
                margin: EdgeInsets.only(top: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildToptitle(),
                      buildtitle(),
                    ])),
            bulidForm(),
            SizedBox(height: 30)
          ],
        ),
      )),
    );
  }

  Widget buildToptitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back,
                color: themeChange.darkTheme ? Colors.white : Colors.black,
                size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container()
        ]);
  }

  Widget buildtitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        padding: EdgeInsets.all(15),
        child: Text('Set 6 Digit \nPasscode ',
            style: TextStyle(
                fontSize: 28,
                color:
                    themeChange.darkTheme ? Colors.white : HexColor('#004751'),
                fontWeight: FontWeight.bold)));
  }

  Widget bulidForm() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Row(
                      children: [
                        Text("New Passcode",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: PinPut(
                          controller: otpCon,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6)
                          ],
                          followingFieldDecoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(0)),
                          keyboardType: TextInputType.number,
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(0)),
                          selectedFieldDecoration: _pinPutDecoration,
                          fieldsCount: 6)),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Row(
                      children: [
                        Text(
                          "Confirm Passcode",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: PinPut(
                          controller: confirmotp,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6)
                          ],
                          followingFieldDecoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(0)),
                          keyboardType: TextInputType.number,
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(0)),
                          selectedFieldDecoration: _pinPutDecoration,
                          fieldsCount: 6)),
                  SizedBox(height: 20),
                  Container(
                    // width: size.width/2,
                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("note"),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            Text("1. passcode only contains numbers only."),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("2. passcode should not be contains same digits."),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("3. passcode should not be contains continues digits"),
                          ],
                        ),

                        Row(
                          children: [
                            Text("   (ex:123456)."),
                          ],
                        ),


                      ],
                    ),


                  ),
                ])));
  }

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
      onTap: () {
        if (otpCon.text.isEmpty && confirmotp.text.isEmpty) {
          Fluttertoast.showToast(msg: 'Enter your 6 digit passcode');
        } else if (otpCon.text.contains("1" "2" "3" "4" "5" "6")) {
          Fluttertoast.showToast(msg: "Loose Passcode");
        } else if (otpCon.text[0] == otpCon.text[1] &&
            otpCon.text[2] == otpCon.text[3] &&
            otpCon.text[4] == otpCon.text[5]) {
          Fluttertoast.showToast(msg: 'Error Same Number');
        } else if (confirmotp.text[0] == confirmotp.text[1] &&
            confirmotp.text[2] == confirmotp.text[3] &&
            confirmotp.text[4] == confirmotp.text[5]) {
          Fluttertoast.showToast(msg: 'Error Same Number');
        } else if (otpCon.text != confirmotp.text) {
          Fluttertoast.showToast(msg: "Passcode has Mismatched");
        } else {
          // Fluttertoast.showToast(msg: 'Correct');
          con.pinsetapi(con.emailController.text.trim(), otpCon.text);
        }
      },
      text: "Next",
    );
  }
}
