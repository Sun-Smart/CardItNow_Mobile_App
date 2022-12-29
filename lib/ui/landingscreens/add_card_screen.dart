// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:math' as math;

import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final formKey = GlobalKey<FormState>();
  final creditCardController = TextEditingController();
  final dateController = TextEditingController();
  final bankNameController = TextEditingController();
  final customerNameController = TextEditingController();

  late FocusNode _focusNode;
  String cardNumber = '';
  bool showBack = false;

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

  //Scan Card Query
  CardDetails? _cardDetails;
  CardScanOptions scanOptions = CardScanOptions(
    scanExpiryDate: true,
    // enableDebugLogs: true,
    //  maxCardHolderNameLength: 30,
    scanCardHolderName: true,
    // considerPastDatesInExpiryDateScan: true,
    //  enableLuhnCheck: true,
    validCardsToScanBeforeFinishingScan: 5,
    // possibleCardHolderNamePositions: [
    //   CardHolderNameScanPosition.aboveCardNumber
    // ],
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
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              MyCustomInputBox(
                enabled: true,
                maxLength: 16,
                label: "Card Number",
                controller: creditCardController,
                keyboardType: TextInputType.phone,
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
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              MyCustomInputBox(
                enabled: true,
                maxLength: 5,
                label: "Validate",
                controller: dateController,
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.next,
                obsecureText: false,
                suffixIcon: const Icon(
                  Icons.atm_outlined,
                  color: Colors.grey,
                ),
                inputHint: 'Enter Your Validate',
                validator: (value) {
                  if (dateController.text.isEmpty) {
                    return "Please Enter Card Validate";
                  } else {
                    return null;
                  }
                },
                inputDecoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '09/24',
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
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              MyCustomInputBox(
                enabled: true,
                label: "Name On Card",
                controller: customerNameController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                obsecureText: false,
                suffixIcon: const Icon(
                  Icons.atm_outlined,
                  color: Colors.grey,
                ),
                inputHint: 'Enter Your Name',
                validator: (value) {
                  if (customerNameController.text.isEmpty) {
                    return "Please Enter Card Name";
                  } else {
                    return null;
                  }
                },
                inputDecoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your name',
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
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 5),
              MyCustomInputBox(
                enabled: true,
                label: "Bank Name",
                controller: bankNameController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                obsecureText: false,
                suffixIcon: const Icon(
                  Icons.atm_outlined,
                  color: Colors.grey,
                ),
                inputHint: 'Enter your bank name',
                validator: (value) {
                  if (bankNameController.text.isEmpty) {
                    return "Please Enter Bank Name";
                  } else {
                    return null;
                  }
                },
                inputDecoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter bank name',
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
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              Text('${_cardDetails?.cardNumber}'),
              Text('${_cardDetails?.expiryDate}'),
              Text('${_cardDetails?.cardHolderName}'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomData(),
    );
  }

  Widget bottomData() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.document_scanner_outlined, color: HexColor('#004751')),
              TextButton(
                  onPressed: () {
                    //Get.to(const ScanCard());
                    scanCard();
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
              if (formKey.currentState!.validate()) {
                // Get.to(const Passcode());
              }
            },
            text: "Verify and Add",
          ),
        ],
      ),
    );
  }
}
