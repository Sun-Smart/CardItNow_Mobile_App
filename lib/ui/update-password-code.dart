import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../themes/styles.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_input.dart';

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
            SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
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
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        'Update \n Password',
        style: TextStyle(
          fontSize: 28,
          color: Styles.whitecustomlable,
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
                //label: 'Email address',
                obsecureText: false,
                inputHint: 'Enter code',

                /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                validator: (value) {},
              ),
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
