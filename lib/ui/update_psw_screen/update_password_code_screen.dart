// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'dart:ui';

import 'package:cardit/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';

class UpdatePasswordCode extends StatefulWidget {
  const UpdatePasswordCode({super.key});

  @override
  State<UpdatePasswordCode> createState() => _UpdatePasswordCodeState();
}

class _UpdatePasswordCodeState extends State<UpdatePasswordCode> {
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  final AuthCon con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bulildbutton(),
      body: SingleChildScrollView(
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
        SizedBox(height: 10),
      ],
        ),
      ),
    );
  }

  Widget buildToptitle() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container()
        ]);
  }

  Widget buildtitle() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        'Forgot \n Password',
        style: TextStyle(
          fontSize: 28,
          // color: Styles.whitecustomlable,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget bulidForm() {
    return Container(
        child: Form(
            key: formKey,
            child: Stack(children: [
              MyCustomInputBox(
                enabled: true,
                label: "Email Verification Code",
                controller: otpController,
                inputDecoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    helperStyle: TextStyle(fontFamily: 'Sora', fontSize: 14),
                    hintStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.normal,
                        color: Color.fromRGBO(65, 61, 75, 0.6))),
                obsecureText: false,
                inputHint: 'Enter code',
                validator: (value) {},
              ),
              Positioned(
                  right: 20,
                  top: 40,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle:
                          TextStyle(fontSize: 14, color: HexColor('#413D4B')),
                    ),
                    onPressed: () {
                      con.forgotPasswordOTP(con.emailController.text);
                    },
                    child: Text(
                      'Resend',
                      style:
                          TextStyle(fontSize: 14, color: HexColor('#413D4B')),
                    ),
                  )),
            ])));
  }

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        if(otpController.text.isEmpty){
          Fluttertoast.showToast(msg: "Enter your otp");
        }
        else{
          con.forgotOTPVerify(con.emailController.text, otpController.text);
        }
      },
      text: "Next",
    );
  }
}
