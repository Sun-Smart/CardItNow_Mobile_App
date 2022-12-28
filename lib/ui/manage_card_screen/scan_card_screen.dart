// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, unnecessary_import

import 'dart:async';

import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class ScanCard extends StatefulWidget {
  const ScanCard({Key? key}) : super(key: key);

  @override
  State<ScanCard> createState() => _ScanCardState();
}

class _ScanCardState extends State<ScanCard> {
  CardDetails? _cardDetails;
  Future<void> buttonTapped() async {
    final CardDetails? cardDetails = await CardScanner.scanCard(
        scanOptions: CardScanOptions(
            scanCardHolderName: true,
            scanExpiryDate: true,
            maxCardHolderNameLength: 30));
    // if (!mounted || cardDetails == null) return;
    setState(() {
      _cardDetails = cardDetails;
    });
    print(cardDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Scan Credit Card',
              style: TextStyle(
                  color: HexColor('#004751'),
                  fontFamily: 'Sora',
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close, size: 30))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    buttonTapped();
                  },
                  child: Text('Button Pressed'))),
          Text('${_cardDetails?.cardHolderName}'),
          Text('${_cardDetails?.expiryDate}'),
          Text('${_cardDetails?.cardNumber}'),
        ],
      ),
    );
  }
}
