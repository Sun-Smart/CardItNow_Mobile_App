// ignore_for_file: unnecessary_import, avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, unnecessary_new, unrelated_type_equality_checks, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:cardit/const/responsive.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';

import '../../api/regster_api.dart';
import '../../main.dart';

class Passcode extends StatefulWidget {
  const Passcode({super.key});

  @override
  State<Passcode> createState() => _PasscodeState();
}

class _PasscodeState extends State<Passcode> {
  var otpResult = '';

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5.0));
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController otpCon = TextEditingController();
  final TextEditingController confirmotp = TextEditingController();
  final RegisterAPI con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet:
            Responsive.isMobile(context) ? bulildbutton() : null,
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
                    SizedBox(height: 30)
                  ],
                ),
              ))
            : Responsive.isDesktop(context)
                ? Row(children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Image.asset("assets/applogo-02.png",
                                width: MediaQuery.of(context).size.width / 1.5, height:  MediaQuery.of(context).size.height / 3
                              )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buildToptitle(),
                              buildtitle(),
                              SizedBox(height: 50),
                              buildformweb(),
                              SizedBox(height: 30),
                              bulildbutton(),
                              SizedBox(height: 30)
                            ]),
                      ),
                    ),
                  ])
                : Row(children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                       //   height: MediaQuery.of(context).size.width / 1,
                          color: Color(0XFF004751),
                          child: Center(
                              child: Image.asset("assets/applogo-02.png",
                                width: MediaQuery.of(context).size.width / 1.5, height:  MediaQuery.of(context).size.height / 3
                              )),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    buildToptitle(),
                                    buildtitle(),
                                    SizedBox(height: 50),
                                    buildformweb(),
                                    SizedBox(height: 30),
                                    bulildbutton(),
                                    SizedBox(height: 30)
                                  ]),
                            )),
                      ],
                    )
                  ]));
  }

  Widget buildToptitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back,
                color: themeChange.darkTheme ? Colors.white : Colors.black,
                size: 30),
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
        child: Text('Set 6 Digit \nPasscode ',
            style: TextStyle(
                fontSize: 28,
                color:
                    themeChange.darkTheme ? Colors.white : HexColor('#004751'),
                fontWeight: FontWeight.bold)));
  }
//for web and tablet..........
  Widget buildformweb() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: Responsive.isDesktop(context)
                        ? EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 5.2)
                        : EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 6.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("New Passcode",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      margin: Responsive.isDesktop(context)
                          ? EdgeInsets.only(
                              left: MediaQuery.of(context).size.height / 2.5,
                              right: MediaQuery.of(context).size.height / 2.5)
                          : EdgeInsets.only(
                              left: MediaQuery.of(context).size.width /6 ,
                              right: 20),
                             // right: MediaQuery.of(context).size.height / 6),
                      // padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: PinPut(
                          controller: otpCon,
                            obscureText: "\u2B24",
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6)
                          ],
                          followingFieldDecoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(0)),
                          keyboardType: TextInputType.number,
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(0)),
                          selectedFieldDecoration: _pinPutDecoration,
                          fieldsCount: 6)),
                  SizedBox(height: 30),
                  Container(
                    padding: Responsive.isDesktop(context)
                        ? EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 5.2)
                        : EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 6.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Confirm Passcode",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      margin: Responsive.isDesktop(context)
                          ? EdgeInsets.only(
                              left: MediaQuery.of(context).size.height / 2.5,
                              right: MediaQuery.of(context).size.height / 2.5)
                          :EdgeInsets.only(
                              left: MediaQuery.of(context).size.width /6 ,
                              right: 20),
                      // padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: PinPut(
                          controller: confirmotp,
                            obscureText: "\u2B24",
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6)
                          ],
                          followingFieldDecoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(0)),
                          keyboardType: TextInputType.number,
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(0)),
                          selectedFieldDecoration: _pinPutDecoration,
                          fieldsCount: 6)),
                              Container(
                    // width: size.width/2,
                    margin: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       SizedBox(
                          height: 20,
                        ),
                        Row(
                         // crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              SizedBox(width: 40,),
                            Text("note",style: TextStyle(
                              fontFamily: 'sora',fontSize: 16
                            ),),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             SizedBox(width: 40,),
                            Text("1. passcode only contains numbers only.",style: TextStyle(
                                fontFamily: 'sora',fontSize: 13
                            ),),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                           //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             SizedBox(width: 40,),
                            Text("2. passcode should not be contains same digits.",style: TextStyle(
                                fontFamily: 'sora',fontSize: 13
                            ),),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             SizedBox(width: 40,),
                            Text("3. passcode should not be contains continues digits",style: TextStyle(
                                fontFamily: 'sora',fontSize: 13
                            ),),
                          ],
                        ),

                        Row(
                           //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             SizedBox(width: 40,),
                            Text("   (ex:123456).",style: TextStyle(
                                fontFamily: 'sora',fontSize: 13
                            ),),
                          ],
                        ),


                      ],
                    ),


                  ),
              
                ])));
  }
