// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unnecessary_new, avoid_unnecessary_containers

import 'package:cardit/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AddCreditCardPage extends StatefulWidget {
  const AddCreditCardPage({Key? key}) : super(key: key);

  @override
  State<AddCreditCardPage> createState() => _AddCreditCardPageState();
}

class _AddCreditCardPageState extends State<AddCreditCardPage> {
  final otpController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          actions: [
            Row(children: [
              Icon(Icons.document_scanner_outlined),
              TextButton(
                  onPressed: () {
                    print('Scan Tapped');
                  },
                  child: Text('Scan Card',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 14,
                          color: Colors.black)))
            ])
          ]),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add credit card',
                  style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold,
                      color: HexColor('#004751'))),
              SizedBox(height: 20),
              Text('Card Number',
                  style: TextStyle(
                      color: HexColor('#041316'),
                      fontFamily: 'Sora',
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Container(
                  child: Stack(children: [
                Positioned(
                    right: Responsive.isMobile(context)
                        ? 20
                        : Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 2.5
                            : MediaQuery.of(context).size.width / 3.2,
                    top: 35,
                    child: Image.asset('')),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
