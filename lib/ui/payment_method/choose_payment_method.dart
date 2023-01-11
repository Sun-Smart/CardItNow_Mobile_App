// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:cardit/ui/payment_method/receive_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'make_payment.dart';

class ChoosePaymentPage extends StatefulWidget {
  const ChoosePaymentPage({Key? key}) : super(key: key);

  @override
  State<ChoosePaymentPage> createState() => _ChoosePaymentPageState();
}

class _ChoosePaymentPageState extends State<ChoosePaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back,
                  size: 25, color: HexColor('#004751')))),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What Would you like \nto do?',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.bold,
                    color: HexColor('#004751'))),
            SizedBox(height: 30),
            selectCard(context, () {
              Get.to(const MakePaymentPage());
            }, Icons.arrow_upward_rounded, 'Make Payments',
                'Pay Via Credit card or Easy Payment Plan \nto payees in a very easy way.'),
            SizedBox(height: 20),
            selectCard(context, () {
              Get.to(const ReceivePaymentPage());
            }, Icons.arrow_downward_rounded, 'Receive Payments',
                'Receive Payment via Carditnow and track \nyour finances.'),
          ],
        ),
      ),
    );
  }

  Widget selectCard(BuildContext context, Function()? onTap, IconData icon,
      String title, String body) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#CEE812')),
                  child: Icon(icon)),
              SizedBox(height: 10),
              Text(title,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold,
                      color: HexColor('#004751'))),
              SizedBox(height: 10),
              Text(body,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
