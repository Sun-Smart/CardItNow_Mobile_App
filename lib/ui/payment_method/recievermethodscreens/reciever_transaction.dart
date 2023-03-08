// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:cardit/themes/theme_notifier.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../api/payment_api.dart';
import '../../../api/regster_api.dart';
import '../../../const/responsive.dart';
import '../../../widgets/auth_button.dart';
import '../../payment/new_payment.dart';

class ReceiverTransaction extends StatefulWidget {
  var paymentType;
  var payee;
  var purpose;
  ReceiverTransaction({Key? key, this.paymentType,this.payee, this.purpose}) : super(key: key);

  @override
  State<ReceiverTransaction> createState() => _ReceiverTransactionState();
}

class _ReceiverTransactionState extends State<ReceiverTransaction> {
  final RegisterAPI con = Get.put(RegisterAPI());
  final PaymentAPI pay = Get.put(PaymentAPI());
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: Responsive.isMobile(context)?bulildbutton():null,
            appBar:Responsive.isMobile(context)? PreferredSize(
              preferredSize: const Size.fromHeight(90.0),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: AppBar(
                    leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close),
                      color: themeChange.darkTheme ? Colors.white : Colors.black,
                    ),
                    centerTitle: true,
                    title: Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xff036D7A),
                                ),
                                child: Image.asset(
                                  'assets/profile.png',
                                  fit: BoxFit.cover,
                                  height: 43,
                                  width: 43,
                                )),
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                          text: "Payee name" ?? "",
                                          style: TextStyle(
                                              color: themeChange.darkTheme
                                                  ? Colors.white
                                                  : Color(0xff000000),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                          /*defining default style is optional */
                                        )),
                                    Text(
                                      "email" ?? "",
                                      style: TextStyle(
                                          color: themeChange.darkTheme
                                              ? Colors.white
                                              : Color(0xffA49EA5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ))
                          ],
                        )),
                  )),
            ):null,
            body:Responsive.isMobile(context) ?Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/notesimg.png',
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      'We are verifying your details and will notify you once done.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color:
                          themeChange.darkTheme ? Colors.white : Color(0xff413D4B),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ):Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    // height: MediaQuery.of(context).size.height / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Image.asset("assets/applogo-02.png",
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 3)),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 1,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close),
                                color: themeChange.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                              ),

                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color(0xff036D7A),
                                  ),
                                  child: Image.asset(
                                    'assets/profile.png',
                                    fit: BoxFit.cover,
                                    height: 43,
                                    width: 43,
                                  )),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                            text: widget.payee["name"] ?? "",
                                            style: TextStyle(
                                                fontFamily: "Sora",
                                                color: themeChange.darkTheme
                                                    ? Colors.white
                                                    : Color(0xff000000),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                            /*defining default style is optional */
                                          )),
                                      Text(
                                        widget.payee["email"] ?? "",
                                        style: TextStyle(
                                            color: themeChange.darkTheme
                                                ? Colors.white
                                                : Color(0xffA49EA5),
                                            fontSize: 12,
                                            fontFamily: "Sora",
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 150,
                          ),
                          Image.asset(
                            'assets/notesimg.png',
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              'We are verifying your details and will notify you once done.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color:
                                  themeChange.darkTheme ? Colors.white : Color(0xff413D4B),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 30,),
                          bulildbutton()

                        ],
                      )

                  ),
                ])));
  }


  Widget bulildbutton() {
    return
      !isLoading
          ? AuthButton(
        decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        onTap: () {
          Get.to(NewPayment(payee: widget.payee, paymentType: widget.paymentType,));
        },
        text: "Request New Payment",
      ) : Container();
  }
}
