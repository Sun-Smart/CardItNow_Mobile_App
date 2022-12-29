// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'dart:ui';

import 'package:cardit/ui/home_screen/register_screen/register_screen.dart';
import 'package:cardit/ui/verify_userid_screen/verify_userid_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../themes/theme_notifier.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key, required this.value});
  final List<String> value;

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final formKey = GlobalKey<FormState>();
  final _phonenumberController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0XFFffffff),
      bottomNavigationBar: bulildbutton(),
      body: Container(
          // color: Color(0XFFffffff),
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
            SizedBox(height: 10),
            emailText(),
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
            icon: Icon(
              Icons.arrow_back,
              color: themeChange.darkTheme ? Colors.white : Colors.black,
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
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        padding: EdgeInsets.all(15),
        child: Text('Verify Your Email Id ',
            style: TextStyle(
                fontSize: 28,
                color:
                    themeChange.darkTheme ? Colors.white : HexColor('#004751'),
                fontWeight: FontWeight.bold)));
  }

  Widget bulidForm() {
    return Container(
        child: Form(
            key: formKey,
            child: Stack(children: [
              MyCustomInputBox(
                enabled: true,
                maxLength: 6,
                keyboardType: TextInputType.number,
                label: "Enter the verification code ",
                controller: _phonenumberController,
                obsecureText: false,
                inputHint: 'Enter Verification Code',
                validator: (value) {
                  if (_phonenumberController.text.isEmpty) {
                    return 'Enter Your OTP';
                  }
                },
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
                  right: 20,
                  top: 40,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
                      fontSize: 14,
                      color: HexColor('#036D7B'),
                    )),
                    onPressed: () {},
                    child: Text(
                      'Resend',
                      style: TextStyle(
                        fontSize: 14,
                        color: HexColor('#036D7B'),
                        fontFamily: 'Sora',
                      ),
                    ),
                  )),
            ])));
  }

  Widget emailText() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text('We have sent you verification code on',
                style: TextStyle(
                    fontSize: 14,
                    color: themeChange.darkTheme
                        ? Colors.white
                        : HexColor('#000000'))),
            const SizedBox(height: 5),
            Text(emailController.text,
                style: TextStyle(
                    fontSize: 14,
                    color: themeChange.darkTheme
                        ? Colors.white
                        : HexColor('#000000'),
                    fontWeight: FontWeight.bold))
          ],
        ));
  }

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        if (formKey.currentState!.validate()) {
          Get.to(VerifyUserId(value: widget.value));
        }
      },
      text: "Next",
    );
  }
}