//for  mobile.......
  Widget bulidForm() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Row(
                      children: [
                        Text("New Passcode",
                            style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'sora',
                                fontSize: 16,color: HexColor('#004751')
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: PinPut(
                          controller: otpCon,
                          obscureText: "\u2B24",
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6)
                          ],
                          followingFieldDecoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(0)),
                          keyboardType: TextInputType.number,
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(0)),
                          selectedFieldDecoration: _pinPutDecoration,
                          fieldsCount: 6)),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Row(
                      children: [
                        Text(
                          "Confirm Passcode",
                          style:TextStyle(fontWeight: FontWeight.bold,fontFamily: 'sora',
                              fontSize: 16,color: HexColor('#004751')
                          )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: PinPut(
                          controller: confirmotp,
                          obscureText: "\u2B24",
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6)
                          ],
                          followingFieldDecoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(0)),
                          keyboardType: TextInputType.number,
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(0)),
                          selectedFieldDecoration: _pinPutDecoration,
                          fieldsCount: 6)),
                  SizedBox(height: 20),
                  Container(

                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(

                              child: Text("note",style: TextStyle(
                                fontFamily: 'sora',fontSize: 16
                              ),),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            Container(
                              child: Text("1. passcode only contains numbers only.",style: TextStyle(
                                  fontFamily: 'sora',fontSize: 13
                              ),),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("2. passcode should not be contains same digits.",style: TextStyle(
                                fontFamily: 'sora',fontSize: 13
                            ),),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(

                              child: Text("3. passcode should not be contains continues ",style: TextStyle(
                                  fontFamily: 'sora',fontSize: 13
                              ),),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Text("   digits (ex:123456).",style: TextStyle(
                                fontFamily: 'sora',fontSize: 13
                            ),),
                          ],
                        ),


                      ],
                    ),


                  ),
                ])));
  }

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
      onTap: () {
        if (otpCon.text.isEmpty && confirmotp.text.isEmpty) {
          Fluttertoast.showToast(msg: 'Enter your 6 digit passcode');
        } else if (otpCon.text.contains("1" "2" "3" "4" "5" "6")) {
          Fluttertoast.showToast(msg: "Sequential number is not permitted");
        }
        else if (otpCon.text.contains("0" "9" "8" "7" "6" "5")) {
          Fluttertoast.showToast(msg: "Sequential number is not permitted");
        }
        else if (otpCon.text.contains("9" "8" "7" "6" "5" "4")) {
          Fluttertoast.showToast(msg: "Sequential number is not permitted");
        }
        else if (otpCon.text[0] == otpCon.text[1] &&
            otpCon.text[2] == otpCon.text[3] &&
            otpCon.text[4] == otpCon.text[5]) {
          Fluttertoast.showToast(msg: 'Error Same Number');
        } else if (confirmotp.text[0] == confirmotp.text[1] &&
            confirmotp.text[2] == confirmotp.text[3] &&
            confirmotp.text[4] == confirmotp.text[5]) {
          Fluttertoast.showToast(msg: 'Error Same Number');
        } else if (otpCon.text != confirmotp.text) {
          Fluttertoast.showToast(msg: "Passcode has Mismatched");
        } else {
          con.pinsetapi(con.emailController.text.trim(), otpCon.text);
        }
      },
      text: "Next",
    );
  }
}
