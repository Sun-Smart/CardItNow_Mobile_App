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
      body: Responsive.isMobile(context)
          ? Container(
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
                ],
              ),
            ))
          : Responsive.isDesktop(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Image.asset("assets/applogo-02.png",
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: MediaQuery.of(context).size.height / 3)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: 10, bottom: 30),
                              margin: EdgeInsets.only(top: 30),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    buildToptitle(),
                                    buildtitle(),
                                  ])),
                          Row(
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 4.8),
                              Text(
                                "Enter the verification code ",
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          bulidFormweb(),
                          SizedBox(height: 10),
                          emailText(),
                          // bulildbutton()
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      // height: MediaQuery.of(context).size.width / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Image.asset("assets/applogo-02.png",
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: MediaQuery.of(context).size.height / 3)),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          
                          Container(
                              padding: EdgeInsets.only(top: 10, bottom: 30),
                              margin: EdgeInsets.only(top: 30),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        buildToptitle(),
                                      ],
                                    ),
                                    buildtitle(),
                                  ])),
                          Row(
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 15),
                              Text(
                                "Enter the verification code ",
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          bulidFormweb(),
                          SizedBox(height: 10),
                          emailText(),
                          // bulildbutton()
                        ],
                      ),
                    ),
                  ],
                ),

      bottomSheet: Responsive.isMobile(context) ? null : null,
    );
  }

  Widget buildToptitle() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        crossAxisAlignment: Responsive.isMobile(context)
            ? CrossAxisAlignment.start
            : Responsive.isDesktop(context)
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.start,
        children: [
          IconButton(
            hoverColor: Colors.transparent,
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
    return Responsive.isMobile(context)
        ? Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify Your Email',
                  style: TextStyle(
                    fontSize: 32, fontFamily: 'sora',
                    color: HexColor('#004751'),
                    // color: themeChange.darkTheme ? Colors.white : HexColor('#004751'),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' Id',
                  style: TextStyle(
                    fontSize: 32, fontFamily: 'sora',
                    color: HexColor('#004751'),
                    // color: themeChange.darkTheme ? Colors.white : HexColor('#004751'),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify Your Email Id',
                  style: TextStyle(
                    fontSize: 32, fontFamily: 'sora',
                    color: HexColor('#004751'),
                    // color: themeChange.darkTheme ? Colors.white : HexColor('#004751'),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
  }

  Widget bulidFormweb() {
    return Container(
        width: Responsive.isDesktop(context)
            ? MediaQuery.of(context).size.width / 4
            : MediaQuery.of(context).size.width / 2.5,
        child: Form(
            key: formKey,
            child: Stack(children: [
              TextFormField(
                enabled: true,
                obscureText: false,
                controller: phonenumberController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                // obsecureText: false,
                // inputHint: 'Enter Verification Code',
                validator: (value) {},
                decoration: InputDecoration(
                  hoverColor: Colors.transparent,
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
                  left: Responsive.isDesktop(context) ? 250 : 200,
                  top: Responsive.isDesktop(context) ?5:5,
                  // right: Responsive.isMobile(context)
                  //     ? 20
                  //     : Responsive.isDesktop(context)
                  //         ? MediaQuery.of(context).size.width / 4.2
                  //         : MediaQuery.of(context).size.width / 3.2,
                  // top: Responsive.isMobile(context)
                  //     ? 30
                  //     : Responsive.isDesktop(context)
                  //         ? 45
                  //         : 45,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 14, color: HexColor('#036D7B'))),
                      onPressed: () {
                        if (phonenumberController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter Your OTP");
                        } else {
                          // Get.to(VerifyUserId(value: widget.value));
                          con.verify(con.emailController.text,
                              phonenumberController.text);
                        }
                        // con.registerAPI(con.emailController.text.toString());
                        // Fluttertoast.showToast(msg: "Otp Sent Suceessfully");
                      },
                      child: Text('Send',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HexColor('#036D7B'),
                              fontFamily: 'Sora')))),
            ])));
  }

  Widget bulidForm() {
    return Container(
        child: Form(
            key: formKey,
            child: Stack(children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    // Text("Enter the Verification Code",style: TextStyle(
                    //     fontFamily: 'sora',fontWeight: FontWeight.bold
                    // ),),
                  ],
                ),
              ),
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
                  hoverColor: Colors.transparent,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Verification Code',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  helperStyle:
                      const TextStyle(fontFamily: 'Sora', fontSize: 14),
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.bold,
                  ),
                  hintStyle: const TextStyle(
                    fontSize: 13,
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
                          ? MediaQuery.of(context).size.width / 4.2
                          : MediaQuery.of(context).size.width / 3.2,
                  top: Responsive.isMobile(context)
                      ? 30
                      : Responsive.isDesktop(context)
                          ? 45
                          : 45,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 14, color: HexColor('#036D7B'))),
                      onPressed: () {
                        if (phonenumberController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter Your OTP");
                        } else {
                          // Get.to(VerifyUserId(value: widget.value));
                          con.verify(con.emailController.text,
                              phonenumberController.text);
                        }
                        // con.registerAPI(con.emailController.text.toString());
                        // Fluttertoast.showToast(msg: "Otp Sent Suceessfully");
                      },
                      child: Text('Send',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
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
            // const SizedBox(height: 10),
            Text('We have sent you verification code on',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'sora',
                    fontWeight: FontWeight.normal)),
            Text(con.emailController.text,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'sora',
                    fontWeight: FontWeight.bold)),

            Center(
              child: Container(
                // margin: EdgeInsets.only(left:40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Didn’t receive a verification code?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'sora',
                                fontWeight: FontWeight.normal)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            con.registerAPI(
                                con.emailController.text.toString());
                            Fluttertoast.showToast(
                                msg: "OTP Sent Successfully");
                          },
                          child: Text(' Resend again',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'sora',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
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
