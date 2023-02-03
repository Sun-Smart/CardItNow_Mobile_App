// ignore_for_file: unnecessary_import, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:ui';

import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/ui/login/login_screen.dart';

import 'package:cardit/ui/splash_screen/splash2.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../themes/styles.dart';
import '../../themes/theme_notifier.dart';
import '../register/drawer/drawerscreen.dart';
import '../register/profile_information_screen.dart';
import '../register/terms&condition.dart';
import '../register/verify_email_screen.dart';

// ItemScrollController itemScrollController = ItemScrollController();
// ItemPositionsListener itemPositionsListener =
// ItemPositionsListener.create();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ItemScrollController? itemScrollController;
  ItemPositionsListener? itemPositionsListener;
  @override
  void initState() {
    itemScrollController = ItemScrollController();
    itemPositionsListener = ItemPositionsListener.create();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      drawer: Column(
        children: [
          Container(
              height: 500,
              width: MediaQuery.of(context).size.width / 1,
              child: drawer(
                controller: itemScrollController!,
              )),
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
            leading: Builder(
              builder: (context) => GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: SvgPicture.asset('assets/sortingleft.svg', width: 16)),
            ),
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
                    Get.to(const splash2());
                  }
                },
              )
            ],
          ),
        ),
      ),
      body: ScrollablePositionedList.builder(
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          itemCount: 9,
          initialScrollIndex: 0,
          itemBuilder: (context, index) {
            return index == 0
                ? Container(
                    // margin: EdgeInsets.all(15),
                    child: Responsive.isMobile(context)
                        ? topbanner()
                        : Responsive.isDesktop(context)
                            ? topbannerweb()
                            : topbanner())
                : index == 1
                    ? Container(
                        margin: EdgeInsets.all(15),
                        child: Responsive.isMobile(context)
                            ? homescroll()
                            : Responsive.isDesktop(context)
                                ? homescrollweb()
                                : homescroll())
                    : index == 2
                        ? Container(
                            margin: EdgeInsets.all(15),
                            child: Responsive.isMobile(context)
                                ? howitsworks()
                                : Responsive.isDesktop(context)
                                    ? howitworksweb()
                                    : howitsworks())
                        : index == 3
                            ? Container(
                                margin: EdgeInsets.all(15),
                                child: Responsive.isMobile(context)
                                    ? pricing()
                                    : Responsive.isDesktop(context)
                                        ? pricingweb()
                                        : pricing())
                            : index == 4
                                ? Container(
                                    margin: EdgeInsets.all(15),
                                    child: Responsive.isMobile(context)
                                        ? easysplit()
                                        : Responsive.isDesktop(context)
                                            ? easysplitweb()
                                            : easysplit())
                                : index == 5
                                    ? Container(
                                        child: Responsive.isMobile(context)
                                            ? buildcontainer()
                                            : Responsive.isDesktop(context)
                                                ? buildcontainerweb()
                                                : buildcontainer())
                                    : index == 6
                                        ? Container(
                                            child: Responsive.isMobile(context)
                                                ? buildsystemimage()
                                                : Responsive.isDesktop(context)
                                                    ? null
                                                    : buildsystemimage())
                                        : index == 7
                                            ? Container(
                                                child:
                                                    Responsive.isMobile(context)
                                                        ? buildabout()
                                                        : Responsive.isDesktop(
                                                                context)
                                                            ? buildaboutweb()
                                                            : buildabout())
                                            : index == 8
                                                ? Container(
                                                    child: Responsive.isMobile(
                                                            context)
                                                        ? buildgetstarted()
                                                        : Responsive.isDesktop(
                                                                context)
                                                            ? buildgetstartedweb()
                                                            : buildgetstarted())
                                                : Container(
                                                    child: Responsive.isMobile(
                                                            context)
                                                        ? buildgetstarted()
                                                        : Responsive.isDesktop(
                                                                context)
                                                            ? buildgetstartedweb()
                                                            : buildgetstarted());
          }),
      bottomNavigationBar: Responsive.isMobile(context) ? buildButton() : null,
    );
  }

  // Widget topBanner() {
  //   return
  // }

  // Widget buildTitle() {
  //   return Container(
  //     color: Styles.colorBackgroundBlock,
  //     padding: const EdgeInsets.all(15),
  //     child: Column(
  //       crossAxisAlignment: Responsive.isMobile(context)
  //           ? CrossAxisAlignment.start
  //           : CrossAxisAlignment.center,
  //       mainAxisAlignment: Responsive.isMobile(context)
  //           ? MainAxisAlignment.start
  //           : MainAxisAlignment.center,
  //       children: [
  //
  //        // homescroll(),
  //        //  howitsworks(),
  //        //  pricing(),
  //        //  SizedBox(height: 40),
  //        //  easysplit(),
  //
  //
  //       ],
  //     ),
  //   );
  // }

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
            Get.to(const splash2());
          }),
    );
  }

  //
  // Widget buildSystemImage() {
  //   return Image.asset('assets/system.png');
  // }

  // Widget buildAbout() {
  //   return
  // }

  // Widget buildLetGetStarted() {
  //   return
  // }

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

