// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, unused_local_variable, non_constant_identifier_names

import 'package:cardit/const/responsive.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../api/regster_api.dart';

final password = TextEditingController();
final confirmpassword = TextEditingController();

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final RegisterAPI con = Get.find();
  final formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  bool _isConformObscure = true;

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  //A function that validate user entered password
  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bulildbutton(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Column(
              crossAxisAlignment: Responsive.isMobile(context)
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildToptitle(),
                          buildtitle(),
                        ])),
                bulidForm(),
                SizedBox(height: 30),
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
            icon: Icon(Icons.close,
                color: themeChange.darkTheme ? Colors.white : Colors.black,
                size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container()
        ]);
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
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('New Password',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          TextFormField(
                              obscureText: _isObscure,
                              controller: password,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter password";
                                } else if (value.length < 6) {
                                  return 'Must be more than 6 charater';
                                } else {
                                  //call function to check password
                                  bool result = validatePassword(value);
                                  if (result) {
                                    // create account event
                                    return null;
                                  } else {
                                    return " Password should contain Special Characters";
                                  }
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Enter New Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(_isObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
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
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Confirm Password',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          TextFormField(
                            controller: confirmpassword,
                            obscureText: _isConformObscure,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter password";
                              } else if (value.length < 6) {
                                return 'Must be more than 6 charater';
                              } else {
                                //call function to check password
                                bool result = validatePassword(value);
                                if (result) {
                                  // create account event
                                  return null;
                                } else {
                                  return " Password should contain Special Characters";
                                }
                              }
                            },
                            decoration: InputDecoration(
                                labelText: 'Enter Conform Password',
                                suffixIcon: IconButton(
                                  icon: Icon(_isConformObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _isConformObscure = !_isConformObscure;
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
                                    borderSide: BorderSide(color: Colors.grey)),
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
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )),
                  SizedBox(height: 10)
                ])));
  }

  Widget buildtitle() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        'Set Your Password',
        style: TextStyle(
          fontSize: 28,
          // color: themeChange.darkTheme ? Colors.white : HexColor('#004751'),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget bulildbutton() {
    return AuthButton(
      onTap: () {
        if (formKey.currentState!.validate()) {
          if (password.text.isEmpty) {
            Fluttertoast.showToast(msg: "Please Enter Your Password");
          } else if (confirmpassword.text.isEmpty) {
            Fluttertoast.showToast(msg: "Please Enter Your Confirm Password");
          } else if (password.text != confirmpassword.text) {
            Fluttertoast.showToast(msg: "Password has mismatched");
          } else {
            con.passwordapi(con.emailController.text, password.text);
          }
        }
      },
      text: "Confirm",
      decoration: BoxDecoration(
          color:
              HexColor('#CEE812'),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
