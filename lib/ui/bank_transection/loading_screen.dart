// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'otp_screen.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () async {
      Get.to(() => FundTransferOTP());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.person_search_rounded, size: 50)),
          SizedBox(height: 10),
          Center(
              child: Text('Logging in...',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          SizedBox(height: 10),
          Center(
              child: LoadingAnimationWidget.prograssiveDots(
                  color: Colors.grey, size: 50)),
        ],
      ),
    );
  }
}
