// ignore_for_file: unnecessary_import

import 'dart:ui';

import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/ui/login/login_screen.dart';
import 'package:cardit/ui/register/select_country_screen.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../themes/styles.dart';
import '../../themes/theme_notifier.dart';
import '../register/drawer/drawerscreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      drawer: Column(

        children: [
          Container(
              height: 500,

              width: MediaQuery.of(context).size.width / 1,
              child: drawer()),
        ],
      ),
      backgroundColor: themeChange.darkTheme
          ? const Color(0XFF000000)
          : const Color(0XFFffffff),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 10, 15),
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.green),
            elevation: 0,
            leading:Builder( builder: (context) =>
            GestureDetector(
              onTap: (){
                Scaffold.of(context).openDrawer();
              },

                child: SvgPicture.asset('assets/sortingleft.svg', width: 16)),),
            actions: [
              CustomSlidingSegmentedControl<int>(
                thumbDecoration: BoxDecoration(
                    color: const Color(0XFFCEE812),
                    borderRadius: BorderRadius.circular(4)),
                fromMax: true,
                children: const {
                  1: Text('Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Sora',
                          color: Color(0XFF004751))),
                  2: Text('Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Sora',
                          color: Color(0XFF004751))),
                },
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.transparent,
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 3.0)),
                  ],
                ),
                fixedWidth: 100,
                onValueChanged: (int value) {
                  if (value == 1) {
                    Get.to(const Login());
                  } else if (value == 2) {
                    Get.to(const Selectcountry());
                  }
                },
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: Responsive.isMobile(context)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            topBanner(),
            buildTitle(),

          ],
        ),
      ),
      bottomNavigationBar: buildButton(),
    );
  }

  Widget topBanner() {
    return Container(
        color: Styles.colorBackgroundBlock,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
        child: Stack(clipBehavior: Clip.none, children: <Widget>[
          Responsive.isDesktop(context)
              ? Image.asset(
                  "assets/webbanner.png",
                  fit: BoxFit.fill,
                  width: Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.width / 1
                      : MediaQuery.of(context).size.width / 1,
                  height: Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.width / 1.5
                      : MediaQuery.of(context).size.width / 4.6,
                )
              : Image.asset(
                  "assets/banner.png",
                  fit: BoxFit.fill,
                  width: Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.width / 1
                      : MediaQuery.of(context).size.width / 1,
                  height: Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.width / 1.5
                      : MediaQuery.of(context).size.width / 4.6,
                ),
          Positioned(
            bottom: -60,
            right: 10,
            width: 120,
            height: 120,
            child: IconButton(
              icon: Image.asset(
                  height: 200, width: 200, "assets/banner-icon.png"),
              tooltip: 'start',
              onPressed: () {},
            ),
          )
        ]));
  }

  Widget buildTitle() {
    return Container(
        color: Styles.colorBackgroundBlock,
        padding: const EdgeInsets.all(15),
        child: Column(
            crossAxisAlignment: Responsive.isMobile(context)
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            mainAxisAlignment: Responsive.isMobile(context)
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: Responsive.isMobile(context)
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  Text("Simplify Payments",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Styles.whitecolortext,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  RichText(
                    text: TextSpan(
                      text: Responsive.isDesktop(context) &&
                              Responsive.isTablet(context)
                          ? ' with '
                          : "",
                      style: TextStyle(
                          color: Styles.whitecolortext,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: Responsive.isDesktop(context) &&
                                    Responsive.isTablet(context)
                                ? 'Cardit'
                                : "",
                            style: TextStyle(
                                fontSize: 18, color: Color(0XFFCEE812))),
                        TextSpan(
                            text: Responsive.isDesktop(context) &&
                                    Responsive.isTablet(context)
                                ? ' it '
                                : ""),
                        TextSpan(
                            text: Responsive.isDesktop(context) &&
                                    Responsive.isTablet(context)
                                ? 'Now'
                                : "",
                            style: TextStyle(
                                fontSize: 18, color: Color(0XFFCEE812))),
                      ],
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  text: Responsive.isMobile(context) ? 'with ' : "",
                  style: TextStyle(
                      color: Styles.whitecolortext,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: Responsive.isMobile(context) ? 'Cardit' : "",
                        style:
                            TextStyle(fontSize: 18, color: Color(0XFFCEE812))),
                    TextSpan(text: Responsive.isMobile(context) ? ' it ' : ""),
                    TextSpan(
                        text: Responsive.isMobile(context) ? 'Now' : "",
                        style:
                            TextStyle(fontSize: 18, color: Color(0XFFCEE812))),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  text: ' ',
                  style: TextStyle(
                      color: Styles.whitecolortext,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'With Carditnow you can pay ',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Sora',
                            color: Colors.grey)),
                    TextSpan(
                        text: 'Anyone, Anywhere, \n Anytime.',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(4, 19, 22, 0.75))),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),

              Text("Why CarditNow?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Styles.whitecolortext,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
        SizedBox(
          height: 10,
        ),

              Text("Why Choose Us.",
                  textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 15,
    fontFamily: 'Sora',

    color: Color.fromRGBO(4, 19, 22, 0.75))),

              SizedBox(
                height: 20,
              ),

       Container(

         // height: 360 ,
         // width: MediaQuery.of(context).size.width / 1,

         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           border: Border.all(
             width: 1,color: Colors.grey,)
               
         ),
         child: Container(
           margin: EdgeInsets.all(25),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 children: [
                   Container(
                     // margin: EdgeInsets.all(25),
                     height: 100,
                     width: 100,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                        color: Color(0XFFCEE812),

                     ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/paymentmethod.png")
                        ],
                      ),
                   )
                 ],
               ),
               SizedBox(
                 height: 20,
               ),
               Row(
                 children: [
                   Text("Make And Recieve",
                       style: TextStyle(
                           color: Color(0XFF004751),
                           fontSize: 22,
                           fontWeight: FontWeight.bold)),
                 ],
               ),
               SizedBox(
                 height: 5,
               ),
               Row(
                 children: [
                   Text("Payment Digitally",
                       style: TextStyle(
                           color: Color(0XFF004751),
                           fontSize: 22,
                           fontWeight: FontWeight.bold)),
                 ],
               ),
               SizedBox(
                 height: 10,
               ),
               Text("Live life to the fullest! You can pay for your living expenses using your credit card and bank account. you can also receive payment digitally at no costs or integration and eliminate cash collections",
                   textAlign: TextAlign.justify,
                   style: TextStyle(
                       fontSize: 15,
                       fontFamily: 'Sora',
                       fontWeight: FontWeight.bold,

                       color: Color.fromRGBO(4, 19, 22, 0.75))),



             ],
           ),
         ),
       ),
              SizedBox(
                height: 20,
              ),

              Container(

                // height: 350 ,
                // width: MediaQuery.of(context).size.width / 1,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,color: Colors.grey,)

                ),
                child: Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            // margin: EdgeInsets.all(25),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0XFFCEE812),

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/sheild.png")
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text("Track and Manage",
                              style: TextStyle(
                                  color: Color(0XFF004751),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text("Expenses",
                              style: TextStyle(
                                  color: Color(0XFF004751),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Enjoy the digital experienc managing your expenses with interactive dashboards in real time. You can now avoid the missing important payments with a help of Carditnow Scheduler ",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,

                              color: Color.fromRGBO(4, 19, 22, 0.75))),



                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,color: Colors.grey,)

                ),
                child: Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            // margin: EdgeInsets.all(25),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0XFFCEE812),

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/mobshopping.png")
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text("Easy Payment Plan",
                              style: TextStyle(
                                  color: Color(0XFF004751),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Text("Simplify your living expenses with flexible payments. Fast and easy online approvals.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,

                              color: Color.fromRGBO(4, 19, 22, 0.75))),



                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("What can i pay for using Carditnow?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Styles.whitecolortext,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),

                    Text("with Carditnow, you can pay",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold,

                            color: Color.fromRGBO(4, 19, 22, 0.75))),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Image.asset("assets/rent.png"),
                            Text("Rent",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFF004751)

                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Image.asset("assets/invoices.png"),
                                Text("Invoices",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF004751)

                                ),)
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset("assets/build.png"),
                                    Text("Condo Fees",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFF004751)

                                    ),)
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset("assets/mail.png"),
                                    Text("Taxes",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFF004751)

                                    ),)
                                  ],
                                )
                              ],
                            ),

                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Container(

                        height: 40,
                        width: 240,

                        decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(30)

                        ),
                        child: Center(
                          child: Text("And Many More...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 20,
                                color: Color(0XFF004751)

                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),




            ]));
  }

  Widget buildButton() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SwipeButton(
          width: Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width / 1
              : Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width / 4.4
                  : MediaQuery.of(context).size.width / 2.5,
          activeThumbColor: const Color(0XFFCEE812),
          thumbPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          borderRadius: BorderRadius.circular(3),
          activeTrackColor: const Color(0XFF004751),
          height: 60,
          child: const Text("Get Started",
              style: TextStyle(
                  fontFamily: "assets/fonts/Sora.ttf",
                  fontSize: 16,
                  color: Color(0XFFCEE812))),
          onSwipe: () {
            Get.to(const Selectcountry());
          }),
    );
  }

  Widget _buildCart() {
    return Container(
        color: const Color(0XFFF7F7F7),
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Image.asset("assets/visa.png", width: 50),
          const SizedBox(width: 10),
          Image.asset(width: 50, 'assets/americon.png'),
          const SizedBox(width: 10),
          SvgPicture.asset('assets/master.svg', width: 40)
        ]));
  }
}
