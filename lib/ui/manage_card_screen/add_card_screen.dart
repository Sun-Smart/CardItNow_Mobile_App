// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_declarations

import 'dart:math' as math;

import 'package:cardit/widgets/auth_button.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:credit_card_scanner/models/card_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'scan_card_screen.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final formKey = GlobalKey<FormState>();
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expiryFieldCtrl = TextEditingController();
  TextEditingController cardHolderNameCtrl = TextEditingController();

  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  bool showBack = false;

  // Scan Card Function
  CardDetails? _cardDetails;
  CardScanOptions scanOptions = const CardScanOptions(
    scanCardHolderName: true,
    // enableDebugLogs: true,
    validCardsToScanBeforeFinishingScan: 5,
    possibleCardHolderNamePositions: [
      CardHolderNameScanPosition.aboveCardNumber
    ],
  );

  Future<void> scanCard() async {
    final CardDetails? cardDetails =
        await CardScanner.scanCard(scanOptions: scanOptions);
    if (!mounted || cardDetails == null) return;
    setState(() {
      _cardDetails = cardDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text('Add Credit Card',
            style: TextStyle(
                color: HexColor('#004751'),
                fontFamily: 'Sora',
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 20, bottom: 10),
                  child: Text('Card Number',
                      style: TextStyle(
                          color: HexColor('#004751'),
                          fontFamily: 'Sora',
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: cardNumberCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: cardNumberCtrl.text.isEmpty
                          ? 'Card Number'
                          : _cardDetails?.cardNumber,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                    maxLength: 16,
                    validator: (value) {
                      if (cardNumberCtrl.text.isEmpty) {
                        return "Please Enter Card Number";
                      } else {
                        return null;
                      }
                    },
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
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 10),
                  child: Text('Card Expiry Date',
                      style: TextStyle(
                          color: HexColor('#004751'),
                          fontFamily: 'Sora',
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: expiryFieldCtrl,
                    decoration: InputDecoration(
                        hintText: cardNumberCtrl.text.isEmpty
                            ? 'Card Expiry'
                            : _cardDetails?.expiryDate,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2))),
                    maxLength: 5,
                    validator: (value) {
                      if (expiryFieldCtrl.text.isEmpty) {
                        return "Please Enter Card Expory Date";
                      } else {
                        return null;
                      }
                    },
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
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 10),
                  child: Text('Card Holder Name',
                      style: TextStyle(
                          color: HexColor('#004751'),
                          fontFamily: 'Sora',
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: cardHolderNameCtrl,
                    validator: (value) {
                      if (cardHolderNameCtrl.text.isEmpty) {
                        return "Please Enter Card Holder Name";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Card Holder Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2))),
                    onChanged: (value) {
                      setState(() {
                        cardHolderName = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomData(),
    );
  }

  Widget bottomData() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5.5,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.document_scanner_outlined, color: HexColor('#004751')),
              TextButton(
                  onPressed: () {
                    Get.to(const ScanCard());
                    //scanCard();
                  },
                  child: Text('Scan Card',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 14,
                          color: HexColor('#004751')))),
            ],
          ),
          AuthButton(
            decoration: BoxDecoration(
                color: HexColor('#CEE812'),
                borderRadius: BorderRadius.circular(5)),
            onTap: () {
              if (formKey.currentState!.validate()) {}
            },
            text: "Verify and Add",
          ),
        ],
      ),
    );
  }
}
