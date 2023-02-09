import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/widgets/drawer_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/auth_button.dart';

class PaymentSuccessful extends StatefulWidget {
  const PaymentSuccessful({super.key});

  @override
  State<PaymentSuccessful> createState() => _PaymentSuccessfulState();
}

class _PaymentSuccessfulState extends State<PaymentSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            Responsive.isMobile(context) ? bulildbutton() : null,
        backgroundColor: HexColor('#004751'),
        appBar: Responsive.isMobile(context)
            ? AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                              Navigator.pop(context);
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
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                            color: Colors.white),
                      ],
                    ),
                    buildimage()
                  ]));
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
              Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: Text(
                    "Your payment with ID 1321324 is completed on 23 December 2022",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15, color: Colors.white.withOpacity(0.6)),
                  )),
              SizedBox(height: MediaQuery.of(context).size.width / 1.5),
              Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: Text(
                    "Check your email for confirmation and Connect with your Recipient for delivery of product",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15, color: Colors.white.withOpacity(0.6)),
                  )),
              //git push
            ],
          )
        : Responsive.isDesktop(context)
            ? Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
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
                  Container(
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: Text(
                        "Your payment with ID 1321324 is completed on 23 December 2022",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, color: Colors.white.withOpacity(0.6)),
                      )),
                  SizedBox(height: MediaQuery.of(context).size.width / 6),
                  Container(
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: Text(
                        "Check your email for confirmation and Connect with your Recipient\n for delivery of product",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 15, color: Colors.white.withOpacity(0.6)),
                      )),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                   Get.to(DrawerWeb());

                      // showAlertDialog(context);
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
                  Container(
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: Text(
                        "Your payment with ID 1321324 is completed on 23 December 2022",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, color: Colors.white.withOpacity(0.6)),
                      )),
                  SizedBox(height: MediaQuery.of(context).size.width / 5),
                  Container(
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: Text(
                        "Check your email for confirmation and Connect with your Recipient\n for delivery of product",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 15, color: Colors.white.withOpacity(0.6)),
                      )),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                     Get.to(DrawerWeb());

                      // showAlertDialog(context);
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
        Navigator.of(context).pushNamed('/dashbordScreen');

        // showAlertDialog(context);
      },
      text: "Go to dashboard",
    );
  }
}
