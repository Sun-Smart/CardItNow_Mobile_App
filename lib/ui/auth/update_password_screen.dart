// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:ui';
import 'package:cardit/const/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../api/regster_api.dart';
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
  final RegisterAPI con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Responsive.isMobile(context) ? bulildbutton() : null,
      body: Responsive.isMobile(context)
          ? Container(
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
            ))
          : Responsive.isDesktop(context)
              ? Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Image.asset("assets/carditlogo.png",
                              width: 130, height: 65)),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_back, size: 30),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                            buildtitle(),
                            SizedBox(height: 30),
                            bulidForm(),
                            SizedBox(height: 50),
                            bulildbutton()
                          ],
                        )),
                  ],
                )
              : Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Image.asset("assets/carditlogo.png",
                              width: 130, height: 65)),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_back, size: 30),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                            buildtitle(),
                            SizedBox(height: 30),
                            bulidForm(),
                            SizedBox(height: 50),
                            bulildbutton()
                          ],
                        )),
                  ],
                ),
    );
  }

  Widget buildToptitle() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container()
        ]);
  }

  Widget buildtitle() {
    return Responsive.isMobile(context)
        ? Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Forgot \n Password',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Forgot Password',
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
            child: Responsive.isMobile(context)
                ? Column(children: [
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
                          helperStyle:
                              TextStyle(fontFamily: 'Sora', fontSize: 14),
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
                          helperStyle:
                              TextStyle(fontFamily: 'Sora', fontSize: 14),
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
                  ])
                : Column(children: [
                    Row(
                      children: [
                        SizedBox(
                          width: Responsive.isDesktop(context)
                              ? MediaQuery.of(context).size.width / 4.8
                              : MediaQuery.of(context).size.width / 8,
                        ),
                        Text(
                          "New Passcode",
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4
                            : MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          enabled: true,
                          controller: newpassword,
                          maxLength: 6,
                          //label: 'New Passcode',
                          // inputHint: 'Enter a strong password',
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          // textInputType: TextInputType.number,
                          decoration: const InputDecoration(
                            hoverColor: Colors.transparent,
                              filled: true,
                              fillColor: Colors.white,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              helperStyle:
                                  TextStyle(fontFamily: 'Sora', fontSize: 14),
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
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Responsive.isDesktop(context)
                              ? MediaQuery.of(context).size.width / 4.8
                              : MediaQuery.of(context).size.width / 8,
                        ),
                        Text(
                          "Confirm Passcode",
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2,
                      child: TextFormField(
                        enabled: true,
                        maxLength: 6,
                        controller: updatepassword,
                        // label: 'Confirm Passcode',
                        //inputHint: 'Confirm Password',
                        keyboardType: TextInputType.number,
                        //textInputType: TextInputType.number,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hoverColor: Colors.transparent,
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle:
                                TextStyle(fontFamily: 'Sora', fontSize: 14),
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
        if (newpassword.text.isEmpty) {
          Fluttertoast.showToast(msg: "Enter your New Password");
        } else if (updatepassword.text.isEmpty) {
          Fluttertoast.showToast(msg: "Enter Confirm Password");
        } else if (newpassword.text != updatepassword.text) {
          Fluttertoast.showToast(msg: "Password Mismatched");
        } else {
          con.updateForgotPassword(newpassword.text);
        }
      },
      text: "Save Password",
    );
  }
}
//web and mobile