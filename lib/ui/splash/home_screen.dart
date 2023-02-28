// ignore_for_file: unnecessary_import, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:ui';
import 'package:cardit/const/responsive.dart';
import 'package:cardit/ui/auth/login_screen.dart';
import 'package:cardit/ui/splash/country.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../api/regster_api.dart';
import '../../themes/styles.dart';
import '../../themes/theme_notifier.dart';
import '../register/drawer/drawerscreen.dart';

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

  final RegisterAPI con = Get.put(RegisterAPI());
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      drawer: Responsive.isDesktop(context)
          ? null
          : Column(
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
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 10, 15),
          child: AppBar(
            // bottom:
            iconTheme: IconThemeData(color: Colors.green),
            elevation: 0,
            leading: Builder(
              builder: (context) => GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Responsive.isDesktop(context)
                      ? null
                      : SvgPicture.asset('assets/sortingleft.svg', width: 16)),
            ),
            actions: [
              Responsive.isDesktop(context)
                  ? Row(
                      children: [
                        Image.asset('assets/carditlogo.png',
                            width: 70, height: 70),
                        SizedBox(width: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  con.drawercountry.value = "CM";
                                  setState(() {});
                                },
                                child: Text(
                                  "Philipines",
                                  style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 12,
                                    color: con.drawercountry.value == "CM"
                                        ? Color(0XFF004751)
                                        : Colors.grey,
                                  ),
                                )),
                            VerticalDivider(
                              color: Colors.grey,
                            ),
                            GestureDetector(
                                onTap: () {
                                  con.drawercountry.value = "Ds";
                                  setState(() {});
                                },
                                child: Text(
                                  "UAE",
                                  style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 12,
                                    color: con.drawercountry.value == "Ds"
                                        ? Color(0XFF004751)
                                        : Colors.grey,
                                  ),
                                )),
                          ],
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: MyMenuBar(controller: itemScrollController!))
                      ],
                    )
                  : Container(),
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
                    // readJson();
                    Get.to(Country(choosetype: "Login"));
                  } else if (value == 2) {
                    Get.to(Country(choosetype: "Register"));
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
                            : topbannerweb())
                : index == 1
                    ? Container(
                        margin: EdgeInsets.all(15),
                        child: Responsive.isMobile(context)
                            ? homeScrollWidget()
                            : Responsive.isDesktop(context)
                                ? homeScrollWebWidget()
                                : homeScrollWebWidget())
                    : index == 2
                        ? Container(
                            margin: EdgeInsets.all(15),
                            child: Responsive.isMobile(context)
                                ? howitsworks()
                                : Responsive.isDesktop(context)
                                    ? howitworksweb()
                                    : howitworksweb())
                        : index == 3
                            ? Container(
                                margin: EdgeInsets.all(15),
                                child: Responsive.isMobile(context)
                                    ? pricing()
                                    : Responsive.isDesktop(context)
                                        ? pricingweb()
                                        : pricingweb())
                            : index == 4
                                ? Container(
                                    margin: EdgeInsets.all(15),
                                    child: Responsive.isMobile(context)
                                        ? easysplit()
                                        : Responsive.isDesktop(context)
                                            ? easysplitweb()
                                            : easysplitweb())
                                : index == 5
                                    ? Container(
                                        child: Responsive.isMobile(context)
                                            ? buildcontainer()
                                            : Responsive.isDesktop(context)
                                                ? buildcontainerweb()
                                                : buildcontainerweb())
                                    : index == 6
                                        ? Container(
                                            child: Responsive.isMobile(context)
                                                ? buildsystemimage()
                                                : Responsive.isDesktop(context)
                                                    ? null
                                                    : null)
                                        : index == 7
                                            ? Container(
                                                child:
                                                    Responsive.isMobile(context)
                                                        ? buildabout()
                                                        : Responsive.isDesktop(
                                                                context)
                                                            ? buildaboutweb()
                                                            : buildaboutweb())
                                            : index == 8
                                                ? Container(
                                                    margin: EdgeInsets.all(15),
                                                    child: Responsive.isMobile(
                                                            context)
                                                        ? contactus()
                                                        : Responsive.isDesktop(
                                                                context)
                                                            ?  ContactUsWeb()
                                                            :  ContactUsWeb())
                                                : index == 9
                                                     ? Container(
                                                      child: Responsive.isMobile(
                                                          context)
                                                          ? buildgetstarted()
                                                          : Responsive.isDesktop(
                                                          context)
                                                          ? buildgetstartedweb()
                                                          : buildgetstartedweb()) :
                                                    Container(
                                                    child: Responsive.isMobile(
                                                            context)
                                                        ? buildgetstarted()
                                                        : Responsive.isDesktop(
                                                                context)
                                                            ? buildgetstartedweb()
                                                            : buildgetstartedweb());
          }),
      bottomNavigationBar: Responsive.isMobile(context) ? buildButton() : null,
    );
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
            Get.to(Country());
          }),
    );
  }
}

