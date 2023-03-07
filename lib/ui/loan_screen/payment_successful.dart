import 'package:cardit/const/responsive.dart';
import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/widgets/drawer_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import '../../main.dart';
import '../../widgets/auth_button.dart';
import '../payment_method/recievermethodscreens/credit_prepaid_screen.dart';

class PaymentSuccessful extends StatefulWidget {
  var paymentType;
  var payee;
  var purpose;
  var payment;
  var transaction;
   PaymentSuccessful({super.key, this.paymentType,this.payee, this.purpose, this.payment, this.transaction});

  @override
  State<PaymentSuccessful> createState() => _PaymentSuccessfulState();
}

class _PaymentSuccessfulState extends State<PaymentSuccessful> {

  Future<bool> _willPopCallback() async {
    if(Responsive.isMobile(context)){
      if(MyApp.logindetails["customertype"] == "I"){
        Get.offAll(DashbordScreen());
      }
      else{
        Get.offAll(CreditPrepaidScreen());
      }
    } else{
      Get.offAll(DrawerWeb());
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop:() => _willPopCallback(),

      child: Scaffold(
          bottomNavigationBar:
              Responsive.isMobile(context) ? bulildbutton() : null,
          backgroundColor: HexColor('#004751'),
          appBar: Responsive.isMobile(context)
              ? AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                      onPressed: () {
                        if(MyApp.logindetails["customertype"] == "I"){
                          Get.offAll(DashbordScreen());
                        }
                        else{
                          Get.offAll(CreditPrepaidScreen());
                        }
                      },
                      icon: Icon(Icons.close),
                      color: Colors.white))
              : null,
          body: Responsive.isMobile(context)
              ? Column(
                  children: [buildimage()],
                )
              : Responsive.isDesktop(context)
                  ? Column(children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.offAll(DrawerWeb());
                              },
                              icon: Icon(Icons.close),
                              color: Colors.white),
                        ],
                      ),
                      buildimage()
                    ])
                  : Column(children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.offAll(DrawerWeb());
                              },
                              icon: Icon(Icons.close),
                              color: Colors.white),
                        ],
                      ),
                      buildimage()
                    ])),
    );
  }

  Widget buildimage() {
    return Responsive.isMobile(context)
        ? Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.width / 4),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: ClipOval(
                      child: Image.asset(
                    "assets/profile.png",
                    fit: BoxFit.cover,
                    width: 70.0,
                    height: 70.0,
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Payment Successfull ! ",
                style: TextStyle(
                  fontSize: 15,
                  color: HexColor('#CEE812'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  "Your payment to ${widget.purpose["KEYVALUE"]["Declared Owner"] ?? ""} with TXN ID - ${widget.transaction["transactionid"]} is completed on ${DateFormat("dd-MM-yyyy").format(DateTime.now())}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15, color: Colors.white.withOpacity(0.6)),
                ),
              ),

              //git push
            ],
          )
        : Responsive.isDesktop(context)
            ? Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //SizedBox(height: MediaQuery.of(context).size.width/10),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: ClipOval(
                          child: Image.asset(
                        "assets/profile.png",
                        fit: BoxFit.cover,
                        width: 70.0,
                        height: 70.0,
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Payment Successfull ! ",
                    style: TextStyle(
                      fontSize: 15,
                      color: HexColor('#CEE812'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Container(
                        margin: EdgeInsets.only(left: 40, right: 40),
                        child: Text(
                          "Your payment to ${widget.purpose["KEYVALUE"]["Declared Owner"] ?? ""} with TXN ID - ${widget.transaction["transactionid"]} is completed on ${DateFormat("dd-MM-yyyy").format(DateTime.now())}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, color: Colors.white.withOpacity(0.6)),
                        )),
                  ),

                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                   Get.offAll(DrawerWeb());

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
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Go to dashboard",
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

                  //git push
                ],
              )
            : Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: ClipOval(
                          child: Image.asset(
                        "assets/profile.png",
                        fit: BoxFit.cover,
                        width: 70.0,
                        height: 70.0,
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Payment Successfull ! ",
                    style: TextStyle(
                      fontSize: 15,
                      color: HexColor('#CEE812'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Container(
                        margin: EdgeInsets.only(left: 40, right: 40),
                        child: Text(
                          "Your payment to ${widget.purpose["KEYVALUE"]["Declared Owner"] ?? ""} with TXN ID - ${widget.transaction["transactionid"]} is completed on ${DateFormat("dd-MM-yyyy").format(DateTime.now())}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, color: Colors.white.withOpacity(0.6)),
                        )),
                  ),

                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                     Get.offAll(DrawerWeb());
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
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Go to dashboard",
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

                  //git push
                ],
              );
  }

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        if(MyApp.logindetails["customertype"] == "I"){
          Get.offAll(DashbordScreen());
        }
        else{
          Get.offAll(CreditPrepaidScreen());
        }
      },
      text: "Go to dashboard",
    );
  }
}
