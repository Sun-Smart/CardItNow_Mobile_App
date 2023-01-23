// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cardit/ui/bank_transection/fund_transfer.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hexcolor/hexcolor.dart';

class TransectionSummeryScreen extends StatefulWidget {
  const TransectionSummeryScreen({Key? key}) : super(key: key);

  @override
  State<TransectionSummeryScreen> createState() =>
      _TransectionSummeryScreenState();
}

class _TransectionSummeryScreenState extends State<TransectionSummeryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.close, size: 30, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.stars_sharp, size: 30),
                SizedBox(width: 20),
                Icon(Icons.stars_sharp, size: 30),
              ],
            ),
            SizedBox(height: 30),
            Text('Brankas Tap Demo',
                style: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            Text('uses Brankas to link',
                style: TextStyle(
                    fontFamily: 'Sora', fontSize: 30, color: Colors.black)),
            Text('with your bank',
                style: TextStyle(
                    fontFamily: 'Sora', fontSize: 30, color: Colors.black)),
            Container(
              margin: const EdgeInsets.all(40.0),
              height: 250.0,
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
                    Text('TRANSACTION SUMMARY',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black)),
                    SizedBox(height: 10),
                    Text('Total: ₱ 100.00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.lightBlueAccent)),
                    Divider(color: Colors.grey),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pay',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey)),
                        Text('Brankas Tap',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('To',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey)),
                        Text('Demo',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Amount',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey)),
                        Text('100.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'By Clicking “Continue“ and using the Brankas service, you have fully read, understood and agreed to the updated',
                      style: TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      Text('Client Terms of Use',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontSize: 18)),
                      Text(' together with the', style: TextStyle(fontSize: 18))
                    ],
                  ),
                  Text('Privacy Notice and Consent Form.',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: 30),
            AuthButton(
              text: 'Continue',
              decoration: BoxDecoration(
                  color: HexColor('#CEE812'),
                  borderRadius: BorderRadius.circular(5)),
              onTap: () {
                Get.to(() => FundTransfer());
              },
            ),
            SizedBox(height: 10),
            Text('Secure Banking Connection by'),
            SizedBox(height: 10),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Divider(color: Colors.grey)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
