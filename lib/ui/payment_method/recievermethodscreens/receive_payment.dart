// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../themes/theme_notifier.dart';

class ReceivePaymentPage extends StatefulWidget {
  const ReceivePaymentPage({Key? key}) : super(key: key);

  @override
  State<ReceivePaymentPage> createState() => _ReceivePaymentPageState();
}

class _ReceivePaymentPageState extends State<ReceivePaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.black, backgroundColor: Colors.transparent),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('How Do You Want To \nReceive',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.bold,
                    color: HexColor('#004751'))),
            SizedBox(height: 30),
            selectCard(context, () {}, Icons.house_outlined, 'Bank Account'),
            SizedBox(height: 20),
            selectCard(context, () {
              print('2 Tapped');
            }, Icons.wallet_rounded, 'Digital Wallet'),
            SizedBox(height: 20),
            selectCard(context, () {
              print('2 Tapped');
            }, Icons.credit_card_rounded, 'Apply for Prepaid Card'),
          ],
        ),
      ),
    );
  }

  Widget selectCard(
      BuildContext context, Function()? onTap, IconData icon, String title) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#CEE812')),
                  child: Icon(icon)),
              SizedBox(width: 50),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)))
            ],
          ),
        ),
      ),
    );
  }
}
