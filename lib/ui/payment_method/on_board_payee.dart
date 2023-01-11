// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class OnBoardPayeePage extends StatefulWidget {
  const OnBoardPayeePage({Key? key}) : super(key: key);

  @override
  State<OnBoardPayeePage> createState() => _OnBoardPayeePageState();
}

class _OnBoardPayeePageState extends State<OnBoardPayeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Onboard Payee', style: TextStyle(fontFamily: 'Sora', fontSize: 14))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Recipient’s Name',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Sora',
                      color: Colors.black)),
              SizedBox(height: 5),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Enter your account number',
                      filled: true,
                      fillColor: Colors.white,
                      floatingLabelBehavior:
                      FloatingLabelBehavior.never,
                      helperStyle: const TextStyle(
                          fontFamily: 'Sora', fontSize: 14),
                      hintStyle: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.normal),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      focusColor: Colors.grey.shade300,
                      border: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                              color: Colors.grey, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                              color: Colors.grey, width: 1.0)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          gapPadding: 7,
                          borderSide:
                          const BorderSide(color: Colors.grey)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                          const BorderSide(color: Colors.grey)),
                      errorStyle: const TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 13,
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 10),
              Text('Recipient’s Name',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Sora',
                      color: Colors.black)),
              SizedBox(height: 5),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Enter your account number',
                      filled: true,
                      fillColor: Colors.white,
                      floatingLabelBehavior:
                      FloatingLabelBehavior.never,
                      helperStyle: const TextStyle(
                          fontFamily: 'Sora', fontSize: 14),
                      hintStyle: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.normal),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      focusColor: Colors.grey.shade300,
                      border: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                              color: Colors.grey, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                              color: Colors.grey, width: 1.0)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          gapPadding: 7,
                          borderSide:
                          const BorderSide(color: Colors.grey)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                          const BorderSide(color: Colors.grey)),
                      errorStyle: const TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 13,
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 10),
              Text('Recipient’s Name',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Sora',
                      color: Colors.black)),
              SizedBox(height: 5),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Enter your account number',
                      filled: true,
                      fillColor: Colors.white,
                      floatingLabelBehavior:
                      FloatingLabelBehavior.never,
                      helperStyle: const TextStyle(
                          fontFamily: 'Sora', fontSize: 14),
                      hintStyle: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.normal),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      focusColor: Colors.grey.shade300,
                      border: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                              color: Colors.grey, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                              color: Colors.grey, width: 1.0)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          gapPadding: 7,
                          borderSide:
                          const BorderSide(color: Colors.grey)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                          const BorderSide(color: Colors.grey)),
                      errorStyle: const TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 13,
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
