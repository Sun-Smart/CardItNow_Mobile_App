// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:ui';

import 'package:cardit/services/gmail_auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../themes/styles.dart';
import '../themes/theme_notifier.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_input.dart';

bool isChecked = false;
bool isChecked1 = false;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final _phonenumberController = TextEditingController();
  final _otpController = TextEditingController();

  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackgroundBlock,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Styles.colorBackgroundBlock,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        // padding: EdgeInsets.only(top: 20, bottom: 30),
                        margin: EdgeInsets.only(top: 40),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/loginbg.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buildToptitle(),
                              buildtitle(),
                            ])),
                    buildbutton(),
                    bulidForm(),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )),
          ],
        ),
      ),
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
              Icons.close,
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
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Join ',
                    style: TextStyle(
                        fontSize: 28,
                        color: themeChange.darkTheme
                            ? Colors.white
                            : HexColor('#004751')),
                  ),
                  Image.asset(
                    "assets/carditlogo.png",
                    width: 100,
                    height: 65,
                  ),
                ],
              ),
              Image.asset(
                "assets/userimg.png",
                width: 107,
              ),
            ]));
  }

  Widget bulidForm() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCustomInputBox(
                    enabled: true,
                    label: "Use your Email ",
                    controller: _phonenumberController,
                    //label: 'Email address',
                    obsecureText: false,
                    inputHint: 'Enter your email',
                    /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                    validator: (value) {
                      if (_phonenumberController.text.isEmpty) {
                        return "Please Enter The Email";
                      } else if (!_phonenumberController.text.contains("@") ||
                          !_phonenumberController.text.endsWith('.com')) {
                        return "Please Enter The valid Email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                      SizedBox(
                                          height: 20.0,
                                          width: 24.0,
                                          child: Theme(
                                            data: ThemeData(
                                                unselectedWidgetColor:
                                                    themeChange.darkTheme
                                                        ? Colors.white
                                                        : Color(0xff004751)),
                                            child: Checkbox(
                                              activeColor: themeChange.darkTheme
                                                  ? Colors.white
                                                  : Color(0xff004751),
                                              value: isChecked,
                                              onChanged: (value) {
                                                setState(() {
                                                  if (isChecked) {
                                                    isChecked = false;
                                                  } else {
                                                    isChecked = true;
                                                    showAlertDialog(context);
                                                  }
                                                });
                                              },
                                            ),
                                          )),
                                      SizedBox(width: 10.0),
                                      Text("I agree to the ",
                                          style: TextStyle(
                                            color: themeChange.darkTheme
                                                ? Colors.white
                                                : Color(0xff646464),
                                            fontSize: 14,
                                          ))
                                    ])),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        color: HexColor('#004751')),
                                  ),
                                  onPressed: () {
                                    //showAlertDialog(context);
                                  },
                                  child: Text(
                                    'terms and conditions.',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: themeChange.darkTheme
                                            ? Colors.white
                                            : HexColor('#004751')),
                                  ),
                                ),
                              ]),
                          //2 factor begin
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                      SizedBox(
                                          height: 20.0,
                                          width: 24.0,
                                          child: Theme(
                                            data: ThemeData(
                                                unselectedWidgetColor: themeChange
                                                        .darkTheme
                                                    ? Colors.white
                                                    : Color(
                                                        0xff004751) // Your color
                                                ),
                                            child: Checkbox(
                                              activeColor: themeChange.darkTheme
                                                  ? Colors.white
                                                  : Color(0xff004751),
                                              value: isChecked1,
                                              onChanged: (value) {
                                                setState(() {
                                                  if (isChecked1) {
                                                    isChecked1 = false;
                                                  } else {
                                                    isChecked1 = true;
                                                  }
                                                });
                                              },
                                            ),
                                          )),
                                      // SizedBox(width: 10.0),
                                      // Text("I agree to the ",
                                      //     style: TextStyle(
                                      //       color: themeChange.darkTheme
                                      //           ? Colors.white
                                      //           : Color(0xff646464),
                                      //       fontSize: 14,
                                      //     ))
                                    ])),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        color: HexColor('#004751')),
                                  ),
                                  onPressed: () {
                                    showAlertDialog(context);
                                  },
                                  child: Text(
                                    ' Enable 2 Factor Authentication',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: themeChange.darkTheme
                                            ? Colors.white
                                            : HexColor('#004751')),
                                  ),
                                ),
                              ]),
                          //2 factor
                        ],
                      )),
                  AuthButton(
                    onTap: () {
                      if (isChecked == false) {
                        print('Select the Check Box');
                      } else if (isChecked == true) {
                        Navigator.of(context).pushNamed('/verifyemail');
                      }
                      //if (formKey.currentState!.validate()) {}
                    },
                    text: "Register",
                    decoration: BoxDecoration(
                      color: isChecked == true
                          ? HexColor('#CEE812')
                          : Color.fromARGB(255, 218, 248, 159),
                      // color: color != null ? color : HexColor('#CEE812'),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.of(context).pushNamed(
                        '/login',
                      );
                    },
                    child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: ' Login',
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Color(0xff004751),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ])));
  }

  Widget buildbutton() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(children: [
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Color(0XFFB7C5C7), width: 1.5),
            color: Color(0XFFffffff),
          ),
          margin: EdgeInsets.all(15),
          child: InkWell(
            highlightColor: Color(0XFFffffff),
            focusColor: Color(0XFFffffff),
            splashColor: Colors.green, // splash color
            onTap: () {}, // button pressed
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "assets/fb.png",
                      width: 32,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Sign Up using Facebook",
                      style: TextStyle(color: Color(0XFF413D4B), fontSize: 14),
                    ),
                    // text
                  ],
                )),
          )),
      const SizedBox(
        height: 10,
      ),
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Color(0XFFB7C5C7), width: 1.5),
            color: Color(0XFFffffff),
          ),
          margin: EdgeInsets.all(15),
          child: InkWell(
            highlightColor: Color(0XFFffffff),
            focusColor: Color(0XFFffffff),
            splashColor: Colors.green, // splash color
            onTap: () {
              print("Gmail Tapped Done");
              AuthService().signinWithGoogle();
            }, // button pressed
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 20),
                    Image.asset("assets/google.png", width: 32),
                    SizedBox(width: 15),
                    Text(
                      "Sign Up using Google",
                      style: TextStyle(color: Color(0XFF413D4B), fontSize: 14),
                    ),
                    // text
                  ],
                )),
          )),
      const SizedBox(height: 10),
      Text(
        'Or',
        style: TextStyle(
            fontSize: 14,
            color: themeChange.darkTheme ? Colors.white : HexColor('#413D4B')),
      ),
      const SizedBox(height: 10),
    ]);
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = Container(
        alignment: Alignment.center,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0XFF004751),
        ),
        margin: EdgeInsets.all(15),
        child: InkWell(
          highlightColor: Color(0XFF004751),
          focusColor: Color(0XFF004751),
          splashColor: Colors.green, // splash color
          onTap: () {
            Navigator.pop(context);
          }, // button pressed
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Accept and Proceed",
              style: TextStyle(color: Color(0XFFCEE812), fontSize: 12),
            ),
            // text
          ),
        ));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Terms and Conditions."),
      content: Text(
          "Customer shall pay for all Products delivered or date services performed within 30 days from the date of Supplier’s invoice. Payment shall be deemed to have been made when a check is received by Supplier or payment is received by an electronic transfer in Supplier’s bank account. Supplier reserves the right to assess interest on any late payments from the date due until receipt of payment in full at the lesser of (a) one and one-half percent per month compounded monthly, or (b) the maximum rate permitted by law, and to charge Customer for any collection or litigation expenses, including reasonable attorney’s fees incurred by Supplier in the collection of late payment.",
          style: TextStyle(
            fontSize: 13,
            color: Styles.whitecolortext,
          )),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
