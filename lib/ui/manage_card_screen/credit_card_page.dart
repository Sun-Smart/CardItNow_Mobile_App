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
<<<<<<< HEAD
  bool showBack = false;

=======
  String cvv = '';
  bool showBack = false;

  late FocusNode _focusNode;
>>>>>>> aad2e59ce3ecd5077e4d2040f1597c0b1f317010
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expiryFieldCtrl = TextEditingController();

  @override
<<<<<<< HEAD
=======
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
>>>>>>> aad2e59ce3ecd5077e4d2040f1597c0b1f317010
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
            const SizedBox(height: 40),
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry: expiryDate,
              cardHolderName: cardHolderName,
              cvv: cvv,
              bankName: 'Axis Bank',
              showBackSide: showBack,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              showShadow: true,
              // mask: getCardTypeMask(cardType: CardType.americanExpress),
            ),
            const SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: cardNumberCtrl,
<<<<<<< HEAD
                    decoration: InputDecoration(
                        hintText: 'Card Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2))),
=======
                    decoration: InputDecoration(hintText: 'Card Number'),
>>>>>>> aad2e59ce3ecd5077e4d2040f1597c0b1f317010
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
<<<<<<< HEAD
                SizedBox(height: 10),
=======
>>>>>>> aad2e59ce3ecd5077e4d2040f1597c0b1f317010
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: expiryFieldCtrl,
<<<<<<< HEAD
                    decoration: InputDecoration(
                        hintText: 'Card Expiry',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2))),
=======
                    decoration: InputDecoration(hintText: 'Card Expiry'),
>>>>>>> aad2e59ce3ecd5077e4d2040f1597c0b1f317010
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
<<<<<<< HEAD
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
=======
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: 'Card Holder Name'),
>>>>>>> aad2e59ce3ecd5077e4d2040f1597c0b1f317010
                    onChanged: (value) {
                      setState(() {
                        cardHolderName = value;
                      });
                    },
                  ),
                ),
<<<<<<< HEAD
                SizedBox(height: 10),
=======
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                //   child: TextFormField(
                //     decoration: InputDecoration(hintText: 'CVV'),
                //     maxLength: 3,
                //     onChanged: (value) {
                //       setState(() {
                //         cvv = value;
                //       });
                //     },
                //     focusNode: _focusNode,
                //   ),
                // ),
>>>>>>> aad2e59ce3ecd5077e4d2040f1597c0b1f317010
              ],
            )
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD

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
=======
>>>>>>> aad2e59ce3ecd5077e4d2040f1597c0b1f317010
}
