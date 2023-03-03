// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, avoid_unnecessary_containers, unnecessary_new, prefer_final_fields, sized_box_for_whitespace

import 'package:cardit/const/responsive.dart';
import 'package:cardit/main.dart';
import 'package:cardit/ui/dashboard/paynow_menu/dashboard_payment_screen.dart';
import 'package:cardit/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_balloon_slider/flutter_balloon_slider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';



class CreditPrepaidScreen extends StatefulWidget {
  const CreditPrepaidScreen({Key? key}) : super(key: key);

  @override
  State<CreditPrepaidScreen> createState() => _CreditPrepaidScreenState();
}

class _CreditPrepaidScreenState extends State<CreditPrepaidScreen> {
  ValueNotifier<double> _slider1Value = ValueNotifier<double>(0.0);
  bool? check1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Responsive.isMobile(context)
          ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                                    : Container()

                              // Image.file(
                              //             File(
                              //                 GetStorage().read("avatarpic")),
                              //             fit: BoxFit.cover,
                              //             height: 43,
                              //             width: 43)

                            ),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                RichText(
                                    text: TextSpan(
                                        text: 'Heloo!',
                                        style:  TextStyle(
                                            color: Color(0xff036D7A),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: ' ${MyApp.logindetails['username']}',
                                          style: const TextStyle(
                                              color: Color(0xffC9E313),
                                              fontSize: 18))
                                    ])),
                                Text(
                                  'Welcome !',
                                  style: TextStyle(
                                      color: HexColor('#1B1B1B'), fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                        Icon(Icons.notifications_none_outlined,
                            color: HexColor('#036D7A'), size: 30)
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cardit Prepaid',
                            style: TextStyle(
                                color: HexColor('#1B1B1B'),
                                fontFamily: 'Sora',
                                fontSize: 20)),
                        SizedBox(height: 10),
                        _buildWalletBalance(),
                        SizedBox(height: 20),
                        _buildContainer(),
                        SizedBox(height: 20),
                        _buildInvitedUsers(),
                        SizedBox(height: 20),
                        _buildRecentTransaction()
                      ],
                    ),
                  )
                ],
              ),
            )
          : Responsive.isDesktop(context)
              ? Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      height: MediaQuery.of(context).size.width / 1,
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: 100,
                              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
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
                                    : Container()

                              // Image.file(
                              //             File(
                              //                 GetStorage().read("avatarpic")),
                              //             fit: BoxFit.cover,
                              //             height: 43,
                              //             width: 43)

                            ),
                                      SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 15),
                                          RichText(
                                              text: TextSpan(
                                                  text: 'Heloo!',
                                                  style: const TextStyle(
                                                      color: Color(0xff036D7A),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  children: <TextSpan>[
                                                TextSpan(
                                                    text: ' Angelo',
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xffC9E313),
                                                        fontSize: 18))
                                              ])),
                                          Text(
                                            'Welcome !',
                                            style: TextStyle(
                                                color: HexColor('#1B1B1B'),
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.notifications_none_outlined,
                                      color: HexColor('#036D7A'), size: 30)
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text('Cardit Prepaid',
                                          style: TextStyle(
                                              color: HexColor('#1B1B1B'),
                                              fontFamily: 'Sora',
                                              fontSize: 20)),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  _buildWalletBalance(),
                                  SizedBox(height: 20),
                                  _buildContainer(),
                                  SizedBox(height: 20),
                                  //   _buildInvitedUsers(),
                                  //SizedBox(height: 20),
                                  _buildRecentTransaction()
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/8),
                      child: _buildInvitedUsers(),
                    )
                  ],
                )
              : Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.width / 1,
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 100,
                              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
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
                                    : Container()

                              // Image.file(
                              //             File(
                              //                 GetStorage().read("avatarpic")),
                              //             fit: BoxFit.cover,
                              //             height: 43,
                              //             width: 43)

                            ),
                                      SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 15),
                                          RichText(
                                              text: TextSpan(
                                                  text: 'Heloo!',
                                                  style: const TextStyle(
                                                      color: Color(0xff036D7A),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  children: <TextSpan>[
                                                TextSpan(
                                                    text: ' Angelo',
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xffC9E313),
                                                        fontSize: 18))
                                              ])),
                                          Text(
                                            'Welcome !',
                                            style: TextStyle(
                                                color: HexColor('#1B1B1B'),
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.notifications_none_outlined,
                                      color: HexColor('#036D7A'), size: 30)
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/1.5,
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Cardit Prepaid',
                                      style: TextStyle(
                                          color: HexColor('#1B1B1B'),
                                          fontFamily: 'Sora',
                                          fontSize: 20)),
                                  SizedBox(height: 10),
                                  _buildWalletBalance(),
                                  SizedBox(height: 20),
                                  _buildContainer(),
                                  //SizedBox(height: 20),
                                 // _buildInvitedUsers(),
                                  SizedBox(height: 20),
                                  _buildRecentTransaction()
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  _buildInvitedUsers(),
                  ],
                ),
      bottomNavigationBar:
          Responsive.isMobile(context) ? BottomNavBarReceiver(index: 0) : null,
    );
  }

  Widget _buildWalletBalance() {
    return Responsive.isMobile(context)?Container(
      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
      height: 170,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Wallet Balance',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(' 0',
                  style: TextStyle(
                      color: HexColor('#CEE812'),
                      fontSize: 24,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold))
            ],
          ),
          CircularPercentIndicator(
            radius: 65,
            lineWidth: 10,
            animation: true,
            percent: .7,
            backgroundColor: HexColor('#1C292C'),
            animationDuration: 2500,
            animateFromLastPercent: true,
            center: Text("+0%",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Sora',
                    color: Colors.white,
                    fontSize: 14)),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: HexColor('#026C7A'),
          ),
        ],
      ),
    ):Responsive.isDesktop(context)?
    Container(
      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
      height: 170,
      width: MediaQuery.of(context).size.width/4,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Wallet Balance',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(' 0',
                  style: TextStyle(
                      color: HexColor('#CEE812'),
                      fontSize: 24,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold))
            ],
          ),
          CircularPercentIndicator(
            radius: 65,
            lineWidth: 10,
            animation: true,
            percent: .7,
            backgroundColor: HexColor('#1C292C'),
            animationDuration: 2500,
            animateFromLastPercent: true,
            center: Text("+0%",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Sora',
                    color: Colors.white,
                    fontSize: 14)),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: HexColor('#026C7A'),
          ),
        ],
      ),
    ):Container(
      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
      height: 170,
      width: MediaQuery.of(context).size.width/2,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Wallet Balance',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(' 0',
                  style: TextStyle(
                      color: HexColor('#CEE812'),
                      fontSize: 24,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold))
            ],
          ),
          CircularPercentIndicator(
            radius: 55,
            lineWidth: 10,
            animation: true,
            percent: .7,
            backgroundColor: HexColor('#1C292C'),
            animationDuration: 2500,
            animateFromLastPercent: true,
            center: Text("+0%",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Sora',
                    color: Colors.white,
                    fontSize: 14)),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: HexColor('#026C7A'),
          ),
        ],
      ),
    );
  }

  Widget _buildContainer() {
    return Responsive.isMobile(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
                  // height: 70,
                  // width: 170,
                  decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#D3D3D3'), width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Image.asset('assets/card/up_arrow.png',
                          width: 50, height: 50),
                      SizedBox(width: 15),
                      Text('Pay',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Sora',fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
                onTap: () {
                  Get.offAll(PaymentDashboard());
                },
              ),

              GestureDetector(
                child: Container(
                  padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
                  // height: 70,
                  // width: 170,
                  decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#D3D3D3'), width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Image.asset('assets/card/up_arrow.png',
                          width: 50, height: 50),
                      SizedBox(width: 15),
                      Text('Receive',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Sora',fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
                onTap: () {
                  print('Receive Tapped');
                },
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Container(
                  height: 70,
                  width: 170,
                  decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#D3D3D3'), width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Image.asset('assets/card/up_arrow.png',
                          width: 50, height: 50),
                      SizedBox(width: 15),
                      Text('Pay',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Sora',
                              color: Colors.black)),
                    ],
                  ),
                ),
                onTap: () {
                  print('Pay Tapped');
                },
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: Container(
                  height: 70,
                  // width: 170,
                  decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#D3D3D3'), width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Image.asset('assets/card/up_arrow.png',
                          width: 50, height: 50),
                      SizedBox(width: 15),
                      Text('Receive',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Sora',
                              color: Colors.black)),
                    ],
                  ),
                ),
                onTap: () {
                  print('Receive Tapped');
                },
              ),
            ],
          );
  }

  Widget _buildInvitedUsers() {
    return Responsive.isMobile(context)
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
                border: Border.all(color: HexColor('#E5E5E5'), width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Image.asset('assets/card/up_arrow.png',
                        width: 50, height: 50),
                    SizedBox(width: 15),
                    Text('Invited Users',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            color: Colors.black)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.black)),
                  ],
                ),
                TextButton(
                  child: Text('Send Link',
                      style: TextStyle(
                          color: HexColor('#026C7A'),
                          fontFamily: 'Sora',
                          fontSize: 12)),
                  onPressed: () {
                    _popupScreen();
                  },
                ),
              ],
            ),
          )
        :Container(
          // padding:Responsive.isDesktop(context)?EdgeInsets.zero:EdgeInsets.only(left: 10,right: 10) ,
            width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 4
                : MediaQuery.of(context).size.width / 2.5,
            height: 70,
            decoration: BoxDecoration(
                border: Border.all(color: HexColor('#E5E5E5'), width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/card/up_arrow.png',
                        width: 50, height: 50),
                    SizedBox(width: 15),
                    Text('Invited Users',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            color: Colors.black)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.black)),
                  ],
                ),
                TextButton(
                  child: Text('Send Link',
                      style: TextStyle(
                          color: HexColor('#026C7A'),
                          fontFamily: 'Sora',
                          fontSize: 12)),
                  onPressed: () {
                    _popupScreen();
                  },
                ),
              ],
            ),
          );
  }

  Widget _buildRecentTransaction() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Transactions',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold)),
              Text('View',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 30),
          // _buildCustomerDetails(),
          // SizedBox(height: 30),
          // _buildCustomerDetails(),
          // SizedBox(height: 30),
          // _buildCustomerDetails(),
          // SizedBox(height: 30),
          // _buildCustomerDetails(),
          // SizedBox(height: 30),
          // _buildCustomerDetails(),
          // SizedBox(height: 30),
          // _buildCustomerDetails(),
          // SizedBox(height: 30),
          // _buildCustomerDetails()
        ],
      ),
    );
  }

  Widget _buildCustomerDetails() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset('assets/card/up_arrow.png', width: 50, height: 50),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Rita',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(width: 25),
                    Icon(Icons.arrow_upward)
                  ],
                ),
                Text('at 4:30 pm',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))
              ],
            ),
          ],
        ),
        Column(
          children: [
            Text(
              '₱ 4000.00',
              style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '24 Dec 21',
              style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    ));
  }

  Future<bool> _popupScreen() async {
    bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return  Responsive.isMobile(context)?AlertDialog(
          content: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Share Link',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold)),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close, size: 25)),
                  ],
                ),
                Text('Choose from options',
                    style: TextStyle(
                        fontSize: 14, color: Colors.grey, fontFamily: 'Sora')),
                SizedBox(height: 20),
                Text('Name of Payer',
                    style: TextStyle(
                        fontSize: 14, color: Colors.black, fontFamily: 'Sora')),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                    hintText: 'Enter Name',
                  ),
                ),
                SizedBox(height: 20),
                Text('Name of Payer',
                    style: TextStyle(
                        fontSize: 14, color: Colors.black, fontFamily: 'Sora')),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                    hintText: 'Enter Email or Phone Number',
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text('or',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 14,
                          color: Colors.black)),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('payviacardir300.co'),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Copy Link',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('#026C7A')),
                            ))
                      ]),
                ),
                SizedBox(height: 10),
                Text('Service Fee',
                    style: TextStyle(
                        fontSize: 14, color: Colors.black, fontFamily: 'Sora')),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0%',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Sora',
                              color: Colors.black)),
                      Text('50%',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Sora',
                              color: Colors.black)),
                      Text('100%',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Sora',
                              color: Colors.black))
                    ]),
                _buildBalloonSlider(
                    showRope: false,
                    color: HexColor('#CEE812'),
                    sliderValue: _slider1Value),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Payer',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 130,
                          height: 50,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 2)),
                            child: Center(
                                child: Text('0.75%',
                                    style: TextStyle(color: Colors.grey))),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Payee',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 130,
                          height: 50,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 2)),
                            child: Center(
                                child: Text('0.75%',
                                    style: TextStyle(color: Colors.grey))),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xff004751),
                      value: check1,
                      tristate: true,
                      onChanged: (value) {
                        setState(() {
                          check1 = value;
                        });
                      },
                    ),
                    Text('Apply for all Payers', style: TextStyle(fontSize: 12))
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: 50,
              width: MediaQuery.of(context).size.width/4,
              child: MaterialButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Share link',
                    style: TextStyle(
                        fontSize: 14, fontFamily: 'Sora', color: Colors.black)),
                color: HexColor('#CEE812'),
              ),
            ),
          ],
        ):AlertDialog(
          content: Container(
            //width: MediaQuery.of(context).size.width/3,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
               // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Share Link',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.close, size: 25)),
                    ],
                  ),
                  Text('Choose from options',
                      style: TextStyle(
                          fontSize: 14, color: Colors.grey, fontFamily: 'Sora')),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width:Responsive.isDesktop(context)?50:10,),
                      Text('Name of Payer',
                          style: TextStyle(
                              fontSize: 14, color: Colors.black, fontFamily: 'Sora')),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4:MediaQuery.of(context).size.width/2,
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2)),
                        hintText: 'Enter Name',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: Responsive.isDesktop(context)?50:10),
                      Text('Name of Payer',
                          style: TextStyle(
                              fontSize: 14, color: Colors.black, fontFamily: 'Sora')),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                     width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width/4:
                     MediaQuery.of(context).size.width/2,
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2)),
                        hintText: 'Enter Email or Phone Number',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text('or',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            color: Colors.black)),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: Responsive.isDesktop(context)?  MediaQuery.of(context).size.width/4:
                    MediaQuery.of(context).size.width/2,
                   // height:  MediaQuery.of(context).size.width/15,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('payviacardir300.co'),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Copy Link',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#026C7A')),
                              ))
                        ]),
                  ),
                  SizedBox(height: 10),
                  Text('Service Fee',
                      style: TextStyle(
                          fontSize: 14, color: Colors.black, fontFamily: 'Sora')),
                  Container(
                    width: Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4:
                    MediaQuery.of(context).size.width/2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('0%',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Sora',
                                  color: Colors.black)),
                          Text('50%',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Sora',
                                  color: Colors.black)),
                          Text('100%',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Sora',
                                  color: Colors.black))
                        ]),
                  ),
                  _buildBalloonSlider(
                      showRope: false,
                      color: HexColor('#CEE812'),
                      sliderValue: _slider1Value),
                  Container(
                    width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width/4 :MediaQuery.of(context).size.width/2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Payer',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 130,
                              height: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey, width: 2)),
                                child: Center(
                                    child: Text('0.75%',
                                        style: TextStyle(color: Colors.grey))),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Payee',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 130,
                              height: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey, width: 2)),
                                child: Center(
                                    child: Text('0.75%',
                                        style: TextStyle(color: Colors.grey))),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                   
                  
                    children: [
                     //  SizedBox(   width:   MediaQuery.of(context).size.width/5,),
                     
                      Checkbox(
                        activeColor: Color(0xff004751),
                        value: check1,
                        tristate: true,
                        onChanged: (value) {
                          setState(() {
                            check1 = value;
                          });
                        },
                      ),
                      Text('Apply for all Payers', style: TextStyle(fontSize: 12))
                    ],
                  )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: 50,
              width: MediaQuery.of(context).size.width/3,
              child: Center(
                child: MaterialButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Share link',
                      style: TextStyle(
                          fontSize: 14, fontFamily: 'Sora', color: Colors.black)),
                  color: HexColor('#CEE812'),
                ),
              ),
            ),
          ],
        );
      },
    );
    return exitApp ?? false;
  }

  Widget _buildBalloonSlider(
      {required ValueNotifier<double> sliderValue,
      required Color color,
      required bool showRope}) {
    return Responsive.isMobile(context)? Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: BalloonSlider(
                value: sliderValue.value,
                ropeLength: 50,
                showRope: showRope,
                onChanged: (val) => sliderValue.value = val,
                color: color)),
        Positioned(
          bottom: 0,
          right: 0,
          child: ValueListenableBuilder<double>(
            valueListenable: sliderValue,
            builder: (context, value, child) {
              int progress = (value * 100).round();
              return Text(
                "$progress",
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              );
            },
          ),
        )
      ],
    ):
    Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
            width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width/4:
            MediaQuery.of(context).size.width/2,
            height: 60,
            child: BalloonSlider(
                value: sliderValue.value,
                ropeLength: 50,
                showRope: showRope,
                onChanged: (val) => sliderValue.value = val,
                color: color)),
        Positioned(
          bottom: 0,
          right: 0,
          child: ValueListenableBuilder<double>(
            valueListenable: sliderValue,
            builder: (context, value, child) {
              int progress = (value * 100).round();
              return Text(
                "$progress",
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              );
            },
          ),
        )
      ],
    );
  }
}
