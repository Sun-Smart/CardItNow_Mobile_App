// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:cardit/auth/auth.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/ui/dashboard/paynow_menu/amountpay.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../responsive/responsive.dart';
import '../../../themes/styles.dart';
import '../../../widgets/auth_button.dart';

class PaynowSucessScreen extends StatefulWidget {
  const PaynowSucessScreen({Key? key}) : super(key: key);

  @override
  State<PaynowSucessScreen> createState() => _PaynowSucessScreenState();
}

class _PaynowSucessScreenState extends State<PaynowSucessScreen> {
  @override
  void initState() {
    super.initState();
  }

  final AuthCon con = Get.find();

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
                  // Get.to( const PaymentLoading());
                  // Navigator.pop(context);
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
                                text: 'Angelo',
                                style: TextStyle(
                                    color: themeChange.darkTheme
                                        ? Colors.white
                                        : Color(0xff000000),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                /*defining default style is optional */
                              )),
                              Text(
                                'Angelo@gmail.com',
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
            Text(
              'Congratulations ! ',
              style: TextStyle(
                  color:
                      themeChange.darkTheme ? Colors.white : Color(0xff016F7E),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'We have verified the Recipient.',
              style: TextStyle(
                  color:
                      themeChange.darkTheme ? Colors.white : Color(0xff413D4B),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'You can now initiate payments.',
              style: TextStyle(
                  color:
                      themeChange.darkTheme ? Colors.white : Color(0xff413D4B),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
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
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
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
                                        text: 'Angelo',
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
                                        'Angelo@gmail.com',
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
            Text(
              'Congratulations ! ',
              style: TextStyle(
                  color:
                      themeChange.darkTheme ? Colors.white : Color(0xff016F7E),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'We have verified the Recipient.',
              style: TextStyle(
                  color:
                      themeChange.darkTheme ? Colors.white : Color(0xff413D4B),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'You can now initiate payments.',
              style: TextStyle(
                  color:
                      themeChange.darkTheme ? Colors.white : Color(0xff413D4B),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30,),
            GestureDetector(
     onTap: () {
        // showAlertDialog(context);
        con.invoicegetmethod();
        Get.to(AmountPay());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width:Responsive.isDesktop(context)?
                 MediaQuery.of(context).size.width / 4:  MediaQuery.of(context).size.width / 3,
                
        height: MediaQuery.of(context).size.height * 0.07,
       decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
      
        child: Center(
          child: Text(
           'Start New Payment',
            style: TextStyle(
              fontFamily: 'ProductSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: HexColor('#004751'),
            ),
          ),
        ),
      ),
    )
 
          ],
          )
      
      ),
    ])));
  }

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Stack(
        children: [
          Positioned(
            right: -15,
            top: -15,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
              color: Styles.whitecolortext,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload Invoice "),
              SizedBox(
                height: 2,
              ),
              Text(" Choose from options",
                  style: TextStyle(
                      color: Styles.whitecolortext,
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
      content: Container(
        height: 180,
        child: Column(children: [
          Container(
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: Color(0XFFB7C5C7), width: 1.5),
                color: Color(0XFFffffff),
              ),
              margin: EdgeInsets.all(15),
              child: InkWell(
                highlightColor: Color(0XFFffffff),
                focusColor: Color(0XFFffffff),
                splashColor: Colors.green,
                // splash color
                onTap: () {},
                // button pressed
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0XFFCEE812),
                            ),
                            padding: EdgeInsets.all(5),
                            child: Image.asset(
                              "assets/document-icon.png",
                              width: 24,
                              height: 24,
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "Choose a document",
                          style:
                              TextStyle(color: Color(0XFF413D4B), fontSize: 14),
                        ),
                        // text
                      ],
                    )),
              )),
          Container(
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: Color(0XFFB7C5C7), width: 1.5),
                color: Color(0XFFffffff),
              ),
              margin: EdgeInsets.all(15),
              child: InkWell(
                highlightColor: Color(0XFFffffff),
                focusColor: Color(0XFFffffff),
                splashColor: Colors.green,
                // splash color
                onTap: () {},
                // button pressed
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0XFFCEE812),
                            ),
                            padding: EdgeInsets.all(5),
                            child: Image.asset(
                              "assets/icon-pdf.png",
                              width: 24,
                              height: 24,
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "Take a Picture",
                          style:
                              TextStyle(color: Color(0XFF413D4B), fontSize: 14),
                        ),
                        // text
                      ],
                    )),
              )),
        ]),
      ),
      actions: [
        //okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
      onTap: () {
        // showAlertDialog(context);
        con.invoicegetmethod();
        Get.to(AmountPay());
      },
      text: "Start New Payment",
    );
  }
}
