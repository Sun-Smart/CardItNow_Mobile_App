// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../api/regster_api.dart';
import '../../const/responsive.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';

class UpdatePasswordCode extends StatefulWidget {

   UpdatePasswordCode({super.key,});

  @override
  State<UpdatePasswordCode> createState() => _UpdatePasswordCodeState();
}

class _UpdatePasswordCodeState extends State<UpdatePasswordCode> {
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  final RegisterAPI con = Get.find();
  @override
  //web and mobile....
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            Responsive.isMobile(context) ? bulildbutton() : null,
        body: Responsive.isMobile(context)
            ? SingleChildScrollView(
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
              )
            : Responsive.isDesktop(context)
                ? Row(children: [
                   Container(
                    width: MediaQuery.of(context).size.width / 3,
                 //   height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/logoweb.png",
                                width: 140, height: 75),
                                SizedBox(height: 15),
                                  Text('"Make your life simple"',
                  style: TextStyle(
                    letterSpacing: 1,
                  fontSize: 16, color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'sora'
                  ),
                ),
                          ],
                        )),
                  ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.arrow_back,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  ),
                                  buildtitle(),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  bulidForm(),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  bulildbutton()
                                ])),
                      ],
                    )
                  ])
                : Row(children: [
                   Container(
                    width: MediaQuery.of(context).size.width / 3,
                  //  height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/logoweb.png",
                                width: 140, height: 75),
                                SizedBox(height: 15),
                                  Text('"Make your life simple"',
                  style: TextStyle(
                    letterSpacing: 1,
                  fontSize: 16, color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'sora'
                  ),
                ),
                          ],
                        )),
                  ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
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
                                      ],
                                    ),
                                    buildtitle(),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    bulidForm(),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    bulildbutton()
                                  ]))
                        ])
                  ]));
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
    return Responsive.isMobile(context)
        ? Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Forgot \n Password',
              style: TextStyle(
                fontSize: 28,
                // color: Styles.whitecustomlable,
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
                // color: Styles.whitecustomlable,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }

  Widget bulidForm() {
    return Responsive.isMobile(context)
        ? Container(
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
                        helperStyle:
                            TextStyle(fontFamily: 'Sora', fontSize: 14),
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
                          textStyle: TextStyle(
                              fontSize: 14, color: HexColor('#413D4B')),
                        ),
                        onPressed: () {
                          con.resend(con.emailController.text);
                        },
                        child: Text(
                          'Resend',
                          style: TextStyle(
                              fontSize: 16, color: HexColor('#413D4B')),
                        ),
                      )),
                ])))
        : Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: Responsive.isDesktop(context)
                        ? MediaQuery.of(context).size.width / 4.8
                        : MediaQuery.of(context).size.width / 8,
                  ),
                  Text(
                    "Email Verification Code",
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
                  child: Form(
                      key: formKey,
                      child: Stack(children: [
                        TextFormField(
                          enabled: true,
                          // label: "Email Verification Code",
                          controller: otpController,
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
                          obscureText: false,
                          //inputHint: 'Enter code',
                          validator: (value) {},
                        ),
                        Positioned(
                            // left:200,
                            right: Responsive.isDesktop(context) ? 10 : 20,
                            top: 10,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 14, color: HexColor('#413D4B')),
                              ),
                              onPressed: () {
                                con.forgotPasswordOTP(con.emailController.text);
                              },
                              child: Text(
                                'Resend',
                                style: TextStyle(
                                    fontSize: 14, color: HexColor('#413D4B')),
                              ),
                            )),
                      ]))),
            ],
          );
  }

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        if (otpController.text.isEmpty) {
          Fluttertoast.showToast(msg: "Enter your otp");
        } else {

          con.forgotOTPVerify(con.emailController.text, otpController.text);
        }
      },
      text: "Next",
    );
  }
}
