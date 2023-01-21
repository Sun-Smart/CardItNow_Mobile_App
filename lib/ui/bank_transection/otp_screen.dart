// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FundTransferOTP extends StatefulWidget {
  const FundTransferOTP({Key? key}) : super(key: key);

  @override
  State<FundTransferOTP> createState() => _FundTransferOTPState();
}

class _FundTransferOTPState extends State<FundTransferOTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
          Get.back();
        }, icon: Icon(Icons.close, size: 30, color: Colors.black)),
      ),
    );
  }
}
