import 'dart:math' as math;

import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
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
  final nameOnCardController = TextEditingController();
  final bankNameController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.document_scanner_outlined)),
          Center(
              child: TextButton(
                  onPressed: () {},
                  child: Text('Scan Card',
                      style: TextStyle(
                          color: HexColor('#041316'),
                          fontSize: 14,
                          fontFamily: 'Sora')))),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
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
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                MyCustomInputBox(
                  enabled: true,
                  label: "Validate",
                  controller: nameOnCardController,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  obsecureText: false,
                  suffixIcon: const Icon(
                    Icons.atm_outlined,
                    color: Colors.grey,
                  ),
                  inputHint: 'Enter Your Validate',
                  validator: (value) {
                    if (nameOnCardController.text.isEmpty) {
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
                const SizedBox(height: 20),
                MyCustomInputBox(
                  enabled: true,
                  label: "Name On Card",
                  controller: nameOnCardController,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  obsecureText: false,
                  suffixIcon: const Icon(
                    Icons.atm_outlined,
                    color: Colors.grey,
                  ),
                  inputHint: 'Enter Your Name',
                  validator: (value) {
                    if (nameOnCardController.text.isEmpty) {
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
                const SizedBox(height: 20),
                MyCustomInputBox(
                  enabled: true,
                  label: "Bank Name",
                  controller: bankNameController,
                  textInputType: TextInputType.emailAddress,
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AuthButton(
        decoration: BoxDecoration(
          color: HexColor('#CEE812'),
          borderRadius: BorderRadius.circular(5),
        ),
        onTap: () {
          if (formKey.currentState!.validate()) {
            // Get.to(const Passcode());
          }
        },
        text: "Verify and Proceed",
      ),
    );
  }
}
