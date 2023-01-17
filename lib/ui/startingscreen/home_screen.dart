// ignore_for_file: unnecessary_import, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:ui';

import 'package:cardit/auth/auth.dart';
import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/ui/login/login_screen.dart';
import 'package:cardit/ui/register/register_screen.dart';
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
    itemPositionsListener =
  ItemPositionsListener.create();


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
              child: drawer(controller:itemScrollController!,)),
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
                child: topbanner()):
            index == 1
                ? Container(
                margin: EdgeInsets.all(15),
                child: homescroll())
                : index == 2
                ?  Container(
                margin: EdgeInsets.all(15),
                child: howitsworks())
                : index == 3
                ?  Container(
                margin: EdgeInsets.all(15),
                child: pricing())
                : index == 4
                ?Container(
                margin: EdgeInsets.all(15),
                child: easysplit())
                : index == 5?
            buildcontainer():
            index == 6?
            buildsystemimage():
            index == 7?
            buildabout():
            index == 8?
            buildgetstarted():buildgetstarted();



          }),
      bottomNavigationBar: buildButton(),
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
                      style:
                      TextStyle(fontSize: 18, color: Color(0XFFCEE812))),
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
                      style:
                      TextStyle(fontSize: 18, color: Color(0XFFCEE812))),
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
                        width: 30,
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
          height: 20,
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

class topbanner extends StatelessWidget {
  const topbanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
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
}


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

class buildsystemimage extends StatelessWidget {
  const buildsystemimage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/system.png');
  }
}

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


