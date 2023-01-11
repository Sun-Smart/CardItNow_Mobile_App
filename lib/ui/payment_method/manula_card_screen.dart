// ignore_for_file: prefer_const_constructors

import 'package:awesome_card/awesome_card.dart';
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
                      color: Colors.black, fontFamily: 'Sora', fontSize: 14))),
          const SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.asset('assets/banner/banner1.png'),
              SizedBox(height: 100),
              Text(
                'Great ! You Are ready with your \nCredit card',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: HexColor('#004751'),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We have verified your Credit Card and Details. \nYou are good to go with payments now.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
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

  Widget creditCardData(
      String cardNumber, String expiryDate, String cardHolderName) {
    return CreditCard(
        cardNumber: cardNumber,
        cardExpiry: expiryDate,
        cardHolderName: cardHolderName,
        bankName: 'Axis Bank',
        showBackSide: false,
        frontBackground: CardBackgrounds.black,
        backBackground: CardBackgrounds.white,
        showShadow: true,
        mask: getCardTypeMask(
            cardType: CardType.rupay,
            cardNumber: AutofillHints.creditCardFamilyName));
  }
}
