// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'dart:io';
import 'dart:ui';

import 'package:cardit/auth/auth.dart';
import 'package:cardit/auth/loginapi.dart';
import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/themes/styles.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/ui/register/register_screen.dart';
import 'package:cardit/ui/register/select_country_screen.dart';
import 'package:cardit/ui/splash_screen/splash2.dart';
import 'package:cardit/ui/update_psw_screen/update_email_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthCon con = Get.find();
  final loginauth logincon = Get.put(loginauth());

  bool _isChecked = false;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackgroundBlock,
      body: Container(
          color: Styles.colorBackgroundBlock,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: Responsive.isMobile(context)
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 20, bottom: 30),
                    margin: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/loginbg.png"),
                            fit: Responsive.isMobile(context)
                                ? BoxFit.cover
                                : BoxFit.fill)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildToptitle(),
                          buildtitle(),
                        ])),
                bulidForm(),
                buildCart()
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
            icon: Icon(Icons.close,
                //color: HexColor('#292929'),
                color: themeChange.darkTheme ? Colors.white : Colors.black,
                size: 22),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: TextButton(
                style: TextButton.styleFrom(
                    textStyle:
                        TextStyle(fontSize: 14, color: HexColor('#004751'))),
                onPressed: () {},
                child: Text('Use Pin or Biometrics',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Sora',
                        color: themeChange.darkTheme
                            ? Colors.white
                            : HexColor('#004751')))),
          ),
        ]);
  }

  Widget buildtitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        child: Row(
            mainAxisAlignment: Responsive.isMobile(context)
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            crossAxisAlignment: Responsive.isMobile(context)
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Text('We’ve \nMissed you!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: themeChange.darkTheme
                          ? Colors.white
                          : Color(0XFF004751),
                      fontSize: 28,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold))),
          SizedBox(
              width: Responsive.isMobile(context)
                  ? 0
                  : MediaQuery.of(context).size.width / 14),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Image.asset("assets/userimg.png", width: 100)),
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
                    label: "Email",
                    obsecureText: false,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: _emailController,
                    validator: (value) {
                      if (_emailController.text.isEmpty) {
                        return "Please Enter The Email";
                      } else if (!_emailController.text.contains("@") ||
                          !_emailController.text.endsWith('.com')) {
                        return "Please Enter The valid Email";
                      } else {
                        return null;
                      }
                    },
                    inputDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your email',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      helperStyle:
                          const TextStyle(fontFamily: 'Sora', fontSize: 14),
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.normal,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
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
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Passcode', style: TextStyle(fontSize: 15)),
                          SizedBox(height: 5),
                          TextFormField(
                              obscureText: isVisible,
                              controller: _passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter passcode";
                                } else if (value.length < 6) {
                                  return 'Must be more than 6 charater';
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6)
                              ],
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(isVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility, color: Colors.grey),
                                    onPressed: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  helperStyle: const TextStyle(
                                      fontFamily: 'Sora', fontSize: 14),
                                  hintStyle: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Sora',
                                      fontWeight: FontWeight.normal),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  focusColor: Colors.grey.shade300,
                                  border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      gapPadding: 7,
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  errorStyle: const TextStyle(
                                      fontFamily: 'Sora',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold))),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 15, 0),
                      child: Row(
                          mainAxisAlignment: Responsive.isMobile(context)
                              ? MainAxisAlignment.spaceBetween
                              : MainAxisAlignment.center,
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
                                          onChanged: (value) {
                                            setState(() {
                                              print(
                                                  "ischecked---------${_isChecked}");
                                              _isChecked = !_isChecked;
                                            });
                                          },
                                        ),
                                      )),
                                  SizedBox(width: 10.0),
                                  Text("Remember Me",
                                      style: TextStyle(
                                        fontFamily: 'Sora',
                                        color: themeChange.darkTheme
                                            ? Colors.white
                                            : Color(0xff646464),
                                        fontSize: 14,
                                      ))
                                ])),
                            SizedBox(
                              width: Responsive.isMobile(context)
                                  ? 0
                                  : MediaQuery.of(context).size.width / 14,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    color: themeChange.darkTheme
                                        ? Colors.white
                                        : HexColor('#004751')),
                              ),
                              onPressed: () {
                                Get.offAll(() => UpdateEmailScreen());
                              },
                              child: Text(
                                'Forgot Passcode?',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: themeChange.darkTheme
                                        ? Colors.white
                                        : HexColor('#004751')),
                              ),
                            ),
                          ])),
                  AuthButton(
                    decoration: BoxDecoration(
                      color: HexColor('#CEE812'),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onTap: () {
                      // if (formKey.currentState!.validate()) {
                      //   Get.to(const Passcode());
                      // }
                      if (_emailController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Entery your Email");
                      } else if (_passwordController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter Your Password");
                      } else {
                        logincon.loginAPI(_emailController.text,
                            _passwordController.text, _isChecked);
                      }
                    },
                    text: "Login",
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      // Navigator.of(context).pushNamed('/selectcountry');
                      Get.to(const splash2());
                    },
                    child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Don't have an account?",
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: themeChange.darkTheme
                                      ? Colors.white
                                      : Colors.grey)),
                          TextSpan(
                            text: ' Register',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: themeChange.darkTheme
                                    ? Colors.blue
                                    : Color(0xff004751)),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Or',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Sora',
                          color: themeChange.darkTheme
                              ? Colors.white
                              : HexColor('#413D4B'))),
                  const SizedBox(height: 5),
                ])));
  }

  Widget buildCart() {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Image.asset("assets/google.png", width: 40),
          const SizedBox(width: 20),
          Image.asset(width: 40, 'assets/fb.png'),
        ]));
  }
}
