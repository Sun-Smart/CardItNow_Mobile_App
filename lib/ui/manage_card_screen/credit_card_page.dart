// ignore_for_file: prefer_const_declarations, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:math' as math;

import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({Key? key}) : super(key: key);

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  bool showBack = false;

  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expiryFieldCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            creditCardData(cardNumber, expiryDate, cardHolderName),
            SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: cardNumberCtrl,
                    decoration: InputDecoration(
                        hintText: 'Card Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2))),
                    maxLength: 16,
                    onChanged: (value) {
                      final newCardNumber = value.trim();
                      var newStr = '';
                      final step = 4;
                      for (var i = 0; i < newCardNumber.length; i += step) {
                        newStr += newCardNumber.substring(
                            i, math.min(i + step, newCardNumber.length));
                        if (i + step < newCardNumber.length) newStr += ' ';
                      }
                      setState(() {
                        cardNumber = newStr;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: expiryFieldCtrl,
                    decoration: InputDecoration(
                        hintText: 'Card Expiry',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2))),
                    maxLength: 5,
                    onChanged: (value) {
                      var newDateValue = value.trim();
                      final isPressingBackspace =
                          expiryDate.length > newDateValue.length;
                      final containsSlash = newDateValue.contains('/');
                      if (newDateValue.length >= 2 &&
                          !containsSlash &&
                          !isPressingBackspace) {
                        newDateValue = newDateValue.substring(0, 2) +
                            '/' +
                            newDateValue.substring(2);
                      }
                      setState(() {
                        expiryFieldCtrl.text = newDateValue;
                        expiryFieldCtrl.selection = TextSelection.fromPosition(
                            TextPosition(offset: newDateValue.length));
                        expiryDate = newDateValue;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Card Holder Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2))),
                    onChanged: (value) {
                      setState(() {
                        cardHolderName = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10),
              ],
            )
          ],
        ),
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
        showBackSide: showBack,
        frontBackground: CardBackgrounds.black,
        backBackground: CardBackgrounds.white,
        showShadow: true,
        mask: getCardTypeMask(
            cardType: CardType.rupay,
            cardNumber: AutofillHints.creditCardFamilyName));
  }
}