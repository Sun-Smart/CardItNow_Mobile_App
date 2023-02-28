// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/ui/landingscreens/loans_screen.dart';
import 'package:cardit/ui/payment_method/add_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../const/responsive.dart';
import 'on_board_payee.dart';

class MakePaymentPage extends StatefulWidget {
  const MakePaymentPage({Key? key}) : super(key: key);

  @override
  State<MakePaymentPage> createState() => _MakePaymentPageState();
}

class _MakePaymentPageState extends State<MakePaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)?AppBar(
          foregroundColor: Colors.black, backgroundColor: Colors.transparent):null,
      body: Responsive.isMobile(context)?Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('How Do you want to \npay?',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.bold,
                    color: HexColor('#004751'))),
            SizedBox(height: 30),
            selectCard(context, () {
              Get.to( AddCreditCardPage(
                cardflow: "Regflow",
              ));
            }, 'Use Credit Card',
                'Payment Transfer to the payee within 3 \nworking days'),
            SizedBox(height: 20),
            selectCard(context, () {
              Get.to(const Loans());
            }, 'Easy Payment Plan',
                'Payment Transfer to the payee within 5 \nworking days'),
            SizedBox(height: 20),
            selectCard(context, () {
              Get.to(const OnBoardPayeePage());
            }, 'Brankas',
                'Payment Transfer to the payee within 1 \nworking day'),
          ],
        ),
      ):Responsive.isDesktop(context)?Row(
        children: [
        //  Container(
                      //   width: MediaQuery.of(context).size.width / 3,
                      //   height: MediaQuery.of(context).size.height / 1,
                      //   color: Color(0XFF004751),
                      //   child: Center(
                      //       child: Image.asset("assets/applogo-02.png",
                      //           width: MediaQuery.of(context).size.width / 1.5, height:  MediaQuery.of(context).size.height / 3
                      //         )),
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildtoptitle(),
                          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(height: 30),
            Text('How Do you want to \npay?',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.bold,
                    color: HexColor('#004751'))),
            SizedBox(height: 30),
            selectcardweb(context, () {
              Get.to( AddCreditCardPage());
            }, 'Use Credit Card',
                'Payment Transfer to the payee within 3 \nworking days'),
            SizedBox(height: 20),
            selectcardweb(context, () {
              Get.to(const Loans());
            }, 'Easy Payment Plan',
                'Payment Transfer to the payee within 5 \nworking days'),
            SizedBox(height: 20),
           selectcardweb(context, () {
              Get.to(const OnBoardPayeePage());
            }, 'Brankas',
                'Payment Transfer to the payee within 1 \nworking day'),
          ],
        )
                        ],
                      )
        ],
      ):Row(
        children: [
          // Container(
          //               width: MediaQuery.of(context).size.width / 3,
          //              // height: MediaQuery.of(context).size.height / 1,
          //               color: Color(0XFF004751),
          //               child: Center(
          //                   child: Image.asset("assets/applogo-02.png",
          //                       width: MediaQuery.of(context).size.width / 1.5, height:  MediaQuery.of(context).size.height / 3
          //                     )),
          //             ),
                                     Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildtoptitle(),
                          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(height: 30),
            Text('How Do you want to \npay?',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.bold,
                    color: HexColor('#004751'))),
            SizedBox(height: 30),
            selectcardweb(context, () {
              Get.to( AddCreditCardPage());
            }, 'Use Credit Card',
                'Payment Transfer to the payee within 3 working days'),
            SizedBox(height: 20),
            selectcardweb(context, () {
              Get.to(const Loans());
            }, 'Easy Payment Plan',
                'Payment Transfer to the payee within 5 working days'),
            SizedBox(height: 20),
           selectcardweb(context, () {
              Get.to(const OnBoardPayeePage());
            }, 'Brankas',
                'Payment Transfer to the payee within 1 working day'),
          ],
        )
                        ],
                      )
       
        ],
      ),
    );
  }
   Widget buildtoptitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back,
                color: themeChange.darkTheme ? Colors.white : Colors.black,
                size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container()
        ]);
  }

Widget selectcardweb( BuildContext context, Function()? onTap, String title, String body){
  return Container(
      width: Responsive.isDesktop(context) ?MediaQuery.of(context).size.width/1.5:MediaQuery.of(context).size.width/1.5,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: onTap,
            child: Container(
              width:Responsive.isDesktop(context) ? MediaQuery.of(context).size.width/4:MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold,
                            color: HexColor('#004751'))),
                    SizedBox(height: 10),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(body,
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
  Widget selectCard(
      BuildContext context, Function()? onTap, String title, String body) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold,
                      color: HexColor('#004751'))),
              SizedBox(height: 10),
              Text(body,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
