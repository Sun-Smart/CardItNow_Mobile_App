import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../themes/styles.dart';
import '../themes/theme_notifier.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final _phonenumberController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackgroundBlock,
      body: Container(
          color: Styles.colorBackgroundBlock,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 20, bottom: 30),
                    margin: EdgeInsets.only(top: 40),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/loginbg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildToptitle(),
                          buildtitle(),
                        ])),
                bulidForm(),
                buildbCart()
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
              Icons.close,
              color: themeChange.darkTheme ? Colors.white : Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 14, color: HexColor('#004751')),
            ),
            onPressed: () {},
            child: Text(
              'Use Pin or Biometrics',
              style: TextStyle(
                  fontSize: 12,
                  color: themeChange.darkTheme
                      ? Colors.white
                      : HexColor('#004751')),
            ),
          ),
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
              Text('We’ve \n Missed you!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: themeChange.darkTheme
                          ? Colors.white
                          : Color(0XFF004751),
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
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
                    label: "Email ",
                    controller: _phonenumberController,
                    //label: 'Email address',
                    obsecureText: false,
                    inputHint: 'Enter email id',
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
                  MyCustomInputBox(
                    controller: _otpController,
                    label: 'Password',
                    inputHint: 'Enter Password',
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
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 15, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                  SizedBox(
                                      height: 24.0,
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
                                          value: _isChecked,
                                          onChanged: (value) {},
                                        ),
                                      )),
                                  SizedBox(width: 10.0),
                                  Text("Remember Me",
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
                                    color: themeChange.darkTheme
                                        ? Colors.white
                                        : HexColor('#004751')),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  '/updatepasswordcode',
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: themeChange.darkTheme
                                        ? Colors.white
                                        : HexColor('#004751')),
                              ),
                            ),
                          ])),
                  AuthButton(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/4digitpasscode',
                      );
                      if (formKey.currentState!.validate()) {}
                    },
                    text: "Login",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.of(context).pushNamed(
                        '/register',
                      );
                    },
                    child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
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
                            text: ' Register',
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: themeChange.darkTheme
                                  ? Colors.blue
                                  : Color(0xff004751),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Or',
                    style: TextStyle(
                        fontSize: 14,
                        color: themeChange.darkTheme
                            ? Colors.white
                            : HexColor('#413D4B')),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ])));
  }

  Widget buildbCart() {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Image.asset(
            "assets/google.png",
            width: 40,
          ),
          const SizedBox(
            width: 20,
          ),
          Image.asset(
            width: 40,
            'assets/fb.png',
          ),
        ]));
  }
}
