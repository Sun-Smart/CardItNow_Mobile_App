// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, unnecessary_null_comparison, avoid_unnecessary_containers, avoid_print, unrelated_type_equality_checks, unnecessary_brace_in_string_interps

import 'package:cardit/const/responsive.dart';
import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/ui/payment_method/add_credit_card.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../api/card_api.dart';
import '../../api/regster_api.dart';
import '../../widgets/drawer_web.dart';

class ManualCard extends StatefulWidget {
  const ManualCard({Key? key}) : super(key: key);

  @override
  State<ManualCard> createState() => _ManualCardState();
}

class _ManualCardState extends State<ManualCard> {
  final RegisterAPI con = Get.find();
  final CardAPI cardcons = Get.put(CardAPI());

  @override
  void initState() {
    setState(() {
      cardcons.creditCardgetAPI();
    });
    super.initState();
  }

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
                  Get.to(AddCreditCardPage());
                },
                child: const Text('Add Card',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Sora',
                        fontSize: 14))),
            const SizedBox(width: 20),
          ]),
      body: Responsive.isMobile(context)
          ? Obx(() => cardcons.creditCardGet.isEmpty
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
                  itemCount: cardcons.creditCardGet.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Obx(() => CustomeCardData(
                            cardDefault: cardcons.creditCardGet[index]
                                    ['carddefault']
                                .toString(),
                            customerId: cardcons.creditCardGet[index]
                                    ['customerid']
                                .toString(),
                            id: cardcons.creditCardGet[index]['payid']
                                .toString(),
                            bankName: cardcons.creditCardGet[index]['bankname']
                                .toString(),
                            cardNumber: cardcons.creditCardGet[index]
                                    ['cardnumber']
                                .toString(),
                            nameHolder: cardcons.creditCardGet[index]['cardname']
                                .toString(),
                            validity: cardcons.creditCardGet[index]
                                    ['expirydate']
                                .toString())));
                  },
                ))
          : Obx(() => cardcons.creditCardGet.isEmpty
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
                    SizedBox(height: 50),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          if (Responsive.isMobile(context)) {
                            Get.offAll(const DashbordScreen());
                          } else {
                            Get.offAll(const DrawerWeb());
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          width: Responsive.isDesktop(context)
                              ? MediaQuery.of(context).size.width / 4.5
                              : MediaQuery.of(context).size.width / 3.5,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: HexColor('#CEE812'),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "Let's Start Payments",
                              style: TextStyle(
                                fontFamily: 'ProductSans',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: HexColor('#004751'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: cardcons.creditCardGet.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Obx(() => CustomeCardData(
                            cardDefault: cardcons.creditCardGet[index]
                                    ['carddefault']
                                .toString(),
                            customerId: cardcons.creditCardGet[index]
                                    ['customerid']
                                .toString(),
                            id: cardcons.creditCardGet[index]['payid']
                                .toString(),
                            bankName: cardcons.creditCardGet[index]['bankname']
                                .toString(),
                            cardNumber: cardcons.creditCardGet[index]
                                    ['cardnumber']
                                .toString(),
                            nameHolder: cardcons.creditCardGet[index]['cardname']
                                .toString(),
                            validity: cardcons.creditCardGet[index]
                                    ['expirydate']
                                .toString())));
                  },
                )),
      bottomNavigationBar: Responsive.isMobile(context)
          ? AuthButton(
              decoration: BoxDecoration(
                  color: HexColor('#CEE812'),
                  borderRadius: BorderRadius.circular(5)),
              onTap: () {
                if (Responsive.isMobile(context)) {
                  Get.to(const DashbordScreen());
                } else {
                  Get.to(const DrawerWeb());
                }
              },
              text: "Let's Start Payments",
            )
          : null,
    );
  }
}

class CustomeCardData extends StatelessWidget {
  final String bankName,
      cardNumber,
      nameHolder,
      validity,
      id,
      customerId,
      cardDefault;

  const CustomeCardData(
      {Key? key,
      required this.cardDefault,
      required this.bankName,
      required this.cardNumber,
      required this.nameHolder,
      required this.validity,
      required this.id,
      required this.customerId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CardAPI cardcons = Get.put(CardAPI());
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: 230,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/banner/card_01.png'))),
            child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(bankName,
                            style: TextStyle(
                                fontFamily: 'Sora',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Text(cardNumber,
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: Responsive.isMobile(context)
                          ? MediaQuery.of(context).size.width
                          : MediaQuery.of(context).size.width / 4,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xffC9E313),
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text("Exp ${validity.substring(5, 10)}",
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                          Text(nameHolder,
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                        ],
                      ),
                    )
                  ],
                ))),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: MaterialButton(
              color: HexColor('#CEE812'),
              onPressed: () {
                cardcons.setCardDefaultPost(id);
                print('Pay id ${id}');
                print('Customer user id ${customerId}');
                print('Card Default status ${cardDefault}');
              },
              child: Text(cardDefault == '1' ? 'Activated' : 'Set as default',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    );
  }
}