//for mobile
class homescroll extends StatelessWidget {
  const homescroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: TextStyle(fontSize: 18, color: Color(0XFFCEE812))),
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
                      style: TextStyle(fontSize: 18, color: Color(0XFFCEE812))),
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
                  style: TextStyle(fontSize: 18, color: Color(0XFFCEE812))),
              TextSpan(text: Responsive.isMobile(context) ? ' it ' : ""),
              TextSpan(
                  text: Responsive.isMobile(context) ? 'Now' : "",
                  style: TextStyle(fontSize: 18, color: Color(0XFFCEE812))),
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
                      fontSize: 14, fontFamily: 'Sora', color: Colors.grey)),
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
                width: 1,
                color: Colors.grey,
              )),
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
                        children: [Image.asset("assets/paymentmethod.png")],
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
                Text(
                    "Live life to the fullest! You can pay for your living expenses using your credit card and bank account. you can also receive payment digitally at no costs or integration and eliminate cash collections",
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
                width: 1,
                color: Colors.grey,
              )),
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
                        children: [Image.asset("assets/sheild.png")],
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
                Text(
                    "Enjoy the digital experienc managing your expenses with interactive dashboards in real time. You can now avoid the missing important payments with a help of Carditnow Scheduler ",
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
                width: 1,
                color: Colors.grey,
              )),
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
                        children: [Image.asset("assets/mobshopping.png")],
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
                Text(
                    "Simplify your living expenses with flexible payments. Fast and easy online approvals.",
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
          padding: EdgeInsets.all(15),
          // color: Color(0XD9D8D8FF),
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
                      Text(
                        "Rent",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF004751)),
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
                          Text(
                            "Invoices",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF004751)),
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
                              Image.asset("assets/build.png"),
                              Text(
                                "Condo Fees",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF004751)),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 29,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset("assets/mail.png"),
                              Text(
                                "Taxes",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF004751)),
                              )
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
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "And Many More...",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0XFF004751)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/face.png",
                    width: 180,
                    height: 180,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
//for web--(what can i pay...)

class homescrollweb extends StatelessWidget {
  const homescrollweb({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Text("Why CarditNow?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Styles.whitecolortext,
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("Why Choose Us.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Color.fromRGBO(4, 19, 22, 0.75))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.width / 3.4,
                width: MediaQuery.of(context).size.width / 3.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 2,
                      color: Colors.grey.withOpacity(0.3),
                    )),
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
                                  color: Color(0XFF004751).withOpacity(0.9),
                                  fontSize: 22,
                                  fontFamily: 'Poppins',
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
                                  color: Color(0XFF004751).withOpacity(0.9),
                                  fontSize: 22,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Live life to the fullest! You can pay for your living expenses using your credit card and bank account. you can also receive payment digitally at no costs or integration and eliminate cash collections",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(4, 19, 22, 0.75))),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.width / 3.4,
                width: MediaQuery.of(context).size.width / 3.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 2,
                      color: Colors.grey.withOpacity(0.3),
                    )),
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
                              children: [Image.asset("assets/sheild.png")],
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
                                  color: Color(0XFF004751).withOpacity(0.9),
                                  fontSize: 22,
                                  fontFamily: 'Poppins',
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
                                  color: Color(0XFF004751).withOpacity(0.9),
                                  fontSize: 22,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Enjoy the digital experienc managing your expenses with interactive dashboards in real time. You can now avoid the missing important payments with a help of Carditnow Scheduler ",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(4, 19, 22, 0.75))),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.width / 3.4,
                width: MediaQuery.of(context).size.width / 3.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2,
                      color: Colors.grey.withOpacity(0.2),
                    )),
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
                              children: [Image.asset("assets/mobshopping.png")],
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
                                  color: Color(0XFF004751).withOpacity(0.9),
                                  fontSize: 22,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Simplify your living expenses with flexible payments. Fast and easy online approvals.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(4, 19, 22, 0.75))),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 15),
                        child: Text("What can i pay for using Carditnow?",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Styles.whitecolortext,
                                fontSize: 28,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text("with Carditnow, you can pay",
                                //textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(4, 19, 22, 0.75))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/face.png",
                            width: 270,
                            height: 270,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/rent.png",
                                  cacheWidth: 75,
                                  cacheHeight: 75,
                                ),
                                Text(
                                  "Rent",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF004751)),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/mail.png",
                                  cacheWidth: 75,
                                  cacheHeight: 75,
                                ),
                                Text(
                                  "Taxes",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF004751)),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/build.png",
                                  cacheWidth: 75,
                                  cacheHeight: 75,
                                ),
                                Text(
                                  "Condo Fees",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF004751)),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/invoices.png",
                                  cacheWidth: 75,
                                  cacheHeight: 75,
                                ),
                                Text(
                                  "Invoices",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF004751)),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Center(
                              child: Container(
                                height: 40,
                                width: 220,
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "And Many More...",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        fontFamily: 'Poppins',
                                        color: Color(0XFF004751)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// for mobile
class howitsworks extends StatelessWidget {
  const howitsworks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("How it Works?",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Styles.whitecolortext,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 20,
        ),
        Text("Learn more about the process",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'Sora',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(4, 19, 22, 0.75))),
        SizedBox(
          height: 30,
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/reg.png",
                    width: 180,
                    height: 180,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    // margin: EdgeInsets.all(25),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFCEE812),
                    ),
                    child: Center(child: Text("1")),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Onboard Yourself As A ",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text("Payee On a Payer ",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Text(
                    "Dont Worry we will ask you few questions and that all ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/reg2.png",
                    width: 180,
                    height: 180,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    // margin: EdgeInsets.all(25),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFCEE812),
                    ),
                    child: Center(child: Text("2")),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Select the Way You Like ",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text("To Pay or Receive",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Text(
                    "You can choose from various options such as credit card Bank, Transfer and Easy Payment Plan.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/reg3.png",
                    width: 180,
                    height: 180,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    // margin: EdgeInsets.all(25),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFCEE812),
                    ),
                    child: Center(child: Text("3")),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Alright ! You Are Now Ready to ",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text("Pay Or Recieve  ",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Text(
                    "Pay to anyone via various payment options such as credit card, Bank Transfer and Easy Payment Plan",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//for web----(how its works)
