// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, unnecessary_null_comparison, avoid_unnecessary_containers, avoid_print, unrelated_type_equality_checks

import 'package:cardit/auth/auth.dart';
import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/ui/payment_method/add_credit_card.dart';
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
  final AuthCon con = Get.find();

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
                  Get.to(const AddCreditCardPage());
                },
                child: const Text('Add Card',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Sora',
                        fontSize: 14))),
            const SizedBox(width: 20),
          ]),
      body: Obx(
            () => con.creditCardGet.isEmpty
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text('Add Your Credit Card',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Sora',
                        color: Colors.black,
                        fontWeight: FontWeight.bold))),
            SizedBox(height: 30),
            Center(
                child: Text(
                    'Great ! You Are ready with your \nCredit card',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#004751')))),
            SizedBox(height: 10),
            Center(
                child: Text(
                    'We have verified your Credit Card and Details. \nYou are good to go with payments now.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey))),
          ],
        )
            : ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: con.creditCardGet.length,
          itemBuilder: (context, index) {
            return Obx(() => Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: CustomeCardData(
                    bankName:
                    con.creditCardGet[index]['bankname'].toString(),
                    cardNumber:
                    con.creditCardGet[index]['cardnumber'].toString(),
                    nameHolder:
                    con.creditCardGet[index]['cardname'].toString(),
                    validity: con.creditCardGet[index]['expirydate']
                        .toString())));
          },
        ),
      ),
      bottomNavigationBar: AuthButton(
        decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        onTap: () {
          con.creditCardgetAPI();
          //  Get.to(const DashbordScreen());
        },
        text: "Let's Start Payments",
      ),
    );
  }
}

class CustomeCardData extends StatelessWidget {
  final String bankName, cardNumber, nameHolder, validity;

  const CustomeCardData(
      {Key? key,
        required this.bankName,
        required this.cardNumber,
        required this.nameHolder,
        required this.validity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthCon con = Get.find();
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 230,
          decoration: BoxDecoration(
              image:
              DecorationImage(image: AssetImage('assets/card/card.png'))),
          child: Stack(
            children: [
              Positioned(
                left: 28,
                top: 35,
                child: Text(bankName,
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, fontFamily: 'Sora')),
              ),
              Positioned(
                left: 28,
                bottom: 100,
                child: Text(nameHolder,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'Sora')),
              ),
              Positioned(
                right: 25,
                bottom: 100,
                child: Text(cardNumber,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: 'Sora')),
              ),
              Positioned(
                left: 60,
                bottom: 28,
                child: Text('${validity.substring(5, 10)}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: 'Sora')),
              ),
              Positioned(
                  right: 35,
                  bottom: 26,
                  child: Image.asset('assets/card/visa.png',
                      width: 35, height: 20)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              con.creditCardGet.length == 1
                  ? SizedBox()
                  : InkWell(
                onTap: () {
                  print('hiiiii');
                },
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        color: HexColor('#CEE812'),
                        borderRadius: BorderRadius.circular(5)),
                    height: 25,
                    width: 120,
                    child: Text('Set as default',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold))),
              ),
              InkWell(
                onTap: () {
                  print('Heloo Tapped');
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      color: HexColor('#CEE812'),
                      borderRadius: BorderRadius.circular(5)),
                  height: 25,
                  width: 100,
                  child: Text('In active',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
