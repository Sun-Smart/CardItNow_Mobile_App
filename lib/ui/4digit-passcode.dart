
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

import '../widgets/auth_button.dart';


class Passcode extends StatefulWidget {
  const Passcode({super.key});

  @override
  State<Passcode> createState() => _PasscodeState();
}

class _PasscodeState extends State<Passcode> {
  final formKey = GlobalKey<FormState>();
  final _phonenumberController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFffffff),
      bottomNavigationBar: bulildbutton(),
      body: Container(
          color: Color(0XFFffffff),
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
                  height: 30,
                )
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
        'Set 4 Digit \n Passcode ',
        style: TextStyle(
          fontSize: 28,
          color: HexColor('#004751'),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget bulidForm() {
    return Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
                      child: OtpTextField(
                        fieldWidth: 50,
                        borderWidth: 1,
                        numberOfFields: 4,
                        borderColor: const Color(0xFF512DA8),
                        textStyle:
                            TextStyle(fontSize: 35, color: HexColor('#1B1B1B')),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                      )),
                ])));
  }

  Widget bulildbutton() {
    return AuthButton(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/dashbordScreen',
        );
        if (formKey.currentState!.validate()) {}
      },
      text: "Done",
    );
  }
}
