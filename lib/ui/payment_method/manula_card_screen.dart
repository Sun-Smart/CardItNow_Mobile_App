// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, unnecessary_null_comparison, avoid_unnecessary_containers

import 'package:cardit/auth/auth.dart';
import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/ui/payment_method/add_credit_card.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ManualCard extends StatefulWidget {
  const ManualCard({Key? key}) : super(key: key);

  @override
  State<ManualCard> createState() => _ManualCardState();
}

class _ManualCardState extends State<ManualCard> {
  final AuthCon con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close, color: Colors.black)),
          actions: [
            const Icon(Icons.add, color: Colors.black),
            TextButton(
                onPressed: () {
                  Get.to(const AddCreditCardPage());
                },
                child: const Text('Add Card',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Sora',
                        fontSize: 14))),
            const SizedBox(width: 20),
          ]),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: con.creditCardGet == null
              ? Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          child: Center(
                              child: Text('Add Your Credit Card',
                                  style: TextStyle(
                                      fontFamily: 'Sora',
                                      fontSize: 20,
                                      color: Colors.black)))),
                      SizedBox(height: 100),
                      Text('Great ! You Are ready with your \nCredit card',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: HexColor('#004751'))),
                      SizedBox(height: 10),
                      Text(
                          'We have verified your Credit Card and Details. \nYou are good to go with payments now.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                    ],
                  ))
              : Obx(
                  () => Column(
                    children: [
                      CustomeCardData(
                          bankName: con.creditCardGet['bankname'] ?? '',
                          cardNumber: con.creditCardGet['cardnumber'] ?? '',
                          nameHolder: con.creditCardGet['cardname'] ?? '',
                          validity: con.creditCardGet['expirydate'] ?? ''),
                    ],
                  ),
                ),
        ),
      ),
      bottomNavigationBar: AuthButton(
        decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        onTap: () {
          Get.to(const DashbordScreen());
        },
        text: "Let's Start Payments",
      ),
    );
  }
}

class CustomeCardData extends StatelessWidget {
  final String bankName, cardNumber, nameHolder, validity;

  const CustomeCardData(
      {Key? key,
      required this.bankName,
      required this.cardNumber,
      required this.nameHolder,
      required this.validity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 230,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/card/card.png'))),
      child: Stack(
        children: [
          Positioned(
              left: 25,
              top: 35,
              child: Text(bankName,
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: 'Sora'))),
          Positioned(
              left: 25,
              bottom: 100,
              child: Text(nameHolder,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'Sora'))),
          Positioned(
            right: 25,
            bottom: 100,
            child: Text(
              // 'xxxx xxxx xxxx ${cardNumber.substring(12, 16)}',
              cardNumber,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  fontFamily: 'Sora'),
            ),
          ),
          Positioned(
            left: 60,
            bottom: 28,
            child: Text(
              '${validity.substring(0, 10)}',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  fontFamily: 'Sora'),
            ),
          ),
          Positioned(
            right: 35,
            bottom: 28,
            child: Image.asset('assets/card/visa.png', width: 35, height: 20),
          ),
        ],
      ),
    );
  }
}
