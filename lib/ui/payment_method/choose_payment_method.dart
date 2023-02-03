// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/ui/payment_method/receive_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../themes/theme_notifier.dart';
import 'make_payment.dart';

class ChoosePaymentPage extends StatefulWidget {
  const ChoosePaymentPage({Key? key}) : super(key: key);

  @override
  State<ChoosePaymentPage> createState() => _ChoosePaymentPageState();
}

class _ChoosePaymentPageState extends State<ChoosePaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              foregroundColor: Colors.black,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back,
                      size: 25, color: HexColor('#004751'))))
          : null,
      body: Responsive.isMobile(context)
          ? Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('What Would you like \nto do?',
                      style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.bold,
                          color: HexColor('#004751'))),
                  SizedBox(height: 30),
                  selectCard(context, () {
                    Get.to(const MakePaymentPage());
                  }, 'assets/card/up_arrow.png', 'Make Payments',
                      'Pay Via Credit card or Easy Payment Plan \nto payees in a very easy way.'),
                  SizedBox(height: 20),
                  selectCard(context, () {
                    Get.to(const ReceivePaymentPage());
                  }, 'assets/banner/down_arrow.png', 'Receive Payments',
                      'Receive Payment via Carditnow and track \nyour finances.')
                ],
              ),
            )
          : Responsive.isDesktop(context)
              ? Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Image.asset("assets/applogo-02.png",
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: MediaQuery.of(context).size.height / 3)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildtoptitle(),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('What Would you like \nto do?',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#004751'))),
                            SizedBox(height: 30),
                            selectcardweb(context, () {
                              Get.to(const MakePaymentPage());
                            }, 'assets/card/up_arrow.png', 'Make Payments',
                                'Pay Via Credit card or Easy Payment Plan \nto payees in a very easy way.'),
                            SizedBox(height: 20),
                            selectcardweb(context, () {
                              Get.to(const ReceivePaymentPage());
                            },
                                'assets/banner/down_arrow.png',
                                'Receive Payments',
                                'Receive Payment via Carditnow and track \nyour finances.')
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              : Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Image.asset("assets/applogo-02.png",
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 3)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildtoptitle(),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('What Would you like \nto do?',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('#004751'))),
                          SizedBox(height: 30),
                          selectcardweb(context, () {
                            Get.to(const MakePaymentPage());
                          }, 'assets/card/up_arrow.png', 'Make Payments',
                              'Pay Via Credit card or Easy Payment Plan \nto payees in a very easy way.'),
                          SizedBox(height: 20),
                          selectcardweb(context, () {
                            Get.to(const ReceivePaymentPage());
                          }, 'assets/banner/down_arrow.png', 'Receive Payments',
                              'Receive Payment via Carditnow and track \nyour finances.')
                        ],
                      ),
                    ],
                  ),
                ]),
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

  Widget selectcardweb(BuildContext context, Function()? onTap, String image,
      String title, String body) {
    return Container(
      //  color: Colors.black,
      width: Responsive.isDesktop(context)
          ? MediaQuery.of(context).size.width / 1.5
          : MediaQuery.of(context).size.width / 1.5,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              //height: MediaQuery.of(context).size.height / 2 ,
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width / 4
                  : MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(image, width: 40, height: 40),
                    SizedBox(height: 10),
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

  Widget selectCard(BuildContext context, Function()? onTap, String image,
      String title, String body) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image, width: 40, height: 40),
              SizedBox(height: 10),
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