//for mobile
class homeScrollWidget extends StatelessWidget {
  const homeScrollWidget({Key? key}) : super(key: key);

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
            // Text(mocktermscond[0]),
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

class homeScrollWebWidget extends StatelessWidget {
  const homeScrollWebWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.isDesktop(context)
          ? EdgeInsets.all(15)
          : EdgeInsets.all(5),
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
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 3.3
                    : MediaQuery.of(context).size.width / 3.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 2,
                      color: Colors.grey.withOpacity(0.3),
                    )),
                child: Container(
                  margin: Responsive.isDesktop(context)
                      ? EdgeInsets.all(25)
                      : EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
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
                          Responsive.isDesktop(context)
                              ? Text("Make And Recieve",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0XFF004751).withOpacity(0.9),
                                      fontSize: 22,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold))
                              : Text("Make And \n Recieve Pay",
                                  textAlign: TextAlign.justify,
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
                          Responsive.isDesktop(context)
                              ? Text("Payment Digitally",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0XFF004751).withOpacity(0.9),
                                      fontSize: 22,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold))
                              : Text("ment Digitally",
                                  textAlign: TextAlign.justify,
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
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 3.3
                    : MediaQuery.of(context).size.width / 3.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 2,
                      color: Colors.grey.withOpacity(0.3),
                    )),
                child: Container(
                  margin: Responsive.isDesktop(context)
                      ? EdgeInsets.all(25)
                      : EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
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
                          Responsive.isDesktop(context)
                              ? Text("Track and  Manage",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0XFF004751).withOpacity(0.9),
                                      fontSize: 22,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold))
                              : Text("Track and \n Manage",
                                  textAlign: TextAlign.justify,
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
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 3.3
                    : MediaQuery.of(context).size.width / 3.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2,
                      color: Colors.grey.withOpacity(0.2),
                    )),
                child: Container(
                  margin: Responsive.isDesktop(context)
                      ? EdgeInsets.all(25)
                      : EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
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
                          Responsive.isDesktop(context)
                              ? Text("Easy Payment Plan",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0XFF004751).withOpacity(0.9),
                                      fontSize: 22,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold))
                              : Text("Easy Payment\n Plan",
                                  textAlign: TextAlign.justify,
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
                      Responsive.isDesktop(context)
                          ? Text(
                              "Simplify your living expenses with flexible payments. Fast and easy online approvals.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(4, 19, 22, 0.75)))
                          : Container(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 130),
                              child: Text(
                                  "Simplify your living expenses with flexible payments.Fast and easy online approvals.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(4, 19, 22, 0.75))),
                            ),
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
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20,
                            left: Responsive.isDesktop(context) ? 15 : 10),
                        child: Responsive.isDesktop(context)
                            ? Text("What can i pay for using Carditnow?",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Styles.whitecolortext,
                                    fontSize: 28,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold))
                            : Text("What can i pay for\n using Carditnow?",
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
                    padding: EdgeInsets.only(
                        right: Responsive.isDesktop(context) ? 100 : 20,
                        top: 50),
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
                                  cacheWidth:
                                      Responsive.isDesktop(context) ? 75 : 30,
                                  cacheHeight:
                                      Responsive.isDesktop(context) ? 75 : 30,
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
                              width: Responsive.isDesktop(context) ? 50 : 0,
                            ),
                            Responsive.isDesktop(context)
                                ? Column(
                                    children: [
                                      Image.asset("assets/mail.png",
                                          cacheWidth:
                                              Responsive.isDesktop(context)
                                                  ? 75
                                                  : 30,
                                          cacheHeight:
                                              Responsive.isDesktop(context)
                                                  ? 75
                                                  : 30),
                                      Text(
                                        "Taxes",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFF004751)),
                                      )
                                    ],
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(left: 40),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/mail.png",
                                            cacheWidth:
                                                Responsive.isDesktop(context)
                                                    ? 75
                                                    : 30,
                                            cacheHeight:
                                                Responsive.isDesktop(context)
                                                    ? 75
                                                    : 30),
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
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/build.png",
                                  cacheWidth:
                                      Responsive.isDesktop(context) ? 75 : 30,
                                  cacheHeight:
                                      Responsive.isDesktop(context) ? 75 : 30,
                                ),
                                Responsive.isDesktop(context)
                                    ? Text(
                                        "Condo\n Fees",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFF004751)),
                                      )
                                    : Text(
                                        "Condo \nFees",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFF004751)),
                                      )
                              ],
                            ),
                            SizedBox(
                              width: Responsive.isDesktop(context) ? 50 : 10,
                            ),
                            Responsive.isDesktop(context)
                                ? Column(
                                    children: [
                                      Image.asset(
                                        "assets/invoices.png",
                                        cacheWidth:
                                            Responsive.isDesktop(context)
                                                ? 75
                                                : 30,
                                        cacheHeight:
                                            Responsive.isDesktop(context)
                                                ? 75
                                                : 30,
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
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 10),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/invoices.png",
                                          cacheWidth:
                                              Responsive.isDesktop(context)
                                                  ? 75
                                                  : 30,
                                          cacheHeight:
                                              Responsive.isDesktop(context)
                                                  ? 75
                                                  : 30,
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
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Responsive.isDesktop(context)
                                ? Center(
                                    child: Container(
                                      height: 40,
                                      width: Responsive.isDesktop(context)
                                          ? 220
                                          : 100,
                                      decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius:
                                              BorderRadius.circular(10)),
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
                                  )
                                : Container(
                                    height: 70,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        color: Colors.white30,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "And Many More..",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            fontFamily: 'Poppins',
                                            color: Color(0XFF004751)),
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
                          width: Responsive.isDesktop(context) ? 250 : 100,
                          height: Responsive.isDesktop(context) ? 300 : 100,
                        )
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
                            Responsive.isDesktop(context)
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Onboard Yourself As A  ",
                                          style: TextStyle(
                                              color: Color(0XFF004751)
                                                  .withOpacity(0.9),
                                              fontSize: 18,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold)),
                                      Text("Payee On a Payer ",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 71, 81, 1),
                                              fontSize: 18,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold))
                                    ],
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Onboard Your\nself As A Payee\n On a Payer ",
                                          style: TextStyle(
                                              color: Color(0XFF004751)
                                                  .withOpacity(0.9),
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
                      padding: EdgeInsets.only(
                          left: Responsive.isDesktop(context) ? 30 : 10),
                      child: Responsive.isDesktop(context)
                          ? Text(
                              "Dont Worry we will ask you \n few questions  and that all ",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500))
                          : Text(
                              "Dont Worry we \nwill ask you\nfew questions\nand that all ",
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
                          width: Responsive.isDesktop(context) ? 250 : 100,
                          height: Responsive.isDesktop(context) ? 300 : 100,
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
                            SizedBox(width: 10),
                            Responsive.isDesktop(context)
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Select the Way \nYou Like To \nPay or Receive",
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
                          padding: const EdgeInsets.only(left: 30),
                          child: Responsive.isDesktop(context)
                              ? Text(
                                  "You can choose from various \n options such as credit card ,\n credit BNPL etc.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))
                              : Text(
                                  "You can choose from\n various  options such as\n credit card, credit BNPL\n etc.",
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
                          width: Responsive.isDesktop(context) ? 250 : 100,
                          height: Responsive.isDesktop(context) ? 300 : 100,
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
                            SizedBox(
                              width: 10,
                            ),
                            Responsive.isDesktop(context)
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Alright!You Are\n Now Ready to\n Pay Or Recieve ",
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
                          padding: const EdgeInsets.only(left: 30),
                          child: Responsive.isDesktop(context)
                              ? Text(
                                  "Pay to anyone via various payment\n options such as credit card, \nBank Transfer and Easy Payment Plan",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500))
                              : Text(
                                  "Pay to anyone via \nvarious payment options \nsuch as credit card,\n Bank Transfer and Easy\n Payment Plan",
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
            // width: MediaQuery.of(context).size.width / 1,
            // height:Responsive.isDesktop(context)? MediaQuery.of(context).size.height / 1.8:
            // MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
                border: Border.all(
              width: 3,
              color: Colors.grey.withOpacity(0.2),
            )),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
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
                                    fontFamily: 'Poppins',
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
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Responsive.isDesktop(context)
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Why does Carditnow Charge service ",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Styles.whitecolortext,
                                              fontSize: 20,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w700)),
                                      Text("fee?",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Styles.whitecolortext,
                                              fontSize: 20,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w700)),
                                      SizedBox(height: 20),
                                    ],
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Why does Carditnow \nCharge service fee ",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Styles.whitecolortext,
                                              fontSize: 20,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w700)),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.only(left: 0),
                          child: Responsive.isDesktop(context)
                              ? Text(
                                  "Convenience Fee covers the processing costs to credit card Issuer,\n Lenders, network providers for each transaction made.\n The fee also ensures our platform remains\n secure for your everyday use.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500))
                              : Text(
                                  "Convenience Fee covers the\n processing costs to credit \ncard Issuer, Lenders, network\n providers for each transaction\n made. The fee also ensures our\n platform remains secure for\n your everyday use.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 3
                          : 275,
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
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Subscription fee and no',
                              style: TextStyle(
                                  color: Color(0XffCEE812),
                                  fontSize: 17,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'hidden cost',
                              style: TextStyle(
                                  color: Color(0XffCEE812),
                                  fontSize: 17,
                                  fontFamily: 'Poppins',
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
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'fee for all Government Payments ',
                              style: TextStyle(
                                  color: Color(0Xff99B5B9),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'And 3.2% for Rent',
                              style: TextStyle(
                                  color: Color(0Xff99B5B9),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
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
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              'fee for every transaction.',
                              style: TextStyle(
                                color: Color(0XffCEE812),
                                fontSize: 13,
                                fontFamily: 'Poppins',
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
      padding: EdgeInsets.all(15),
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
                              fontFamily: 'Poppins',
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
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Responsive.isDesktop(context)
                      ? Row(
                          children: [
                            Text(
                                "Simplify your living expenses with flexible payments.\n Fast and easy online approvals.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(4, 19, 22, 0.75))),
                          ],
                        )
                      : Row(
                          children: [
                            Text(
                                "Simplify your living expenses\n with flexible payments. Fast\n and easy online approvals.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(4, 19, 22, 0.75))),
                          ],
                        ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Column(
                  children: [
                    Responsive.isDesktop(context)
                        ? Text("Carditnow Partners coming soon.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',

                                // fontFamily: 'Sora',
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(4, 19, 22, 0.75)))
                        : Text("Carditnow Partners\n coming soon.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',

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
                                  fontFamily: 'Poppins',
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
                                      fontFamily: 'Poppins',
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
                                          fontFamily: 'Poppins',
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
                        width: 200,
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
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 2.5
                    : 245,
                height: Responsive.isDesktop(context) ? 500 : 245,
                decoration: BoxDecoration(
                    //  color: Colors.black,
                    image: DecorationImage(
                  image: AssetImage(
                    "assets/phones1.png",
                  ),
                  fit: BoxFit.fill,
                )),
              ),
              Responsive.isDesktop(context)
                  ? Column(
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
                            Text(
                                "Choose Carditnow Payee or\n  Onboard new  Payee",
                                style: TextStyle(
                                    color: Color(0XFF004751).withOpacity(0.9),
                                    fontSize: 23,
                                    fontFamily: 'Poppins',
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
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300)),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
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
                            Text(
                                "Choose Carditnow\n Payee or  Onboard\n new  Payee",
                                style: TextStyle(
                                    color: Color(0XFF004751).withOpacity(0.9),
                                    fontSize: 23,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 40, top: 10),
                              child: Text(
                                  "Onboard payee by adding his/her\n bank details and wait for\n an few minutes till we\n verify your Payee",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
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
                padding: const EdgeInsets.only(left: 20),
                child: Responsive.isDesktop(context)
                    ? Column(
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
                                Text("Verify Your Bank\n Details ",
                                    style: TextStyle(
                                        color:
                                            Color(0XFF004751).withOpacity(0.9),
                                        fontSize: 23,
                                        fontFamily: 'Poppins',
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
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w300)),
                                ),
                              ],
                            ),
                          ])
                    : Column(
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
                                Text("Verify Your Bank\n Details ",
                                    style: TextStyle(
                                        color:
                                            Color(0XFF004751).withOpacity(0.9),
                                        fontSize: 23,
                                        fontFamily: 'Poppins',
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
                                      "Verify your bank details\n and upload 3-month\n pay slips for loan\n verification.",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w300)),
                                ),
                              ],
                            ),
                          ]),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Container(
                  width: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 2.5
                      : 245,
                  height: Responsive.isDesktop(context) ? 500 : 245,
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
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 2.5
                    : 245,
                height: Responsive.isDesktop(context) ? 500 : 245,
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
                      Text("Choose From The\n Lenders",
                          style: TextStyle(
                              color: Color(0XFF004751).withOpacity(0.9),
                              fontSize: 23,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 40,
                          top: 10,
                        ),
                        child: Responsive.isDesktop(context)
                            ? Text(
                                "Carditnow will show you the list of \n lenders from whom you can choose to go ahead with.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300))
                            : Text(
                                "Carditnow will show you the list of \n lenders from whom you\n can choose to go ahead with.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300),
                              ),
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
                child: Responsive.isDesktop(context)
                    ? Column(
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
                                Text("Pay To Your Seller\n Anytime ",
                                    style: TextStyle(
                                        color:
                                            Color(0XFF004751).withOpacity(0.9),
                                        fontSize: 23,
                                        fontFamily: 'Poppins',
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
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300))),
                              ],
                            ),
                          ])
                    : Column(
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
                                Text("Pay To Your Seller\n Anytime ",
                                    style: TextStyle(
                                        color:
                                            Color(0XFF004751).withOpacity(0.9),
                                        fontSize: 23,
                                        fontFamily: 'Poppins',
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
                                      "Overview of your payment\n details and Swipe to Pay.\n Congratulations! You have\n completed the payment.",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300)),
                                ),
                              ],
                            ),
                          ]),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  width: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 2.5
                      : 245,
                  height: Responsive.isDesktop(context) ? 500 : 245,
                  decoration: BoxDecoration(
                      //   color: Colors.black,
                      image: DecorationImage(
                    image: AssetImage(
                      "assets/phone4.png",
                    ),
                    fit: BoxFit.fill,
                  )),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 2.5
                    : 245,
                height: Responsive.isDesktop(context) ? 500 : 245,
                decoration: BoxDecoration(
                    //  color: Colors.black,
                    image: DecorationImage(
                  image: AssetImage(
                    "assets/phone5.png",
                  ),
                  fit: BoxFit.fill,
                )),
              ),
              Responsive.isDesktop(context)
                  ? Column(
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
                            Text(
                                "Congratulations ! you have\n Completed A Payment",
                                style: TextStyle(
                                    color: Color(0XFF004751).withOpacity(0.9),
                                    fontSize: 23,
                                    fontFamily: 'Poppins',
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
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300)),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
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
                            Text(
                                "Congratulations ! you\n have Completed A\n Payment",
                                style: TextStyle(
                                    color: Color(0XFF004751).withOpacity(0.9),
                                    fontSize: 23,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 40, top: 10),
                              child: Text(
                                  "Onboard payee by adding his/her\n bank details and wait for\n an few minutes till we\n verify your Payee",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
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
                        width: Responsive.isDesktop(context) ? 400 : 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 60,
                              left: Responsive.isDesktop(context) ? 40 : 10),
                          child: Column(
                            children: [
                              Text("Simplify Payments",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Styles.whitecolortext,
                                      fontSize: Responsive.isDesktop(context)
                                          ? 40
                                          : 35,
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
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 190),
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
                                  width: Responsive.isDesktop(context)
                                      ? MediaQuery.of(context).size.width / 4.4
                                      : MediaQuery.of(context).size.width / 2.5,
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
                                    Get.to(Country());
                                  }),
                              SizedBox(
                                height: 20,
                              )
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
                        width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 2
                            : 220,
                        height: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 3
                            : 220,
                      ),
                      Positioned(
                        top: 70,
                        // bottom: 10,
                        right: Responsive.isDesktop(context) ? 590 : 160,

                        width: 120,
                        height: Responsive.isDesktop(context) ? 300 : 150,
                        child: IconButton(
                          splashColor: Colors.transparent,
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
    return Responsive.isDesktop(context)
        ? Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
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
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 20),
                          Text('Security is our Core and Number one priority',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white60)),
                          SizedBox(height: 20),
                          Text(
                              'We maintain strict compliance of all guidelines, requirements,  directives and \nconditions issued by Bangko Sentral ng Pilipinas as well as Financial\n institution partners. All funds will always be held securely with Financial\n institution partners.',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              )),
                          SizedBox(height: 20),
                          Text(
                              ' We also take additional measures to evaluate the risk across all our\n platforms and have constant back up and firewalls in place to keep your data\n safe at all times.',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
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
                          SizedBox(height: 20),
                        ],
                      ),
                      Container(
                        child: Image.asset(
                          'assets/web_info.png',
                          width: 500,
                          height: 600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        : Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
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
                              'We Keep your Information and \nTransactions Safe and Secure',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 20),
                          Text('Security is our Core and\n Number one priority',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white60)),
                          SizedBox(height: 20),
                          Text(
                              'We maintain strict compliance of\n all guidelines, requirements,  directives\n and conditions issued by\n Bangko Sentral ng Pilipinas as well as Financial\n institution partners. All funds\n will always be held securely\n with Financial institution partners.',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              )),
                          SizedBox(height: 20),
                          Text(
                              ' We also take additional measures\n to evaluate the risk across all our\n platforms and have constant back up \nand firewalls in place to keep your data\n safe at all times.',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          SizedBox(height: 30),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
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
                          SizedBox(height: 20),
                        ],
                      ),
                      Container(
                        width: 150,
                        height: 300,
                        child: Image.asset(
                          'assets/web_info.png',
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30)
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

          ],
        ),
      ),
    );
  }
}

