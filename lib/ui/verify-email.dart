import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../themes/theme_notifier.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_input.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

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
            SizedBox(
              height: 10,
            ),
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
      child: Text(
        'Verify Your Email Id ',
        style: TextStyle(
          fontSize: 28,
          color: themeChange.darkTheme ? Colors.white : HexColor('#004751'),
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
                label: "Enter the verification code ",
                controller: _phonenumberController,
                //label: 'Email address',
                obsecureText: false,
                inputHint: 'Enter Verification Code',

                /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                validator: (value) {},
              ),
              Positioned(
                  right: 20,
                  top: 40,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle:
                          TextStyle(fontSize: 14, color: HexColor('#004751')),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Resend',
                      style:
                          TextStyle(fontSize: 14, color: HexColor('#004751')),
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
            Text(
              'We have sent you verification code on',
              style: TextStyle(
                  fontSize: 14,
                  color: themeChange.darkTheme
                      ? Colors.white
                      : HexColor('#000000')),
            ),
            Text(
              'rita@carditnow.com',
              style: TextStyle(
                  fontSize: 14,
                  color: themeChange.darkTheme
                      ? Colors.white
                      : HexColor('#000000'),
                  fontWeight: FontWeight.bold),
            ),
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
        Navigator.of(context).pushNamed(
          '/verifyuserid',
        );
        if (formKey.currentState!.validate()) {}
      },
      text: "Next",
    );
  }
}
