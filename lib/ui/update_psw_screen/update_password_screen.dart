// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:ui';

import 'package:cardit/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
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
  final newpassword = TextEditingController();
  final updatepassword = TextEditingController();
  final AuthCon con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0XFFffffff),
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
        'Forgot \n Password',
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
                controller: newpassword,
                maxLength: 6,
                label: 'New Passcode',
                inputHint: 'Enter a strong password',
                obsecureText: true,
                keyboardType: TextInputType.number,
                textInputType: TextInputType.number,
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
                validator: (value) {
                  if (newpassword.text.isEmpty ||
                      newpassword.text.length < 6) {
                    return "Password should be greater than 6 characters";
                  } else {
                    return null;
                  }
                },
              ),
              MyCustomInputBox(
                enabled: true,
                maxLength: 6,
                controller: updatepassword,
                label: 'Confirm Passcode',
                inputHint: 'Confirm Password',
                keyboardType: TextInputType.number,
                textInputType: TextInputType.number,
                obsecureText: true,
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
                validator: (value) {
                  if (updatepassword.text.isEmpty ||
                      updatepassword.text.length < 6) {
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
       if(newpassword.text.isEmpty){
         Fluttertoast.showToast(msg: "Enter your New Password");
       }
       else if(updatepassword.text.isEmpty){
         Fluttertoast.showToast(msg: "Enter Confirm Password");
       }
       else if(newpassword.text!=updatepassword.text){
         Fluttertoast.showToast(msg: "Password Mismatched");
       }
       else{
         con.updateForgotPassword(newpassword.text);
       }
      },
      text: "Save Password",
    );
  }
}