class contactus extends StatelessWidget {
  const contactus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
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
      ]
    );
  }
}




//for web

class ContactUsWeb extends StatelessWidget {
  const ContactUsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)? Column(
      children: [
           Container(
                  margin: EdgeInsets.all(15),
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.1)),
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
                                style: TextStyle(
                                    fontFamily: 'Sora', fontSize: 16)),
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 15),
                                      focusColor: Colors.grey.shade300,
                                      border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 1.0)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          gapPadding: 7,
                                          borderSide: const BorderSide(color: Colors.grey)),
                                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: const BorderSide(color: Colors.grey)),
                                      errorStyle: const TextStyle(fontFamily: 'Sora', fontSize: 13, fontWeight: FontWeight.bold))),
                            ),
                            SizedBox(height: 10),
                            Text('Email',
                                style: TextStyle(
                                    fontFamily: 'Sora', fontSize: 16)),
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 15),
                                      focusColor: Colors.grey.shade300,
                                      border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 1.0)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          gapPadding: 7,
                                          borderSide: const BorderSide(color: Colors.grey)),
                                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: const BorderSide(color: Colors.grey)),
                                      errorStyle: const TextStyle(fontFamily: 'Sora', fontSize: 13, fontWeight: FontWeight.bold))),
                            ),
                            SizedBox(height: 10),
                            Text('What do you want to tell us?',
                                style: TextStyle(
                                    fontFamily: 'Sora', fontSize: 16)),
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
    ):Column(
      children: [
            Container(
                  margin: EdgeInsets.all(15),
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                  child: (Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                              //width: 450,
                              // height: 400,
                              child: Image.asset(
                            'assets/getintouch.png',
                            width: 300,
                          )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Your Name',
                                style: TextStyle(
                                    fontFamily: 'Sora', fontSize: 16)),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width / 4.5,
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 15),
                                      focusColor: Colors.grey.shade300,
                                      border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 1.0)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          gapPadding: 7,
                                          borderSide: const BorderSide(color: Colors.grey)),
                                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: const BorderSide(color: Colors.grey)),
                                      errorStyle: const TextStyle(fontFamily: 'Sora', fontSize: 13, fontWeight: FontWeight.bold))),
                            ),
                            SizedBox(height: 10),
                            Text('Email',
                                style: TextStyle(
                                    fontFamily: 'Sora', fontSize: 16)),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width / 4.5,
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 15),
                                      focusColor: Colors.grey.shade300,
                                      border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 1.0)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          gapPadding: 7,
                                          borderSide: const BorderSide(color: Colors.grey)),
                                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: const BorderSide(color: Colors.grey)),
                                      errorStyle: const TextStyle(fontFamily: 'Sora', fontSize: 13, fontWeight: FontWeight.bold))),
                            ),
                            SizedBox(height: 10),
                            Text('What do you want to tell us?',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Sora', fontSize: 16)),
                            SizedBox(height: 10),
                            Container(
                                width: MediaQuery.of(context).size.width / 4.5,
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
                              width: MediaQuery.of(context).size.width / 4.5,
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
//for web(about us......)
class buildaboutweb extends StatelessWidget {
  const buildaboutweb({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                // width: MediaQuery.of(context).size.width / 1,
                // height: MediaQuery.of(context).size.height / 1.5,

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
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(height: 20),
                          Text('Know More About us',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                          SizedBox(height: 20),
                          Text(
                              'Carditnow is a third party provider registered user\n SEC 2022070061722-06.  We adhere\n to the highest standards of security and\n compliance in the market where we operate\n, your transactions are processed through\n regulated financial institutions and\n via a client safeguarded account.',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                          SizedBox(height: 20),
                          Text(
                              'Our aim is streamlining all your expenses\n in One App, Enjoy hassle free payments,\n interest free credit and\n bigger rewards.',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
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
            ],
          )
        : Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
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
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(height: 20),
                          Text('Know More About us',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                          SizedBox(height: 20),
                          Text(
                              'Carditnow is a third party provider\n registered user SEC 2022070061722-06.\n  We adhere to the highest standards of\n security and compliance in the\n market where we operate, your transactions\n are processed through regulated\n financial institutions and via a \nclient safeguarded account.',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                          SizedBox(height: 20),
                          Text(
                              'Our aim is streamlining all your\n expenses in One App, Enjoy hassle\n free payments, interest free credit\n and bigger rewards.',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
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
                        width: 200,
                        height: 300,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
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
    return Responsive.isDesktop(context)
        ? Column(
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
          )
        : Column(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
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
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
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
                            ],
                          ),
                          SizedBox(height: 20),
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
                      height: MediaQuery.of(context).size.height / 2,
                      child: Image.asset('assets/city.png',
                          width: MediaQuery.of(context).size.width / 2,
                          fit: BoxFit.fill)),
                ],
              ),
            ],
          );
  }
}

class MyMenuBar extends StatefulWidget {
  final ItemScrollController controller;
  MyMenuBar({super.key, required this.controller});

  @override
  State<MyMenuBar> createState() => _MyMenuBarState();
}

class _MyMenuBarState extends State<MyMenuBar> with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 7, vsync: this);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: TabBar(
          controller: tabController,
          labelPadding: EdgeInsets.zero,
          labelColor: Color(0XFF004751),
          labelStyle: TextStyle(
              fontFamily: 'Sora',
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500),
          indicatorColor: Color(0XFF004751),
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          tabs: [
            InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  widget.controller.scrollTo(
                      index: 0,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutCubic);
                  tabController.index = 0;

                  //  drawerselection = items[0];
                });
              },
              child: Text(
                'Home',
              ),
            ),
            InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  widget.controller.scrollTo(
                      index: 2,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutCubic);
                  tabController.index = 1;
                  //drawerselection = items[0];
                });
              },
              child: Text(
                'How it Works?',
              ),
            ),
            InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  widget.controller.scrollTo(
                      index: 3,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutCubic);
                  tabController.index = 2;

                  //drawerselection = items[2];
                });
              },
              child: Text(
                'Pricing',
              ),
            ),
            InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  widget.controller.scrollTo(
                      index: 4,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutCubic);
                  tabController.index = 3;

                  // drawerselection = items[3];
                });
              },
              child: Text(
                'Split Expenses',
              ),
            ),
            InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  widget.controller.scrollTo(
                      index: 5,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutCubic);
                  tabController.index = 4;

                  //  drawerselection = items[0];
                });
              },
              child: Text(
                'Refer a friend',
              ),
            ),
            InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  widget.controller.scrollTo(
                      index: 6,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutCubic);
                  tabController.index = 5;

                  // drawerselection = items[0];
                });
              },
              child: Text(
                'About Us',
              ),
            ),
            InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  widget.controller.scrollTo(
                      index: 8,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutCubic);
                  tabController.index = 6;

                  ///  drawerselection = items[0];
                });
              },
              child: Text(
                'Contact Us',
              ),
            ),
          ]),
    );
  }
}
