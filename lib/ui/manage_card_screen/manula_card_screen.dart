import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'credit_card_page.dart';

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
                Get.to(const CreditCardPage());
              },
              child: const Text('Add Card',
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Sora', fontSize: 14))),
          const SizedBox(width: 20),
        ],
      ),
      bottomNavigationBar: AuthButton(
        decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        onTap: () {
          // if (formKey.currentState!.validate()) {
          //   // Get.to(const Passcode());
          // }
        },
        text: "Let's Starts Payments",
      ),
    );
  }
}
