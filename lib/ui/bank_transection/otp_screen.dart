// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pin_put/pin_put.dart';

class FundTransferOTP extends StatefulWidget {
  const FundTransferOTP({Key? key}) : super(key: key);

  @override
  State<FundTransferOTP> createState() => _FundTransferOTPState();
}

class _FundTransferOTPState extends State<FundTransferOTP> {
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5.0));
  }

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              icon: Icon(Icons.close, size: 30, color: Colors.black)),
          centerTitle: true,
          title: Text('Fund Transfer',
              style: TextStyle(
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Icon(Icons.message, color: Colors.orange, size: 30),
            SizedBox(height: 30),
            Text('Complete your login',
                style: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Enter 6-digit code sent by Brankas Bank.',
                style: TextStyle(fontFamily: 'Sora', fontSize: 16)),
            SizedBox(height: 30),
            Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: PinPut(
                    controller: otpController,
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
            AuthButton(
              decoration: BoxDecoration(
                  color: HexColor('#CEE812'),
                  borderRadius: BorderRadius.circular(5)),
              onTap: () {},
              text: "Submit",
            ),
          ],
        ),
      ),
    );
  }
}
