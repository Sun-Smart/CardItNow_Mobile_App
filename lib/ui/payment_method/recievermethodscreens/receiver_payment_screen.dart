// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cardit/const/responsive.dart';
import 'package:cardit/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';
import '../../../api/payment_api.dart';
import '../../landingscreens/payments_details_screen.dart';
import 'credit_prepaid_screen.dart';

class ReceiverPaymentScreen extends StatefulWidget {
  const ReceiverPaymentScreen({Key? key}) : super(key: key);

  @override
  State<ReceiverPaymentScreen> createState() => _ReceiverPaymentScreenState();
}

class _ReceiverPaymentScreenState extends State<ReceiverPaymentScreen> {

  PaymentAPI pay = PaymentAPI();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pay.transactionListAPI();
  }

  Future<bool> popFunction() {
    Get.offAll(CreditPrepaidScreen());
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()=> popFunction(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            bottomNavigationBar:
            Responsive.isMobile(context) ? BottomNavBarReceiver(index: 1,) : null,
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
            ],
          ):null,
          body:Responsive.isMobile(context)? TabBarView(
            children: [
              _buildThisWeek(),
              _buildThisWeek(),
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
                      _buildThisWeek(),
                      _buildThisWeek(),
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
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
                      Text('₱ 0',
                          style: TextStyle(
                              color: HexColor('#CEE812'),
                              fontSize: 24,

                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  CircularPercentIndicator(
                    radius: 65,
                    lineWidth: 10,
                    animation: true,
                    percent: 0,
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
                      Text('0.0',
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
            _buildRecentTransaction(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransaction() {
    return Obx(()=>
        Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('Recent Transactions',
            //         style: TextStyle(
            //             fontSize: 20,
            //             fontFamily: 'Sora',
            //             fontWeight: FontWeight.bold)),
            //     InkWell(
            //       onTap: (){
            //         Get.to(paymentviewall());
            //       },
            //       child: Text('View',
            //           style: TextStyle(
            //               fontSize: 16,
            //               fontFamily: 'Sora',
            //               fontWeight: FontWeight.bold)),
            //     )
            //   ],
            // ),s
            SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: pay.transactionList.length,
                  itemBuilder: (context, i) {
                    var item = pay.transactionList[i];
                    return _buildCustomerDetails(item);
                  },
                )


            )

          ],
        ),
    );
  }

  String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';

  Widget _buildCustomerDetails(var item) {
    return InkWell(
      onTap: (){
        Get.to(PaymentsDetails(
            fulldetails: item
        ));
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 50, height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: HexColor('#CEE812'),
                    ),

                    child: Text(getInitials(item["paidto"]),
                        style: TextStyle(
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold,
                            color: HexColor('#036D7B'),
                            fontSize: 16)),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('${item["paidto"]}',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ],
                      ),
                      Text('at ${DateFormat("hh:mm a").format(DateTime.parse(item["transactiondate"]))}',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))
                    ],
                  ),
                ],
              ),
              Image.asset(item["transactiontype"] == "P" ? 'assets/card/up_arrow.png' : 'assets/banner/down_arrow.png', width: 25, height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${item["payamount"]}',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${DateFormat("dd MMM yy").format(DateTime.parse(item["transactiondate"]))}',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
