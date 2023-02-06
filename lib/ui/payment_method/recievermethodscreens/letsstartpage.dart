// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cardit/ui/payment_method/recievermethodscreens/credit_prepaid_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hexcolor/hexcolor.dart';

class Letsstartpage extends StatefulWidget {
  const Letsstartpage({Key? key}) : super(key: key);

  @override
  State<Letsstartpage> createState() => _LetsstartpageState();
}

class _LetsstartpageState extends State<Letsstartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.close, size: 30)),
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset('assets/banner/banner1.png'),
            SizedBox(height: 50),
            Text(
              'Awesome ! You Are ready to \nRecieve Payments',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Sora',
                  color: HexColor('#036D7B'),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'We have verified your business Details. You are \ngood to go with payments now.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12, fontFamily: 'Sora', color: HexColor('#041316')),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AuthButton(
        onTap: () {
          Get.to(() => CreditPrepaidScreen());
        },
        text: 'Let’s Start',
        decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
