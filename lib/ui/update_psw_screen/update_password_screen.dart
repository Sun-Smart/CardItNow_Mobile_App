// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_field, prefer_final_fields

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';

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
      bottomNavigationBar: bulildbutton(),
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
            SizedBox(height: 10),
          ],
        ),
      )),
    );
  }

  Widget buildToptitle() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back,
                // color: themeChange.darkTheme ? Colors.white : Colors.black,
                size: 30),
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
        'Forgot \nPassword',
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
            child: Column(children: [
              MyCustomInputBox(
                enabled: true,
                controller: _otpController,
                label: 'New Password',
                inputHint: 'Enter a strong password',
                obsecureText: true,
                inputDecoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter New Password',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                  hintStyle: const TextStyle(
                      fontSize: 12, fontFamily: 'Sora', fontWeight: FontWeight.normal),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  focusColor: Colors.grey.shade300,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      gapPadding: 7,
                      borderSide: const BorderSide(color: Colors.grey)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.grey)),
                  errorStyle: const TextStyle(
                      fontFamily: 'Sora', fontSize: 13, fontWeight: FontWeight.bold),
                ),
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
                enabled: true,
                controller: _otpController,
                label: 'Confirm Password',
                inputHint: 'Confirm Password',
                obsecureText: true,
                inputDecoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Conform Password',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                  hintStyle: const TextStyle(
                      fontSize: 12, fontFamily: 'Sora', fontWeight: FontWeight.normal),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  focusColor: Colors.grey.shade300,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      gapPadding: 7,
                      borderSide: const BorderSide(color: Colors.grey)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.grey)),
                  errorStyle: const TextStyle(
                      fontFamily: 'Sora', fontSize: 13, fontWeight: FontWeight.bold),
                ),
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
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        if (formKey.currentState!.validate()) {}
      },
      text: "Save Password",
    );
  }
}
