// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cardit/ui/payment_method/add_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'on_board_payee.dart';

class MakePaymentPage extends StatefulWidget {
  const MakePaymentPage({Key? key}) : super(key: key);

  @override
  State<MakePaymentPage> createState() => _MakePaymentPageState();
}

class _MakePaymentPageState extends State<MakePaymentPage> {
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
            Text('How Do you want to \npay?',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.bold,
                    color: HexColor('#004751'))),
            SizedBox(height: 30),
            selectCard(context, () {
              Get.to(const AddCreditCardPage());
            }, 'Use Credit Card',
                'Payment Transfer to the payee within 3 \nworking days'),
            SizedBox(height: 20),
            selectCard(context, () {
              print('2 Tapped');
            }, 'Easy Payment Plan',
                'Payment Transfer to the payee within 5 \nworking days'),
            SizedBox(height: 20),
            selectCard(context, () {
              Get.to(const OnBoardPayeePage());
            }, 'Brankas',
                'Payment Transfer to the payee within 1 \nworking day'),
          ],
        ),
      ),
    );
  }

  Widget selectCard(
      BuildContext context, Function()? onTap, String title, String body) {
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