class howitworksweb extends StatelessWidget {
  const howitworksweb({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Row(
            children: [
              Text("How it Works?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Styles.whitecolortext,
                      fontSize: 28,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text("Learn more about the process",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(4, 19, 22, 0.75))),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/reg.png",
                          width: 250,
                          height: 300,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              // margin: EdgeInsets.all(25),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0XFFCEE812),
                              ),
                              child: Center(child: Text("1")),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Onboard Yourself As A ",
                                    style: TextStyle(
                                        color: Color(0XFF004751).withOpacity(0.9),
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold)),
                                Text("Payee On a Payer ",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 71, 81, 1),
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold)),
                               
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                     Padding(
                       padding: const EdgeInsets.only(left:30),
                       child: Text(
                                  "Dont Worry we will ask you \n few questions  and that all ",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                     ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/reg2.png",
                          width: 250,
                          height: 300,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                             Container(
                          // margin: EdgeInsets.all(25),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0XFFCEE812),
                          ),
                          child: Center(child: Text("2")),
                        ),
                        SizedBox(width:10)   ,                
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Select the Way You Like ",
                                style: TextStyle(
                                    color: Color(0XFF004751),
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold)),
                            Text("To Pay or Receive",
                                style: TextStyle(
                                    color: Color(0XFF004751),
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold)),
                          
                          ],
                        ),
                        
                      
                          ],

                        )
                        
                       ,Padding(
                         padding: const EdgeInsets.only(left:30),
                         child: Text(
                                  "You can choose from various \n options such as credit card ,\n credit BNPL etc.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                       )  
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/reg3.png",
                          width: 250,
                          height: 300,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                              Container(
                          // margin: EdgeInsets.all(25),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0XFFCEE812),
                          ),
                          child: Center(child: Text("3")),
                        ),
                     SizedBox(width: 10,),
                                Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Alright ! You Are Now Ready to ",
                                style: TextStyle(
                                    color: Color(0XFF004751),
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold)),
                            Text("Pay Or Recieve  ",
                                style: TextStyle(
                                    color: Color(0XFF004751),
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold)),
                           
                          ],
                        ),
                    
                          ],
                        ),
                         Padding(
                           padding: const EdgeInsets.only(left:30),
                           child: Text(
                                  "Pay to anyone via various payment\n options such as credit card, \nBank Transfer and Easy Payment Plan",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500)),
                         ),
                        
                      
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// for mobile
class pricing extends StatelessWidget {
  const pricing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Pricing",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Styles.whitecolortext,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text("There are no Hidden Costs",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Why does Carditnow Charge service ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Styles.whitecolortext,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text("fee?",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Styles.whitecolortext,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(left: 0),
          child: Text(
              "Convenience Fee covers the processing costs to credit card Issuer, Lenders, network providers for each transaction made. The fee also ensures our platform remains secure for your everyday use.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/paymentdetails.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'No Onboarding fees no , ',
              style: TextStyle(
                  color: Color(0XffCEE812),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Subscription fee and no',
              style: TextStyle(
                  color: Color(0XffCEE812),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'hidden cost',
              style: TextStyle(
                  color: Color(0XffCEE812),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Get as low as 1.8% convenience ',
              style: TextStyle(
                  color: Color(0Xff99B5B9),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'fee for all Government Payments ',
              style: TextStyle(
                  color: Color(0Xff99B5B9),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'And 3.2% for Rent',
              style: TextStyle(
                  color: Color(0Xff99B5B9),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Carditnow charges a low convenience',
              style: TextStyle(
                color: Color(0XffCEE812),
                fontSize: 13,
              ),
            ),
            Text(
              'fee for every transaction.',
              style: TextStyle(
                color: Color(0XffCEE812),
                fontSize: 13,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
      ],
    );
  }
}

//for web-----(pricing)
class pricingweb extends StatelessWidget {
  const pricingweb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 1.8,
            decoration: BoxDecoration(
                border: Border.all(
              width: 3,
              color: Colors.grey.withOpacity(0.2),
            )),
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15,top:15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Pricing",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Styles.whitecolortext,
                                fontSize: 28,
                                
                                fontFamily:'Poppins',
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("There are no Hidden Costs",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                 fontFamily:'Poppins',
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(height:20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Why does Carditnow Charge service ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Styles.whitecolortext,
                                    fontSize: 20,
                                     fontFamily:'Poppins',
                                    fontWeight: FontWeight.w700)),
                            Text("fee?",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Styles.whitecolortext,
                                    fontSize: 20,
                                     fontFamily:'Poppins',
                                    fontWeight: FontWeight.w700)),
                            SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 0),
                      child: Text(
                          "Convenience Fee covers the processing costs to credit card Issuer,\n Lenders, network providers for each transaction made.\n The fee also ensures our platform remains\n secure for your everyday use.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                               fontFamily:'Poppins',
                              fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 2.3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/paymentdetails.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'No Onboarding fees no , ',
                          style: TextStyle(
                              color: Color(0XffCEE812),
                              fontSize: 17,
                               fontFamily:'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Subscription fee and no',
                          style: TextStyle(
                              color: Color(0XffCEE812),
                              fontSize: 17,
                               fontFamily:'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'hidden cost',
                          style: TextStyle(
                              color: Color(0XffCEE812),
                              fontSize: 17,
                               fontFamily:'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Get as low as 1.8% convenience ',
                          style: TextStyle(
                              color: Color(0Xff99B5B9),
                              fontSize: 14,
                               fontFamily:'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'fee for all Government Payments ',
                          style: TextStyle(
                              color: Color(0Xff99B5B9),
                              fontSize: 14,
                               fontFamily:'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'And 3.2% for Rent',
                          style: TextStyle(
                              color: Color(0Xff99B5B9),
                              fontSize: 14,
                               fontFamily:'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Carditnow charges a low convenience',
                          style: TextStyle(
                            color: Color(0XffCEE812),
                            fontSize: 13,
                             fontFamily:'Poppins',
                          ),
                        ),
                        Text(
                          'fee for every transaction.',
                          style: TextStyle(
                            color: Color(0XffCEE812),
                            fontSize: 13,
                             fontFamily:'Poppins',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
              ),
            ]),
          ),
        )
      ],
    );
  }
}

//for mobile
class easysplit extends StatelessWidget {
  const easysplit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(15),
          // color: Color(0XD9D8D8FF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Easy Payment Plan -",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Styles.whitecolortext,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              Text("Split Payments",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Styles.whitecolortext,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Simplify your living expenses with flexible payments. Fast and easy online approvals.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(4, 19, 22, 0.75))),
              SizedBox(
                height: 30,
              ),
              Text("Carditnow Partners coming soon.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 15,

                      // fontFamily: 'Sora',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(4, 19, 22, 0.75))),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Image.asset("assets/homee.png"),
                      Text(
                        "Schools",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF004751)),
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
                          Image.asset("assets/banks.png"),
                          Text(
                            "LGU",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF004751)),
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
                              Image.asset("assets/serve.png"),
                              Text(
                                "Medical",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF004751)),
                              )
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
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => Login());
          },
          child: Container(
            height: 60,
            // margin: EdgeInsets.all(25),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0XFFCEE812),
            ),
            child: Center(
                child: Text(
              "Get Started",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/phones1.png",
                    width: 180,
                    height: 180,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    // margin: EdgeInsets.all(25),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFCEE812),
                    ),
                    child: Center(child: Text("1")),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Choose Payee or Onboard new ",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text("Payee ",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Text(
                    "Onboard payee by adding his/her bank details and wait for a few minutes till we verify your Payee",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/phone2.png",
                    width: 180,
                    height: 180,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    // margin: EdgeInsets.all(25),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFCEE812),
                    ),
                    child: Center(child: Text("2")),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Verify Your Bank ",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text("Details ",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Text(
                    "Verify your bank details and upload 3-month pay slips for loan verification.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/phone3.png",
                    width: 180,
                    height: 180,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    // margin: EdgeInsets.all(25),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFCEE812),
                    ),
                    child: Center(child: Text("3")),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Choose From The",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text("Lenders ",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Text(
                    "Carditnow will show you the list of lenders from whom you can choose to go ahead with.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/phone4.png",
                    width: 180,
                    height: 180,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    // margin: EdgeInsets.all(25),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFCEE812),
                    ),
                    child: Center(child: Text("4")),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pay to your Payees",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text("Anytime ",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Text(
                    "Overview of your payment details and Swipe to Pay. Congratulations! You have completed the payment.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/phone5.png",
                    width: 180,
                    height: 180,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    // margin: EdgeInsets.all(25),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFCEE812),
                    ),
                    child: Center(child: Text("5")),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Congratulations ! you have ",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text("completed a  payment ",
                          style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Text(
                      "Congratulations! You have completed the payment.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
//for web(easysplit-----)

class easysplitweb extends StatelessWidget {
  const easysplitweb({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Buy Now,Pay Later -",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Styles.whitecolortext,
                              fontSize: 28,
                               fontFamily:'Poppins',
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Split Payments",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Styles.whitecolortext,
                              fontSize: 28,
                               fontFamily:'Poppins',
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                          "Simplify your living expenses with flexible payments.\n Fast and easy online approvals.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                             
                               fontFamily:'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(4, 19, 22, 0.75))),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Column(
                  children: [
                    Text("Carditnow Partners coming soon.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20,
                             fontFamily:'Poppins',
        
                            // fontFamily: 'Sora',
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(4, 19, 22, 0.75))),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Image.asset("assets/homee.png"),
                            Text(
                              "Schools",
                              style: TextStyle(
                                 fontFamily:'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFF004751)),
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
                                Image.asset("assets/banks.png"),
                                Text(
                                  "LGU",
                                  style: TextStyle(
                                     fontFamily:'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF004751)),
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
                                    Image.asset("assets/serve.png"),
                                    Text(
                                      "Medical",
                                      style: TextStyle(
                                         fontFamily:'Poppins',
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFF004751)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => Login());
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        // margin: EdgeInsets.all(25),
        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0XFFCEE812),
                        ),
                        child: Center(
                            child: Text(
                          "Get Started",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 500,
                decoration: BoxDecoration(
                    //  color: Colors.black,
                    image: DecorationImage(
                  image: AssetImage(
                    "assets/phones1.png",
                  ),
                  fit: BoxFit.fill,
                )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        // margin: EdgeInsets.all(25),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0XFFCEE812),
                        ),
                        child: Center(child: Text("1")),
                      ),
                      SizedBox(width: 20),
                      Text("Choose Carditnow Payee or\n  Onboard new  Payee",
                          style: TextStyle(
                              color: Color(0XFF004751).withOpacity(0.9),
                              fontSize: 23,
                               fontFamily:'Poppins',
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 40, top: 10),
                        child: Text(
                            "Onboard payee by adding his/her bank details\n and wait for an few minutes till we\n verify your Payee",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                 fontFamily:'Poppins',
                                fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            // margin: EdgeInsets.all(25),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0XFFCEE812),
                            ),
                            child: Center(child: Text("2")),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Verify Your Bank Details ",
                              style: TextStyle(
                                  color: Color(0XFF004751).withOpacity(0.9),
                                  fontSize: 23,
                                     fontFamily:'Poppins',
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 50),
                            child: Text(
                                "Verify your bank details and upload\n 3-month pay slips for loan verification.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                       fontFamily:'Poppins',
                                    fontWeight: FontWeight.w300)),
                          ),
                        ],
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 500,
                  decoration: BoxDecoration(
                      //   color: Colors.black,
                      image: DecorationImage(
                    image: AssetImage(
                      "assets/phone2.png",
                    ),
                    fit: BoxFit.fill,
                  )),
                  // child: Image.asset(
                  //   "assets/phones1.png",
        
                  //   fit: BoxFit.fill,
        
                  // ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 500,
                decoration: BoxDecoration(
                    //  color: Colors.black,
                    image: DecorationImage(
                  image: AssetImage(
                    "assets/phone3.png",
                  ),
                  fit: BoxFit.fill,
                )),
                // child: Image.asset(
                //   "assets/phones1.png",
        
                //   fit: BoxFit.fill,
        
                // ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        // margin: EdgeInsets.all(25),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0XFFCEE812),
                        ),
                        child: Center(child: Text("3")),
                      ),
                      SizedBox(width: 20),
                      Text("Choose From The Lenders",
                          style: TextStyle(
                              color: Color(0XFF004751).withOpacity(0.9),
                              fontSize: 23,
                                fontFamily:'Poppins',
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 40, top: 10),
                        child: Text(
                            "Carditnow will show you the list of \n lenders from whom you can choose to go ahead with.",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                  fontFamily:'Poppins',
                                fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            // margin: EdgeInsets.all(25),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0XFFCEE812),
                            ),
                            child: Center(child: Text("4")),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Pay To Your Seller Anytime ",
                              style: TextStyle(
                                  color: Color(0XFF004751).withOpacity(0.9),
                                  fontSize: 23,
                                    fontFamily:'Poppins',
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 50),
                            child: Text(
                                "Overview of your payment details and Swipe to Pay.\n Congratulations! You have completed the payment.",
                                style: TextStyle(
                                    color: Colors.black,
                                      fontFamily:'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300)),
                          ),
                        ],
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 500,
                  decoration: BoxDecoration(
                      //   color: Colors.black,
                      image: DecorationImage(
                    image: AssetImage(
                      "assets/phone4.png",
                    ),
                    fit: BoxFit.fill,
                  )),
                  // child: Image.asset(
                  //   "assets/phones1.png",
        
                  //   fit: BoxFit.fill,
        
                  // ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 500,
                decoration: BoxDecoration(
                    //  color: Colors.black,
                    image: DecorationImage(
                  image: AssetImage(
                    "assets/phone5.png",
                  ),
                  fit: BoxFit.fill,
                )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        // margin: EdgeInsets.all(25),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0XFFCEE812),
                        ),
                        child: Center(child: Text("5")),
                      ),
                      SizedBox(width: 20),
                      Text("Congratulations ! you have\n Completed A Payment",
                          style: TextStyle(
                              color: Color(0XFF004751).withOpacity(0.9),
                              fontSize: 23,
                                fontFamily:'Poppins',
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 40, top: 10),
                        child: Text(
                            "Onboard payee by adding his/her bank details\n and wait for an few minutes till we\n verify your Payee",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                  fontFamily:'Poppins',
                                fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class topbanner extends StatelessWidget {
  const topbanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Styles.colorBackgroundBlock,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
        child: Responsive.isMobile(context)
            ? Stack(clipBehavior: Clip.none, children: <Widget>[
                Image.asset(
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
              ])
            : Stack(clipBehavior: Clip.none, children: <Widget>[
                Image.asset(
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
}

//for web(top banner.....)
class topbannerweb extends StatelessWidget {
  const topbannerweb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        "assets/homescreen_curve.png",
                        height: 250,
                        width: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        //width: MediaQuery.of(context).size.width / 3,
                        //color: Colors.black38,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 60, left: 40),
                          child: Column(
                            children: [
                              Text("Simplify Payments",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Styles.whitecolortext,
                                      fontSize: 40,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "with",
                                    style: TextStyle(
                                        color: Styles.whitecolortext,
                                        fontSize: 35,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold
                                        // fontWeight: FontWeight.w400
                                        ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Cardit",
                                    style: TextStyle(
                                        color: Color(0XFFCEE812),
                                        fontSize: 35,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold
                                        // fontWeight: FontWeight.w400
                                        ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "it",
                                    style: TextStyle(
                                        color: Styles.whitecolortext,
                                        fontSize: 35,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold
                                        // fontWeight: FontWeight.w400
                                        ),
                                  )
                                  // RichText(
                                  //   text: TextSpan(
                                  //     text: 'with',
                                  //     style: TextStyle(
                                  //         color: Styles.whitecolortext,
                                  //         fontSize: 35,
                                  //         fontFamily: 'Poppins',
                                  //         fontWeight: FontWeight.bold
                                  //         // fontWeight: FontWeight.w400
                                  //         ),
                                  // children: <TextSpan>[
                                  // TextSpan(
                                  //     text: 'Cardit',
                                  //     style: TextStyle(
                                  //         fontSize: 35,
                                  //         fontWeight: FontWeight.w400,
                                  //         color: Color(0XFFCEE812))),
                                  // TextSpan(
                                  //   text: ' it ',
                                  //   style: TextStyle(
                                  //       fontSize: 35,
                                  //       color: Styles.whitecolortext,
                                  //       fontWeight: FontWeight.w400),
                                  // ),
                                  // TextSpan(
                                  //   text: 'Now',
                                  //   style: TextStyle(
                                  //   fontSize: 35,
                                  //   fontWeight: FontWeight.w400,
                                  //   color: Color(0XFFCEE812))),
                                  //],
                                  // ),
                                  // ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 190),
                                // color: Colors.amber,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("now",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0XFFCEE812)))
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
                                            fontSize: 20,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(
                                                4, 19, 22, 0.75))),
                                    TextSpan(
                                        text: 'Anyone,\n Anywhere,  Anytime.',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 50),
                              SwipeButton(
                                  width:
                                      MediaQuery.of(context).size.width / 4.4,
                                  activeThumbColor: const Color(0XFFCEE812),
                                  thumbPadding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  borderRadius: BorderRadius.circular(3),
                                  activeTrackColor: const Color(0XFF004751),
                                  height: 50,
                                  child: const Text(" Swipe to Get Started",
                                      style: TextStyle(
                                          fontFamily: "assets/fonts/Sora.ttf",
                                          fontSize: 16,
                                          color: Color(0XFFCEE812))),
                                  onSwipe: () {
                                    Get.to(const splash2());
                                  }),
                            ],
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Container(
                    child: Stack(clipBehavior: Clip.none, children: <Widget>[
                      Image.asset(
                        "assets/homescreen_web.png",
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 3,
                      ),
                      Positioned(
                        top: 70,
                        // bottom: 10,
                        right: 590,

                        width: 120,
                        height: 300,
                        child: IconButton(
                          icon: Image.asset(
                              height: 400,
                              width: 200,
                              "assets/banner-icon.png"),
                          tooltip: 'start',
                          onPressed: () {},
                        ),
                      )
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//for mobile......
class buildcontainer extends StatelessWidget {
  const buildcontainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0XFF004751),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'We Keep your Information and Transactions Safe and Secure',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(height: 20),
                Text('Security is our Core and Number one priority',
                    style: TextStyle(
                        fontSize: 14, fontFamily: 'Sora', color: Colors.white)),
                SizedBox(height: 20),
                Text(
                    'We maintain strict compliance of all guidelines, \nrequirements, directives and conditions issued \nby Bangko Sentral ng Pilipinas as well as Financial \ninstitution partners. All funds will always be held securely \nwith Financial institution partners.',
                    style: TextStyle(
                        fontSize: 12, fontFamily: 'Sora', color: Colors.white)),
                SizedBox(height: 20),
                Text(
                    ' We also take additional measures to evaluate the risk \nacross all our platforms and have constant back up and \nfirewalls in place to keep your data safe at all times.',
                    style: TextStyle(
                        fontSize: 12, fontFamily: 'Sora', color: Colors.white)),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: HexColor('#CEE812')),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(20),
                    onPressed: () {},
                    child: Text('Sign Up to Carditnow',
                        style: TextStyle(
                          color: Color(0XFF004751),
                          fontSize: 16,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Image.asset('assets/mobile.png'),
        ],
      ),
    );
  }
}

//for web(refer your friend......)
class buildcontainerweb extends StatelessWidget {
  const buildcontainerweb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width / 1,
          height: MediaQuery.of(context).size.height / 1.3,
          decoration: BoxDecoration(color: HexColor('#004751')),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'We Keep your Information and Transactions\n Safe and Secure',
                        style: TextStyle(
                            fontSize: 28,
                             fontFamily:'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(height: 20),
                    Text('Security is our Core and Number one priority',
                        style: TextStyle(
                            fontSize: 18,
                           fontFamily:'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Colors.white60)),
                    SizedBox(height: 20),
                    Text(
                        'We maintain strict compliance of all guidelines, requirements,  directives and \nconditions issued by Bangko Sentral ng Pilipinas as well as Financial\n institution partners. All funds will always be held securely with Financial\n institution partners.',
                        style: TextStyle(
                          fontSize: 18,
                           fontFamily:'Poppins',  color: Colors.white,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(height: 20),
                    Text(
                        ' We also take additional measures to evaluate the risk across all our\n platforms and have constant back up and firewalls in place to keep your data\n safe at all times.',
                        style: TextStyle(
                            fontSize: 18,
                             fontFamily:'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.height / 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: HexColor('#CEE812')),
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(20),
                        onPressed: () {},
                        child: Text('Sign Up to Carditnow',
                            style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 16,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Image.asset(
                    'assets/web_info.png',
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class buildsystemimage extends StatelessWidget {
  const buildsystemimage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/system.png');
  }
}

//fpr mobile....
class buildabout extends StatelessWidget {
  const buildabout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0XFFFFFFFF),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About Us',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            SizedBox(height: 20),
            Text('Know More About us',
                style: TextStyle(
                    fontSize: 14, fontFamily: 'Sora', color: Colors.black)),
            SizedBox(height: 20),
            Text(
                'Carditnow is a third party provider registered user SEC 2022070061722-06.  We adhere to the highest standards of security and compliance in the market where we operate, your transactions are processed through regulated financial institutions and via a client safeguarded account.',
                style: TextStyle(
                    fontSize: 12, fontFamily: 'Sora', color: Colors.black)),
            SizedBox(height: 10),
            Text(
                'Our aim is streamlining all your expenses in One App, Enjoy hassle free payments, interest free credit and bigger rewards.',
                style: TextStyle(
                    fontSize: 12, fontFamily: 'Sora', color: Colors.black)),
            SizedBox(height: 50),
            Image.asset('assets/getintouch.png'),
            SizedBox(height: 30),
            Text('Your Name',
                style: TextStyle(fontFamily: 'Sora', fontSize: 16)),
            SizedBox(height: 10),
            TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: 'Enter your name',
                    filled: true,
                    fillColor: Colors.white,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    helperStyle:
                        const TextStyle(fontFamily: 'Sora', fontSize: 14),
                    hintStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.normal),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    focusColor: Colors.grey.shade300,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        gapPadding: 7,
                        borderSide: const BorderSide(color: Colors.grey)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: Colors.grey)),
                    errorStyle: const TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 13,
                        fontWeight: FontWeight.bold))),
            SizedBox(height: 10),
            Text('Email', style: TextStyle(fontFamily: 'Sora', fontSize: 16)),
            SizedBox(height: 10),
            TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: 'Enter email id',
                    filled: true,
                    fillColor: Colors.white,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    helperStyle:
                        const TextStyle(fontFamily: 'Sora', fontSize: 14),
                    hintStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.normal),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    focusColor: Colors.grey.shade300,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        gapPadding: 7,
                        borderSide: const BorderSide(color: Colors.grey)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: Colors.grey)),
                    errorStyle: const TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 13,
                        fontWeight: FontWeight.bold))),
            SizedBox(height: 10),
            Text('What do you want to tell us?',
                style: TextStyle(fontFamily: 'Sora', fontSize: 16)),
            SizedBox(height: 10),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(0, 71, 81, 0.2), width: 2),
                    borderRadius: BorderRadius.circular(5)),
                child: Card(
                    color: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                            maxLines: 8,
                            decoration: InputDecoration.collapsed(
                                hintText: "Write Something"))))),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: HexColor('#CEE812')),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                onPressed: () {},
                child: Text('Ping Us',
                    style: TextStyle(
                      color: Color(0XFF004751),
                      fontSize: 16,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

//for web(about us......)
class buildaboutweb extends StatelessWidget {
  const buildaboutweb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width / 1,
          height: MediaQuery.of(context).size.height / 1.5,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About Us',
                        style: TextStyle(
                            fontSize: 28,
                            fontFamily:'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    SizedBox(height: 20),
                    Text('Know More About us',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily:'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    SizedBox(height: 20),
                    Text(
                        'Carditnow is a third party provider registered user SEC 2022070061722-06.\n  We adhere to the highest standards of security and compliance in the\n market where we operate, your transactions are processed through\n regulated financial institutions and via a client safeguarded account.',
                        style: TextStyle(
                            fontSize: 18,
                             fontFamily:'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    SizedBox(height: 20),
                    Text(
                        'Our aim is streamlining all your expenses in One App,\n Enjoy hassle free payments, interest free credit and bigger rewards.',
                        style: TextStyle(
                            fontSize: 18,
                             fontFamily:'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    SizedBox(height: 50),
                  ],
                ),
              ),
              Container(
                // color: Colors.black,
                child: Image.asset(
                  'assets/aboutusweb.png',
                  width: 450,
                  height: 420,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 1.2,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
            child: (Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                        width: 600,
                        height: 500,
                        child: Image.asset(
                          'assets/getintouch.png',
                          width: 600,
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your Name',
                          style: TextStyle(fontFamily: 'Sora', fontSize: 16)),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        child: TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                labelText: 'Enter your name',
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
                                    borderSide: BorderSide(color: Colors.grey)),
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
                      ),
                      SizedBox(height: 10),
                      Text('Email',
                          style: TextStyle(fontFamily: 'Sora', fontSize: 16)),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        child: TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                labelText: 'Enter email id',
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
                                    borderSide: BorderSide(color: Colors.grey)),
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
                      ),
                      SizedBox(height: 10),
                      Text('What do you want to tell us?',
                          style: TextStyle(fontFamily: 'Sora', fontSize: 16)),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(0, 71, 81, 0.2),
                                  width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: Card(
                              color: Colors.white,
                              child: TextField(
                                  maxLines: 8,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "Write Something")))),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: HexColor('#CEE812')),
                        child: MaterialButton(
                          hoverColor: Colors.transparent,
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(20),
                          onPressed: () {},
                          child: Text('Ping Us',
                              style: TextStyle(
                                color: Color(0XFF004751),
                                fontSize: 16,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            )))
      ],
    );
  }
}

