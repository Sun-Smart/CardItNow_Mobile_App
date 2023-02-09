// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cardit/auth/auth.dart';
import 'package:cardit/ui/dashboard/paynow_menu/payment_overview_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../responsive/responsive.dart';
import '../../widgets/auth_button.dart';

class YourTaxDetails extends StatefulWidget {
  const YourTaxDetails({Key? key}) : super(key: key);

  @override
  State<YourTaxDetails> createState() => _YourTaxDetailsState();
}

class _YourTaxDetailsState extends State<YourTaxDetails> {
  TextEditingController paymentController = TextEditingController();
  final AuthCon con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              centerTitle: true,
              title: Text('Your Tax Details',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold)))
          : null,
      body: Responsive.isMobile(context)
          ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Property Owner',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 10),
                    Text(con.Owner['Owner'] ?? '',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Text('Property Address',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 10),
                    Text(con.Owner['Address'] ?? '',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Text('Tax Assessment Value',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 10),
                    Text("₱ 20,000",
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Text('Market Value',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 10),
                    Text("₱ 40,000",
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Text('Assesment Period',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 10),
                    Text("2 Years",
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Text('Tax Declaration Number',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 10),
                    Text("232342545345",
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Text('Property Identification Number',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 10),
                    Text("232342545345",
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Text('NA Number',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 10),
                    Text("34345345345",
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Text('Assessment Date',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 10),
                    Text("1st January 2022",
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: TextFormField(
                                  controller: paymentController,
                                  decoration: InputDecoration(
                                      hintText:
                                          'Enter How Much you want to pay',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Sora', fontSize: 14)))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              BackButton(
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Text('Your Tax Details',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Sora',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                              Text('Property Owner',
                                  style: TextStyle(
                                      fontFamily: 'Sora',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(con.Owner['Owner'] ?? '',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  color: Colors.grey,
                                  fontSize: 16)),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                              Text('Property Address',
                                  style: TextStyle(
                                      fontFamily: 'Sora',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(con.Owner['Address'] ?? '',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  color: Colors.grey,
                                  fontSize: 16)),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                              Text('Tax Assessment Value',
                                  style: TextStyle(
                                      fontFamily: 'Sora',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text("₱ 20,000",
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  color: Colors.grey,
                                  fontSize: 16)),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //  SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                              Text('Market Value',
                                  style: TextStyle(
                                      fontFamily: 'Sora',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text("₱ 40,000",
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  color: Colors.grey,
                                  fontSize: 16)),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                              Text('Assesment Period',
                                  style: TextStyle(
                                      fontFamily: 'Sora',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text("2 Years",
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  color: Colors.grey,
                                  fontSize: 16)),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                              Text('Tax Declaration Number',
                                  style: TextStyle(
                                      fontFamily: 'Sora',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text("232342545345",
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  color: Colors.grey,
                                  fontSize: 16)),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                              Text('Property Identification Number',
                                  style: TextStyle(
                                      fontFamily: 'Sora',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text("232342545345",
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  color: Colors.grey,
                                  fontSize: 16)),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                              Text('NA Number',
                                  style: TextStyle(
                                      fontFamily: 'Sora',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text("34345345345",
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  color: Colors.grey,
                                  fontSize: 16)),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //  SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                              Text('Assessment Date',
                                  style: TextStyle(
                                      fontFamily: 'Sora',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text("1st January 2022",
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  color: Colors.grey,
                                  fontSize: 16)),
                          SizedBox(height: 20),
                          Container(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4
                                : MediaQuery.of(context).size.width / 2,
                            height: 60,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: TextFormField(
                                        controller: paymentController,
                                        decoration: InputDecoration(
                                            hintText:
                                                'Enter How Much you want to pay',
                                            hintStyle: TextStyle(
                                                fontFamily: 'Sora',
                                                fontSize: 14)))),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => OverviewPayment());
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              width: Responsive.isDesktop(context)
                                  ? MediaQuery.of(context).size.width / 4
                                  : MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                  color: HexColor('#CEE812'),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Agree and Proceed",
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: Responsive.isMobile(context)
          ? AuthButton(
              decoration: BoxDecoration(
                  color: HexColor('#CEE812'),
                  borderRadius: BorderRadius.circular(5)),
              onTap: () {
                Get.to(() => OverviewPayment());
              },
              text: "Agree and Proceed")
          : null,
    );
  }
}
