import 'dart:ui';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/auth_button.dart';
import '../widgets/custom_input.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final formKey = GlobalKey<FormState>();
  final _phonenumberController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFffffff),
      bottomNavigationBar: bulildbutton(),
      body: Container(
          color: Color(0XFFffffff),
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
              ],
            ),
          )),
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
        'Update \n Password',
        style: TextStyle(
          fontSize: 28,
          color: HexColor('#004751'),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget bulidForm() {
    return Container(
        child: Form(
            key: formKey,
            child: Column(children: [
              MyCustomInputBox(
                controller: _otpController,
                label: 'New Password',
                inputHint: 'Enter a strong password',
                obsecureText: true,
                /* prefixIcon: Icon(
                      Icons.lock,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                validator: (value) {
                  if (_otpController.text.isEmpty ||
                      _otpController.text.length < 6) {
                    return "Password should be greater than 6 characters";
                  } else {
                    return null;
                  }
                },
              ),
              MyCustomInputBox(
                controller: _otpController,
                label: 'Confirm Password',
                inputHint: 'Confirm Password',
                obsecureText: true,
                /* prefixIcon: Icon(
                      Icons.lock,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                validator: (value) {
                  if (_otpController.text.isEmpty ||
                      _otpController.text.length < 6) {
                    return "Password should be greater than 6 characters";
                  } else {
                    return null;
                  }
                },
              ),
            ])));
  }

  Widget bulildbutton() {
    return AuthButton(
      onTap: () {
        if (formKey.currentState!.validate()) {}
      },
      text: "Update Password",
    );
  }
}
