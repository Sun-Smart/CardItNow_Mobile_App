// ignore_for_file: prefer_const_constructors

import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ScanCard extends StatefulWidget {
  const ScanCard({Key? key}) : super(key: key);

  @override
  State<ScanCard> createState() => _ScanCardState();
}

class _ScanCardState extends State<ScanCard> {
  CardDetails? _cardDetails;
  CardScanOptions scanOptions = CardScanOptions(
      scanExpiryDate: true,
      enableDebugLogs: true,
      maxCardHolderNameLength: 30,
      scanCardHolderName: true,
      considerPastDatesInExpiryDateScan: true,
      enableLuhnCheck: true,
      validCardsToScanBeforeFinishingScan: 5,
      possibleCardHolderNamePositions: [
        CardHolderNameScanPosition.aboveCardNumber
      ]);

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
          title: Text('Scan Card',
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  scanCard();
                },
                child: Text('Scan Card')),
            Column(
              children: [
                Text('${_cardDetails?.cardNumber}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'Sora')),
                Text('${_cardDetails?.expiryDate}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'Sora')),
                Text('${_cardDetails?.cardHolderName}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'Sora')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
