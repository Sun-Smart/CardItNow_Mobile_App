// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        )));
  }

  Widget buildToptitle() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
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
        'Forgot \nPassword',
        style: TextStyle(
          fontSize: 28,
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
                  controller: _phonenumberController,
                  inputDecoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter OTP',
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
                  obsecureText: false,
                  inputHint: 'Enter code',
                  validator: (value) {}),
              Positioned(
                  right: 20,
                  top: 40,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle:
                          TextStyle(fontSize: 14, color: HexColor('#413D4B')),
                    ),
                    onPressed: () {},
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
        Navigator.of(context).pushNamed(
          '/updatepassword',
        );
        if (formKey.currentState!.validate()) {}
      },
      text: "Next",
    );
  }
}