//for mobile....

class buildgetstarted extends StatelessWidget {
  const buildgetstarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/city.png'),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0XFF004751),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Text('Are you ready?',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Sora',
                            color: Colors.white))),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text('Let’s get started',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Sora',
                          color: Colors.white)),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: HexColor('#CEE812')),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(20),
                    onPressed: () {},
                    child: Text('Get Started',
                        style: TextStyle(
                          color: Color(0XFF004751),
                          fontSize: 16,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Home',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text('How it Works?',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12,
                                color: Colors.white)),
                        SizedBox(height: 10),
                        Text('Pricing',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12,
                                color: Colors.white)),
                        SizedBox(height: 10),
                        Text('Split Expenses',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12,
                                color: Colors.white))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Refer a Friend',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12,
                                color: Colors.white)),
                        SizedBox(height: 10),
                        Text('About Us',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12,
                                color: Colors.white)),
                        SizedBox(height: 10),
                        Text('Contact us',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12,
                                color: Colors.white)),
                        SizedBox(height: 20),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30),
                Center(
                  child: Text(
                    'Copyright © 2020. Carditnow. All rights reserved.',
                    style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        )
      ],
    );
  }
}

//for web(country.....)

class buildgetstartedweb extends StatelessWidget {
  const buildgetstartedweb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 1.5,
              color: Color(0XFF004751),
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text('Are you ready?',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w500,
                                color: Colors.white))),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Text('Let’s get started',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: HexColor('#CEE812')),
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(20),
                        onPressed: () {},
                        child: Text('Get Started',
                            style: TextStyle(
                              color: Color(0XFF004751),
                              fontSize: 16,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Home',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text('How it Works?',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        SizedBox(height: 10),
                        Text('Pricing',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        SizedBox(height: 10),
                        Text('Split Expenses',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        Text('Refer a Friend',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        SizedBox(height: 10),
                        Text('About Us',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12,
                                color: Colors.white)),
                        SizedBox(height: 10),
                        Text('Contact us',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        SizedBox(height: 20)
                      ],
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        'Copyright © 2020. Carditnow. All rights reserved.',
                        style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: Image.asset('assets/city.png',
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.fill)),
          ],
        ),
      ],
    );
  }
}
