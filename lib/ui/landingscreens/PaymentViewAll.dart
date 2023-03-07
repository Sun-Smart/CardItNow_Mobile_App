import 'package:cardit/api/payment_api.dart';
import 'package:cardit/ui/landingscreens/payments_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

class paymentviewall extends StatefulWidget {
  const paymentviewall({Key? key}) : super(key: key);

  @override
  State<paymentviewall> createState() => _paymentviewallState();
}

class _paymentviewallState extends State<paymentviewall> {
  PaymentAPI pay = PaymentAPI();
  @override
  void initState() {
      pay.transactionListAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        centerTitle: true,
        title: const Text("Your Transactions",

          style: TextStyle(
          fontSize: 18, fontFamily: "Sora",color: Color(0Xff004751),fontWeight: FontWeight.bold
        ),),
      ),
      body:  Obx(()=>
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: pay.transactionList.length,
            itemBuilder: (BuildContext context, int index) {
              var item = pay.transactionList[index];
              return InkWell(
                onTap: (){

                  Get.to(PaymentsDetails(
                      fulldetails: pay.transactionList[index]

                  ));
                },
                child:  MyApp.logindetails["customertype"] == "I"
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0XffE2E5E5), width: 1.5),
                    ),
                    // padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15),
                          padding: const EdgeInsets.all(15),
                          color: const Color(0Xff004751),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${pay.transactionList[index]["payamount"].toString()}",
                                      style: const TextStyle(
                                        color: Color(0XffCEE812),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(pay.transactionList[index]["purpose"],
                                      style: const TextStyle(
                                          color: Color(0Xffffffff), fontSize: 11,fontWeight: FontWeight.bold))
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Paid to ${pay.transactionList[index]["paidto"]}",
                                        style: const TextStyle(
                                            color: Color(0Xffffffff), fontSize: 14),
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
                                  Text(pay.transactionList[index]["transactiondate"].toString() ,
                                      style: const TextStyle(
                                          color: Color(0Xffffffff), fontSize: 12,fontWeight: FontWeight.bold)),

                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ))
                 : Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: _buildCustomerDetails(item),
                 )
              );
            }),
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
