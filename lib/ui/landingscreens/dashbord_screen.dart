// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, sort_child_properties_last, avoid_print, unnecessary_null_comparison, library_private_types_in_public_api, unnecessary_import, non_constant_identifier_names

import 'dart:io';
import 'package:cardit/api/payment_api.dart';
import 'package:cardit/const/responsive.dart';
import 'package:cardit/ui/dashboard/paynow_menu/dashboard_payment_screen.dart';
import 'package:cardit/ui/landingscreens/PaymentViewAll.dart';
import 'package:cardit/ui/landingscreens/payments_details_screen.dart';
import 'package:cardit/ui/payment_method/add_credit_card.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../api/card_api.dart';
import '../../api/regster_api.dart';
import '../../main.dart';
import '../../themes/styles.dart';
import '../../themes/theme_notifier.dart';
import '../../widgets/bottom_navbar.dart';
import '../../widgets/promo_slider.dart';
import '../splash/home_screen.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({Key? key}) : super(key: key);

  @override
  DashbordScreenState createState() => DashbordScreenState();
}

class DashbordScreenState extends State<DashbordScreen>
    with SingleTickerProviderStateMixin {
  final RegisterAPI con = Get.find();
  PaymentAPI pay = PaymentAPI();
  final CardAPI cardcons = Get.put(CardAPI());
  int _currentsliderindex = 0;
  var item = ['Monthly', 'weekly'];
  String? dropdownvalue;

  @override
  void initState() {
    cardcons.creditCardgetAPI();
    pay.transactionListAPI();
    imageprint();
    print("sdfs" + pay.transactionList.toString());
    super.initState();
  }

  imageprint() {
    var printimage = GetStorage().read("avatarpic").toString();
    print("dsdsf" + printimage.toString());
  }

  var dashboard = '/payment_dashboard';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackButtonPressed,
        child: Scaffold(
            bottomNavigationBar:
                Responsive.isMobile(context) ? BottomNavBarWidget(0) : null,
            appBar: Responsive.isMobile(context)
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(70.0),
                    child: AppBar(
                      elevation: 0,
                      centerTitle: false,
                      leadingWidth: 40,
                      titleSpacing: 0.0,
                      backgroundColor: Styles.colorBackgroundBlock,
                      title: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color(0xff036D7A)),
                                  child: GetStorage().read("avatarpic") == null
                                      ? Container()
                                      : GetStorage()
                                              .read("avatarpic")
                                              .toString()
                                              .contains('assets')
                                          ? Image.asset(
                                              GetStorage().read("avatarpic"),
                                              fit: BoxFit.cover,
                                              height: 43,
                                              width: 43)
                                          : Container()),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (MyApp.logindetails != null)
                                        RichText(
                                            text: TextSpan(
                                                text:
                                                    '${MyApp.logindetails['username']}',
                                                style: const TextStyle(
                                                    color: Color(0xff036D7A),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                /*defining default style is optional */
                                                children: <TextSpan>[
                                              TextSpan(
                                                  text: '',
                                                  style: const TextStyle(
                                                      color: Color(0xffC9E313),
                                                      fontSize: 18))
                                            ])),
                                      const Text(
                                        'Welcome !',
                                        style: TextStyle(
                                            color: Color(0xffA49EA5),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ))
                            ],
                          )),
                      actions: [
                        Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 10),
                            child: GestureDetector(
                                onTap: () {},
                                child: Image.asset('assets/notification.png',
                                    fit: BoxFit.contain,
                                    width: 25,
                                    height: 25))),
                        Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 10),
                            child: GestureDetector(
                                onTap: () {},
                                child: IconButton(
                                    onPressed: () {
                                      _logoutPressed();
                                    },
                                    icon: Icon(Icons.power_settings_new,
                                        color: Colors.black)))),
                      ],
                    ),
                  )
                : null,
            body: Responsive.isMobile(context)
                ? SingleChildScrollView(
                    child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            cardcons.creditCardGet.isEmpty
                                ? Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: HexColor('#004751'),
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Align(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                                radius: 30,
                                                backgroundColor:
                                                    HexColor('#CEE812'),
                                                child: CircleAvatar(
                                                    child: IconButton(
                                                        onPressed: () {
                                                          Get.to(() =>
                                                              AddCreditCardPage());
                                                        },
                                                        icon: Icon(Icons.add,
                                                            color: HexColor(
                                                                '#004751'))),
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 28)),
                                            SizedBox(height: 10),
                                            Text('Add Card',
                                                style: TextStyle(
                                                    fontFamily: 'Sora',
                                                    fontSize: 16)),
                                          ],
                                        ))))
                                : Slider(),
                            buildPaySchedule(),
                            buildPayCharttitle(),
                            buildPayChart(),
                            buildTranstitle(),
                            // _buildBusinesscard(),
                            buildTransactionCade(),

                            const SizedBox(height: 20)
                          ],
                        )))
                : Responsive.isDesktop(context)
                    ? Row(
                        children: [
                          Obx(() => Container(
                                width: MediaQuery.of(context).size.width / 3.5,
                                //height: MediaQuery.of(context).size.width / 1,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1)),
                                child: 
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: const Color(0xff036D7A)),
                                              child: GetStorage()
                                                          .read("avatarpic") ==
                                                      null
                                                  ? Container()
                                                  : GetStorage()
                                                          .read("avatarpic")
                                                          .toString()
                                                          .contains('assets')
                                                      ? Image.asset(
                                                          GetStorage()
                                                              .read("avatarpic"),
                                                          fit: BoxFit.cover,
                                                          height: 43,
                                                          width: 43)
                                                      : Image.file(
                                                          File(GetStorage()
                                                              .read("avatarpic")),
                                                          fit: BoxFit.cover,
                                                          height: 43,
                                                          width: 43)),
                                          Container(
                                            // alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (MyApp.logindetails != null)
                                                  RichText(
                                                      text: TextSpan(
                                                          text:
                                                              '${MyApp.logindetails['username']}',
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xff036D7A),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          /*defining default style is optional */
                                                          children: <TextSpan>[
                                                        TextSpan(
                                                            text: '',
                                                            style: const TextStyle(
                                                                color: Color(
                                                                    0xffC9E313),
                                                                fontSize: 18))
                                                      ])),
                                                const Text(
                                                  'Welcome !',
                                                  style: TextStyle(
                                                      color: Color(0xffA49EA5),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      cardcons.creditCardGet.isEmpty
                                          ? Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Row(
                                                children: [
                                                  Container(
                                                      height: 200,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                              color: HexColor(
                                                                  '#004751'),
                                                              width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10)),
                                                      child: Align(
                                                          child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          CircleAvatar(
                                                              radius: 30,
                                                              backgroundColor:
                                                                  HexColor(
                                                                      '#CEE812'),
                                                              child: CircleAvatar(
                                                                  child:
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            Get.to(() =>
                                                                                AddCreditCardPage());
                                                                          },
                                                                          icon: Icon(
                                                                              Icons
                                                                                  .add,
                                                                              color: HexColor(
                                                                                  '#004751'))),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  radius: 28)),
                                                          SizedBox(height: 10),
                                                          Text('Add Card',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  fontSize: 16)),
                                                        ],
                                                      ))),
                                                ],
                                              ))
                                          : Slider(),
                                      payscheduleweb(),
                                      const SizedBox(height: 20),
                                      buildTranstitle(),
                                         buildTransactionCade(),
                                    ],
                                  ),
                                ),
                              )),
                          dashboard == '/payment_dashboard'
                              ? SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1.5,
                                          child: PaymentDashboard()),
                                      buildPayCharttitle(),
                                      buildPayChart()
                                    ],
                                  ),
                                )
                              : Container(),
                        ],
                      )
                    : Row(children: [
                        Obx(() => Container(
                              width: MediaQuery.of(context).size.width / 1.3,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1)),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: const Color(0xff036D7A)),
                                            child: GetStorage()
                                                        .read("avatarpic") ==
                                                    null
                                                ? Container()
                                                : GetStorage()
                                                        .read("avatarpic")
                                                        .toString()
                                                        .contains('assets')
                                                    ? Image.asset(
                                                        GetStorage()
                                                            .read("avatarpic"),
                                                        fit: BoxFit.cover,
                                                        height: 43,
                                                        width: 43)
                                                    : Image.file(
                                                        File(GetStorage()
                                                            .read("avatarpic")),
                                                        fit: BoxFit.cover,
                                                        height: 43,
                                                        width: 43)),
                                        Container(
                                          // alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (MyApp.logindetails != null)
                                                RichText(
                                                    text: TextSpan(
                                                        text:
                                                            '${MyApp.logindetails['username']}',
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xff036D7A),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        /*defining default style is optional */
                                                        children: <TextSpan>[
                                                      TextSpan(
                                                          text: '',
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xffC9E313),
                                                              fontSize: 18))
                                                    ])),
                                              const Text(
                                                'Welcome !',
                                                style: TextStyle(
                                                    color: Color(0xffA49EA5),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    cardcons.creditCardGet.isEmpty
                                        ? Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Row(
                                              children: [
                                                Container(
                                                    height: 200,
                                                    width: Responsive.isDesktop(
                                                            context)
                                                        ? MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.5,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: HexColor(
                                                                '#004751'),
                                                            width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Align(
                                                        child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CircleAvatar(
                                                            radius: 30,
                                                            backgroundColor:
                                                                HexColor(
                                                                    '#CEE812'),
                                                            child: CircleAvatar(
                                                                child:
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          Get.to(() =>
                                                                              AddCreditCardPage());
                                                                        },
                                                                        icon: Icon(
                                                                            Icons
                                                                                .add,
                                                                            color: HexColor(
                                                                                '#004751'))),
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                radius: 28)),
                                                        SizedBox(height: 10),
                                                        Text('Add Card',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Sora',
                                                                fontSize: 16)),
                                                      ],
                                                    ))),
                                              ],
                                            ))
                                        : Slider(),
                                    payscheduleweb(),
                                    // const SizedBox(height: 20),
                                    // dashboard == '/payment_dashboard'
                                    //     ? Container(
                                    //         width: MediaQuery.of(context)
                                    //                 .size
                                    //                 .width /
                                    //             2.3,
                                    //         child: PaymentDashboard())
                                    //     : Container(),
                                    buildTranstitle(),
                                     buildTransactionCade(),
                                    buildPayCharttitle(),
                                    buildPayChart(),
                                      
                                  ],
                                ),
                              ),
                            )),
                      ])));
  }

  //Logout Tapped
  _logoutPressed() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          title: const Text('Really...',
              style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          content: const Text('Do you want to Logout the app?',
              style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: HexColor('#90BA06'),
                  child: Text('Yes'),
                  onPressed: () {
                    GetStorage().remove('save_token');
                    GetStorage().remove("custid");
                    GetStorage().remove('avatarpic');
                    GetStorage().remove('getuserid');
                    GetStorage().remove("customer_type");
                    Get.offAll(Home());
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                MaterialButton(
                  color: HexColor('#90BA06'),
                  child: Text('No'),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  //Back Press
  Future<bool> _onBackButtonPressed() async {
    bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          title: const Text('Really...',
              style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          content: const Text('Do you want to Close the app?',
              style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          actions: <Widget>[
            AuthButton(
              decoration: BoxDecoration(
                  color: HexColor('#90BA06'),
                  borderRadius: BorderRadius.circular(5)),
              onTap: () {
                SystemNavigator.pop();
              },
              text: "Yes",
            ),
            AuthButton(
              decoration: BoxDecoration(
                  color: HexColor('#D2ED78'),
                  borderRadius: BorderRadius.circular(5)),
              onTap: () {
                Navigator.pop(context);
              },
              text: "No",
            ),
          ],
        );
      },
    );
    return exitApp ?? false;
  }

  Widget Slider() {
    return Container(
      width:Responsive.isMobile(context)?0: MediaQuery.of(context).size.width/2,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/dashbordpg.png"), fit: BoxFit.cover)),
      child: TopPromoSlider(),
    );
  }

  Widget payscheduleweb() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Responsive.isDesktop(context)
        ? Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: const Color(0XFFB7C5C7), width: 1.5),
                        color: const Color(0XFFffffff)),
                    margin: const EdgeInsets.all(15),
                    child: InkWell(
                      highlightColor: const Color(0XFFffffff),
                      focusColor: const Color(0XFFffffff),
                      splashColor: Colors.green,
                      onTap: () {
                        if (dashboard == '/payment_dashboard') {
                          setState(() {
                            dashboard;
                          });
                        }
                      },
                      // button pressed
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(width: 5),
                              Image.asset("assets/paynow.png", width: 32),
                              const SizedBox(width: 15),
                              Text("Pay Now",
                                  style: TextStyle(
                                      color: themeChange.darkTheme
                                          ? Colors.black
                                          : const Color(0XFF413D4B),
                                      fontSize: 14)),
                              //text
                            ],
                          )),
                    )),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: const Color(0XFFB7C5C7), width: 1.5),
                      color: const Color(0XFFffffff),
                    ),
                    margin: const EdgeInsets.all(15),
                    child: InkWell(
                      highlightColor: const Color(0XFFffffff),
                      focusColor: const Color(0XFFffffff),
                      splashColor: Colors.green,
                      // splash color
                      onTap: () {
                        if (dashboard == '/payment_dashboard') {
                          setState(() {
                            dashboard;
                          });
                        }
                      },
                      // button pressed
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(width: 5),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: const Color(0xffC9E313)),
                                  padding: const EdgeInsets.all(4),
                                  child: Image.asset(
                                    "assets/calander.png",
                                    width: 20,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                "Schedule",
                                style: TextStyle(
                                    color: Color(0XFF413D4B), fontSize: 14),
                              ),
                              // text
                            ],
                          )),
                    )),
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: const Color(0XFFB7C5C7), width: 1.5),
                        color: const Color(0XFFffffff)),
                    margin: const EdgeInsets.all(15),
                    child: InkWell(
                      highlightColor: const Color(0XFFffffff),
                      focusColor: const Color(0XFFffffff),
                      splashColor: Colors.green,
                      onTap: () {
                        // if (dashboard == '/payment_dashboard') {
                        //   setState(() {
                        //     dashboard;
                        //   });
                        // }
                        Get.to(PaymentDashboard());
                      },
                      // button pressed
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(width: 5),
                              Image.asset("assets/paynow.png", width: 20),
                              const SizedBox(width: 15),
                              Text("Pay Now",
                                  style: TextStyle(
                                      color: themeChange.darkTheme
                                          ? Colors.black
                                          : const Color(0XFF413D4B),
                                      fontSize: 14)),
                              //text
                            ],
                          )),
                    )),
                       Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: const Color(0XFFB7C5C7), width: 1.5),
                      color: const Color(0XFFffffff),
                    ),
                    margin: const EdgeInsets.all(15),
                    child: InkWell(
                      highlightColor: const Color(0XFFffffff),
                      focusColor: const Color(0XFFffffff),
                      splashColor: Colors.green,
                      // splash color
                      onTap: () {},
                      // button pressed
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(width: 5),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: const Color(0xffC9E313)),
                                  padding: const EdgeInsets.all(4),
                                  child: Image.asset(
                                    "assets/calander.png",
                                    width: 15,
                                  )),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                "Schedule",
                                style: TextStyle(
                                    color: Color(0XFF413D4B), fontSize: 14),
                              ),
                              // text
                            ],
                          )),
                    )),
            
               ],
            ),
          );
  }

  Widget buildPaySchedule() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border:
                      Border.all(color: const Color(0XFFB7C5C7), width: 1.5),
                  color: const Color(0XFFffffff)),
              margin: const EdgeInsets.all(15),
              child: InkWell(
                highlightColor: const Color(0XFFffffff),
                focusColor: const Color(0XFFffffff),
                splashColor: Colors.green,
                onTap: () {
                  Get.to(PaymentDashboard());
                },
                // button pressed
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(width: 5),
                        Image.asset("assets/paynow.png", width: 32),
                        const SizedBox(width: 15),
                        Text("Pay Now",
                            style: TextStyle(
                                color: themeChange.darkTheme
                                    ? Colors.black
                                    : const Color(0XFF413D4B),
                                fontSize: 14)),
                        //text
                      ],
                    )),
              )),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0XFFB7C5C7), width: 1.5),
                color: const Color(0XFFffffff),
              ),
              margin: const EdgeInsets.all(15),
              child: InkWell(
                highlightColor: const Color(0XFFffffff),
                focusColor: const Color(0XFFffffff),
                splashColor: Colors.green,
                // splash color
                onTap: () {},
                // button pressed
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(width: 5),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xffC9E313)),
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(
                              "assets/calander.png",
                              width: 20,
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "Schedule",
                          style:
                              TextStyle(color: Color(0XFF413D4B), fontSize: 14),
                        ),
                        // text
                      ],
                    )),
              )),
        ],
      ),
    );
  }

  Widget buildTranstitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Recent Transactions",
              style: TextStyle(
                  color: themeChange.darkTheme
                      ? Colors.white
                      : const Color(0XFF041316),
                  fontSize: 20)),
          GestureDetector(
            onTap: () {
              Get.to(paymentviewall());
            },
            child: Text('View All',
                style: TextStyle(
                    color: themeChange.darkTheme
                        ? Colors.blue
                        : const Color(0Xff004751),
                    fontSize: 14)),
          )
        ],
      ),
    );
  }

  Widget buildPayCharttitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Responsive.isMobile(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "Money Spend",
                    style: TextStyle(
                        color: themeChange.darkTheme
                            ? Colors.white
                            : const Color(0XFF041316),
                        fontSize: 20),
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                width: MediaQuery.of(context).size.width / 3.6,
                height: MediaQuery.of(context).size.height / 15,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton(
                    underline: const SizedBox(),
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    value: dropdownvalue,
                    hint: Text(
                      'Monthly',
                      style: TextStyle(
                          color: themeChange.darkTheme
                              ? Colors.blue
                              : const Color(0Xff004751),
                          fontSize: 14),
                    ),
                    icon: InkWell(
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: themeChange.darkTheme
                            ? Colors.white
                            : const Color(0Xff004751),
                      ),
                    ),
                    items: item.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item,
                            style: const TextStyle(
                                color: Color(0Xff004751), fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              //
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "Money Spend",
                    style: TextStyle(
                        color: themeChange.darkTheme
                            ? Colors.white
                            : const Color(0XFF041316),
                        fontSize: 20),
                  )),
              SizedBox(width: MediaQuery.of(context).size.width / 4),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                width: 100,
                // height: MediaQuery.of(context).size.height / 15,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton(
                    underline: const SizedBox(),
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    value: dropdownvalue,
                    hint: Text(
                      'Monthly',
                      style: TextStyle(
                          color: themeChange.darkTheme
                              ? Colors.blue
                              : const Color(0Xff004751),
                          fontSize: 14),
                    ),
                    icon: InkWell(
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: themeChange.darkTheme
                            ? Colors.white
                            : const Color(0Xff004751),
                      ),
                    ),
                    items: item.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item,
                            style: const TextStyle(
                                color: Color(0Xff004751), fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          );
  }

  Widget buildPayChart() {
    print(con.barlist);
    return Responsive.isMobile(context)
        ? Container(
            padding: const EdgeInsets.all(10),
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<SalesData, String>>[
                  ColumnSeries<SalesData, String>(
                      dataSource: con.barlist,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      name: 'Sales',
                      // Enable data label
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      trackColor: Colors.grey,
                      pointColorMapper: (SalesData data, _) => data.color
                )
                ]))
        : Container(
            width: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width / 2.2
                : MediaQuery.of(context).size.width / 2.3,
            padding: const EdgeInsets.all(10),
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<SalesData, String>>[
                  ColumnSeries<SalesData, String>(
                      dataSource: con.barlist,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      name: 'Sales',
                      // Enable data label
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      trackColor: Colors.grey,
                      pointColorMapper: (SalesData data, _) => data.color
                  )
                ]));
  } //
  // Widget _buildBusinesscard() {
  //   final items = <Widget>[];
  //
  //   items.add(buildTransactionCade(
  //       '25 December 2022', '₱ 0', 'Paid to San Nicolas', 45879652, true));
  //   items.add(const SizedBox(
  //     height: 20,
  //   ));
  //   items.add(buildTransactionCade(
  //       '28 December 2022', '₱ 0', 'Paid to San Nicolas', 45879652, false));
  //
  //   return SingleChildScrollView(
  //     padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
  //     child: Column(
  //       children: items,
  //     ),
  //   );
  // }

  Widget buildTransactionCade() {
    return Container(
      height: 300,
      width: 300,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: pay.transactionList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                    PaymentsDetails(fulldetails: pay.transactionList[index]));
              },
              child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0XffE2E5E5), width: 1.5),
                  ),
                  // padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        padding: const EdgeInsets.all(15),
                        color: const Color(0Xff004751),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${pay.transactionList[index]["payamount"].toString()}",
                                    style: const TextStyle(
                                      color: Color(0XffCEE812),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(pay.transactionList[index]["purpose"],
                                    style: const TextStyle(
                                        color: Color(0Xffffffff),
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Paid to ${pay.transactionList[index]["paidto"]}",
                                      style: const TextStyle(
                                          color: Color(0Xffffffff),
                                          fontSize: 14),
                                      textAlign: TextAlign.left),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ]),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    pay.transactionList[index]
                                            ["transactiondate"]
                                        .toString(),
                                    style: const TextStyle(
                                        color: Color(0Xffffffff),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                        SizedBox(height: 10,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}