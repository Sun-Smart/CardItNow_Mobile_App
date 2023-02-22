// ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_unnecessary_containers, unnecessary_import

import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../api/regster_api.dart';

class SelectDefaultCard extends StatefulWidget {
  final String cardNumber, cardHolderName, bankName, expDate;

  const SelectDefaultCard(
      {Key? key,
      required this.cardNumber,
      required this.cardHolderName,
      required this.bankName,
      required this.expDate})
      : super(key: key);

  @override
  State<SelectDefaultCard> createState() => _SelectDefaultCardState();
}

class _SelectDefaultCardState extends State<SelectDefaultCard> {
  final RegisterAPI con = Get.find();
  bool setAsDefault = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text('Select Default card',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.bold,
                  color: Colors.black))),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Card Number',
                  style: TextStyle(
                      color: HexColor('#041316'),
                      fontFamily: 'Sora',
                      fontSize: 16)),
              SizedBox(height: 10),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 2)),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.cardNumber,
                              style: TextStyle(
                                  color: HexColor('#041316'),
                                  fontFamily: 'Sora',
                                  fontSize: 16))))),
              SizedBox(height: 10),
              Text('Validity',
                  style: TextStyle(
                      color: HexColor('#041316'),
                      fontFamily: 'Sora',
                      fontSize: 16)),
              SizedBox(height: 10),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 2)),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.expDate,
                              style: TextStyle(
                                  color: HexColor('#041316'),
                                  fontFamily: 'Sora',
                                  fontSize: 16))))),
              SizedBox(height: 10),
              Text('Name On Card',
                  style: TextStyle(
                      color: HexColor('#041316'),
                      fontFamily: 'Sora',
                      fontSize: 16)),
              SizedBox(height: 10),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 2)),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.cardHolderName,
                              style: TextStyle(
                                  color: HexColor('#041316'),
                                  fontFamily: 'Sora',
                                  fontSize: 16))))),
              SizedBox(height: 10),
              Text('Bank Name',
                  style: TextStyle(
                      color: HexColor('#041316'),
                      fontFamily: 'Sora',
                      fontSize: 16)),
              SizedBox(height: 10),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 2)),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.bankName,
                              style: TextStyle(
                                  color: HexColor('#041316'),
                                  fontFamily: 'Sora',
                                  fontSize: 16))))),
              SizedBox(height: 10),
              Text('Add Nick Name',
                  style: TextStyle(
                      color: HexColor('#041316'),
                      fontFamily: 'Sora',
                      fontSize: 16)),
              SizedBox(height: 10),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 2)),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.bankName,
                              style: TextStyle(
                                  color: HexColor('#041316'),
                                  fontFamily: 'Sora',
                                  fontSize: 16))))),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: setAsDefault,
                    checkColor: Colors.white,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        setAsDefault = value!;
                      });
                    }
                  ),
                  Text('Set as default',
                      style: TextStyle(
                          color: HexColor('#041316'),
                          fontFamily: 'Sora',
                          fontSize: 16)),
                ],
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: AuthButton(
          onTap: () {},
          text: 'Submit',
          decoration: BoxDecoration(color: HexColor('#CEE812'))),
    );
  }
}
