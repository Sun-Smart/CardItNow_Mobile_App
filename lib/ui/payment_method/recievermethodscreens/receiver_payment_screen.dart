// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cardit/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ReceiverPaymentScreen extends StatefulWidget {
  const ReceiverPaymentScreen({Key? key}) : super(key: key);

  @override
  State<ReceiverPaymentScreen> createState() => _ReceiverPaymentScreenState();
}

class _ReceiverPaymentScreenState extends State<ReceiverPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: Responsive.isMobile(context)?AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: Colors.black,
          title: Text('Payments',
              style: TextStyle(
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
          backgroundColor: Colors.transparent,
          bottom: TabBar(
            indicatorColor: Color(0XffCEE812),
            indicatorWeight: 2.5,
            tabs: [
              Tab(text: "This Week"),
              Tab(text: "This Month"),
              Tab(text: "This Year"),
            ],
          ),
          actions: [
            Icon(Icons.pie_chart_rounded),
            SizedBox(width: 10),
            Center(
                child: Text('Monthly',
                    style: TextStyle(fontSize: 12, fontFamily: 'Sora'))),
            Center(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_arrow_down_sharp))),
            SizedBox(width: 10),
          ],
        ):null,
        body:Responsive.isMobile(context)? TabBarView(
          children: [
            _buildThisWeek(),
            Text('Pass'),
            _buildThisWeek(),
          ],
        ):Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 SizedBox(height: 30,),
Text('Payments',
              style: TextStyle(
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
              ],
            ),
            SizedBox(height: 40,),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: TabBar(
              indicatorColor: Color(0XffCEE812),
              indicatorWeight: 2.5,
              tabs: [
                Tab(text: "This Week"),
                Tab(text: "This Month"),
                Tab(text: "This Year"),
              ],
                      ),
            ),
            Expanded(
              child: Container(
                 width: MediaQuery.of(context).size.width/2,
                child: TabBarView(
                  children: [
                    _buildThisWeek(),
                    Text('Pass'),
                    _buildThisWeek(),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _buildThisWeek() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Transactions',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('₱ 20000',
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
                    center: Text("+0.47%",
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
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Carditnow Points',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('2000.0',
                          style: TextStyle(
                              color: HexColor('#CEE812'),
                              fontSize: 24,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            _buildCustomerDetails(),
            SizedBox(height: 30),
            _buildCustomerDetails(),
            SizedBox(height: 30),
            _buildCustomerDetails(),
            SizedBox(height: 30),
            _buildCustomerDetails(),
            SizedBox(height: 30),
            _buildCustomerDetails(),
            SizedBox(height: 30),
            _buildCustomerDetails(),
            SizedBox(height: 30),
            _buildCustomerDetails(),
          ],
        ),
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
}
