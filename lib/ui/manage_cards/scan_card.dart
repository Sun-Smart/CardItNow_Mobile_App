import 'dart:math' as math;

import 'package:awesome_card/awesome_card.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ScanCard extends StatefulWidget {
  const ScanCard({Key? key}) : super(key: key);

  @override
  State<ScanCard> createState() => _ScanCardState();
}

class _ScanCardState extends State<ScanCard> {
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  String bankName = '';
  bool showBack = false;
  int maxLength = 16;

  late FocusNode _focusNode;
  TextEditingController cardNumberCTR1 = TextEditingController();
  TextEditingController expiryFieldCTR1 = TextEditingController();

  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close, size: 30),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            CreditCard(
                cardNumber: cardNumber,
                cardExpiry: expiryDate,
                cardHolderName: cardHolderName,
                cvv: cvv,
                bankName: bankName.toUpperCase(),
                showBackSide: showBack,
                cardType: CardType.masterCard,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.black,
                showShadow: true),
            const SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: cardNumberCTR1,
                    decoration: InputDecoration(
                        labelText: 'Enter Card Number',
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        prefixIcon:
                            const Icon(Icons.credit_card, color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 218, 248, 159),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: HexColor('#CEE812')),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    maxLength: 16,
                    onChanged: (value) {
                      final newCardValue = value.trim();
                      var newStr = ' ';
                      final step = 4;
                      for (var i = 0; i < newCardValue.length; i += step) {
                        newStr += newCardValue.substring(
                            i, math.min(i + step, newCardValue.length));
                        if (i + step < newCardValue.length) newStr += ' ';
                      }
                      setState(() {
                        cardNumber = newStr;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: expiryFieldCTR1,
                    decoration: InputDecoration(
                        labelText: 'MM / YY',
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        prefixIcon: const Icon(Icons.calendar_month,
                            color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 218, 248, 159),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: HexColor('#CEE812')),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    maxLength: 5,
                    onChanged: (value) {
                      var newDateValue = value.trim();
                      final isPressingBackSpace =
                          expiryDate.length > newDateValue.length;
                      final containsSlash = newDateValue.contains('/');
                      if (newDateValue.length >= 2 &&
                          !containsSlash &&
                          !isPressingBackSpace) {
                        newDateValue = newDateValue.substring(0, 2) +
                            '/' +
                            newDateValue.substring(2);
                      }
                      setState(() {
                        expiryFieldCTR1.text = newDateValue;
                        expiryFieldCTR1.selection = TextSelection.fromPosition(
                            TextPosition(offset: newDateValue.length));
                        expiryDate = newDateValue;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Card Holder Name',
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 218, 248, 159),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: HexColor('#CEE812')),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onChanged: (value) {
                      setState(() {
                        cardHolderName = value.trim();
                      });
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Enter Bank Name',
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        prefixIcon: const Icon(Icons.home, color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 218, 248, 159),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: HexColor('#CEE812')),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onChanged: (value) {
                      setState(() {
                        bankName = value.trim();
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                AuthButton(
                  decoration: BoxDecoration(
                    color: HexColor('#CEE812'),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onTap: () {},
                  text: 'SUBMIT',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
