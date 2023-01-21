// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'enter_your_credentials.dart';

class FundTransfer extends StatefulWidget {
  const FundTransfer({Key? key}) : super(key: key);

  @override
  State<FundTransfer> createState() => _FundTransferState();
}

class _FundTransferState extends State<FundTransfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close, size: 30, color: Colors.black)),
          title: Text('Fund Transfer',
              style: TextStyle(
                  fontFamily: 'Sora', fontSize: 18, color: Colors.black)),
          centerTitle: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 30),
            Center(
                child: Text('Amount',
                    style: TextStyle(fontFamily: 'Sora', fontSize: 18))),
            SizedBox(height: 15),
            Text('PHP 100.00',
                style: TextStyle(fontFamily: 'Sora', fontSize: 20)),
            SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.all(40.0),
              height: 450.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffDDDDDD),
                        blurRadius: 6.0,
                        spreadRadius: 5.0,
                        offset: Offset(0.0, 0.0))
                  ]),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Select a payment option',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black)),
                    Text(
                        'An active online account is required to complete this transaction.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.grey)),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset('assets/fb.png', width: 50, height: 50),
                            Text('Brankas Bank',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset('assets/fb.png', width: 50, height: 50),
                            Text('BPI Online',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset('assets/fb.png', width: 50, height: 50),
                            Text('BDO Online Banking',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            AuthButton(
              text: 'Continue',
              decoration: BoxDecoration(
                  color: HexColor('#CEE812'),
                  borderRadius: BorderRadius.circular(5)),
              onTap: () {
                Get.to(()=> EnterYourCredential());
              },
            ),
          ],
        ),
      ),
    );
  }
}
