// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:cardit/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../responsive/responsive.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';

final phonenumberController = TextEditingController();

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final formKey = GlobalKey<FormState>();
  final AuthCon con = Get.find();
  final _otpController = TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0XFFffffff),
      // bottomNavigationBar: bulildbutton(),
      body: Container(
          // color: Color(0XFFffffff),
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: Responsive.isMobile(context)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(top: 10, bottom: 30),
                margin: EdgeInsets.only(top: 30),
                child: Column(
                    crossAxisAlignment: Responsive.isMobile(context)
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      buildToptitle(),
                      buildtitle(),
                    ])),
            bulidForm(),
            SizedBox(height: 10),
            emailText(),
            // AuthButton(
            //     decoration: BoxDecoration(
            //       color: HexColor('#CEE812'),
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //     onTap: () {
            //       Navigator.of(context).pushNamed(
            //         '/verifyuserid',
            //       );
            //       if (formKey.currentState!.validate()) {}
            //     },
            //     text: "Next"),
          ],
        ),
      )),
      bottomSheet: bulildbutton(),
    );
  }

  Widget buildToptitle() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        crossAxisAlignment: Responsive.isMobile(context)
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.close, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container()
        ]);
  }

  Widget buildtitle() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        'Verify Your Email Id ',
        style: TextStyle(
          fontSize: 28,
          // color: themeChange.darkTheme ? Colors.white : HexColor('#004751'),
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
                label: "Enter the verification code ",
                controller: phonenumberController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                obsecureText: false,
                inputHint: 'Enter Verification Code',
                validator: (value) {},
                inputDecoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Verification Code',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  helperStyle:
                      const TextStyle(fontFamily: 'Sora', fontSize: 14),
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.normal,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  focusColor: Colors.grey.shade300,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      gapPadding: 7,
                      borderSide: const BorderSide(color: Colors.grey)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.grey)),
                  errorStyle: const TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  right: Responsive.isMobile(context)
                      ? 20
                      : Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 2.5
                          : MediaQuery.of(context).size.width / 3.2,
                  top: 40,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 14, color: HexColor('#036D7B'))),
                      onPressed: () {
                        con.registerAPI(con.emailController.text.toString());
                        Fluttertoast.showToast(msg: "Otp Sent Suceessfully");
                      },
                      child: Text('Resend',
                          style: TextStyle(
                              fontSize: 14,
                              color: HexColor('#036D7B'),
                              fontFamily: 'Sora')))),
            ])));
  }

  Widget emailText() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text('We have sent you verification code on',
                style: TextStyle(fontSize: 14)),
            Text(
              con.emailController.text,
              style: TextStyle(
                  fontSize: 14,
                  // color: themeChange.darkTheme
                  //     ? Colors.white
                  //     : HexColor('#000000'),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
      onTap: () {
        // Get.to(VerifyUserId(value: widget.value));
        // // Navigator.of(context).pushNamed(
        // //   '/verifyuserid',
        // // );
        // if (formKey.currentState!.validate()) {}
        if (phonenumberController.text.isEmpty) {
          Fluttertoast.showToast(msg: "Enter Your OTP");
        } else {
          // Get.to(VerifyUserId(value: widget.value));
          con.verify(con.emailController.text, phonenumberController.text);
        }
      },
      text: "Next",
    );
  }
}
