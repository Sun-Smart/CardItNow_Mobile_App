import 'package:awesome_card/awesome_card.dart';
import 'package:cardit/ui/manage_card_screen/add_card_screen.dart';
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
                // Get.to(const CreditCardPage());
                Get.to(const AddCard());
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
        onTap: () {},
        text: "Let's Starts Payments",
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
