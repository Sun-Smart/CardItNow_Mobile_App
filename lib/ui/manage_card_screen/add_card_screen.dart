// ignore_for_file: sized_box_for_whitespace

import 'dart:math' as math;

import 'package:cardit/ui/manage_card_screen/scan_card_screen.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:credit_card_scanner/models/card_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final formKey = GlobalKey<FormState>();
  TextEditingController creditCardController = TextEditingController();
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
              children: [
                Text('Add Credit Card',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#004751'))),
                const SizedBox(height: 20),
                MyCustomInputBox(
                  enabled: true,
                  label: "Card Number",
                  controller: creditCardController,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  obsecureText: false,
                  inputHint: 'Enter your card number',
                  validator: (value) {
                    if (creditCardController.text.isEmpty) {
                      return "Please Enter Card Number";
                    } else {
                      return null;
                    }
                  },
                  maxLines: 16,
                  onChanged: (value) {
                    final newCardValue = value!.trim();
                    var newStr = ' ';
                    const step = 4;
                    for (var i = 0; i < newCardValue.length; i += step) {
                      newStr += newCardValue.substring(
                          i, math.min(i + step, newCardValue.length));
                      if (i + step < newCardValue.length) newStr += ' ';
                    }
                    setState(() {
                      cardNumber = newStr;
                    });
                  },
                  inputDecoration: InputDecoration(
                      suffixIcon:
                          const Icon(Icons.atm_outlined, color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '4XXX 5XXX 7XXX 3XXX',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      helperStyle:
                          const TextStyle(fontFamily: 'Sora', fontSize: 14),
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.normal,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      focusColor: Colors.grey.shade300,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          gapPadding: 7,
                          borderSide: const BorderSide(color: Colors.grey)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(color: Colors.grey)),
                      errorStyle: const TextStyle(
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
      child: Column(children: [
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
                        color: HexColor('#004751'))))
          ],
        ),
      ]),
    );
  }
}
