// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cardit/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../themes/theme_notifier.dart';

class ReceivePaymentPage extends StatefulWidget {
  const ReceivePaymentPage({Key? key}) : super(key: key);

  @override
  State<ReceivePaymentPage> createState() => _ReceivePaymentPageState();
}

class _ReceivePaymentPageState extends State<ReceivePaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              foregroundColor: Colors.black,
              backgroundColor: Colors.transparent)
          : null,
      body: Responsive.isMobile(context)
          ? Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('How Do You Want To \nReceive',
                      style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.bold,
                          color: HexColor('#004751'))),
                  SizedBox(height: 30),
                  selectCard(
                      context, () {}, Icons.house_outlined, 'Bank Account'),
                  SizedBox(height: 20),
                  selectCard(context, () {
                    print('2 Tapped');
                  }, Icons.wallet_rounded, 'Digital Wallet'),
                  SizedBox(height: 20),
                  selectCard(context, () {
                    print('2 Tapped');
                  }, Icons.credit_card_rounded, 'Apply for Prepaid Card'),
                ],
              ),
            )
          : Responsive.isDesktop(context)
              ? Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Image.asset("assets/applogo-02.png",
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: MediaQuery.of(context).size.height / 3)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildtopbar(),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('How Do You Want To \nReceive',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#004751'))),
                            SizedBox(height: 30),
                            selectcardweb(context, () {}, Icons.house_outlined,
                                'Bank Account'),
                            SizedBox(height: 20),
                            selectcardweb(context, () {
                              print('2 Tapped');
                            }, Icons.wallet_rounded, 'Digital Wallet'),
                            SizedBox(height: 20),
                            selectcardweb(context, () {
                              print('2 Tapped');
                            }, Icons.credit_card_rounded,
                                'Apply for Prepaid Card'),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Image.asset("assets/applogo-02.png",
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: MediaQuery.of(context).size.height / 3)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildtopbar(),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('How Do You Want To \nReceive',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#004751'))),
                            SizedBox(height: 30),
                            selectcardweb(context, () {}, Icons.house_outlined,
                                'Bank Account'),
                            SizedBox(height: 20),
                            selectcardweb(context, () {
                              print('2 Tapped');
                            }, Icons.wallet_rounded, 'Digital Wallet'),
                            SizedBox(height: 20),
                            selectcardweb(context, () {
                              print('2 Tapped');
                            }, Icons.credit_card_rounded,
                                'Apply for Prepaid Card'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
    );
  }

  Widget buildtopbar() {
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

  Widget selectcardweb(
      BuildContext context, Function()? onTap, IconData icon, String title) {
    return Container(
      width: Responsive.isDesktop(context)
          ? MediaQuery.of(context).size.width / 1.5
          : MediaQuery.of(context).size.width / 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width / 4
                  : MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2)),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor('#CEE812')),
                        child: Icon(icon)),
                    SizedBox(width: 50),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(title,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.bold,
                                color: Colors.black54)))
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
      BuildContext context, Function()? onTap, IconData icon, String title) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#CEE812')),
                  child: Icon(icon)),
              SizedBox(width: 50),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)))
            ],
          ),
        ),
      ),
    );
  }
}
