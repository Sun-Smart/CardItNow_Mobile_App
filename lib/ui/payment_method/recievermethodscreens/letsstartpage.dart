// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cardit/ui/payment_method/recievermethodscreens/credit_prepaid_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../responsive/responsive.dart';

class Letsstartpage extends StatefulWidget {
  const Letsstartpage({Key? key}) : super(key: key);

  @override
  State<Letsstartpage> createState() => _LetsstartpageState();
}

class _LetsstartpageState extends State<Letsstartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              leading: IconButton(
                  onPressed: () {}, icon: Icon(Icons.close, size: 30)),
              foregroundColor: Colors.black,
              backgroundColor: Colors.transparent)
          : null,
      body: Responsive.isMobile(context)
          ? Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset('assets/banner/banner1.png'),
                  SizedBox(height: 50),
                  Text(
                    'Awesome ! You Are ready to \nRecieve Payments',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Sora',
                        color: HexColor('#036D7B'),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'We have verified your business Details. You are \ngood to go with payments now.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Sora',
                        color: HexColor('#041316')),
                  ),
                ],
              ),
            )
          : Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Image.asset("assets/applogo-02.png",
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 3))),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                  onPressed: () {}, icon: Icon(Icons.close, size: 30)),
                        ],
                      ),
                      SizedBox(height: 40,),
                      Container(
                        width:Responsive.isDesktop(context)?MediaQuery.of(context).size.width / 4:
                        MediaQuery.of(context).size.width / 2 ,
                        child: Image.asset('assets/banner/banner1.png')),
                      SizedBox(height: 50),
                      Text(
                        'Awesome ! You Are ready to \nRecieve Payments',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Sora',
                            color: HexColor('#036D7B'),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'We have verified your business Details. You are \ngood to go with payments now.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Sora',
                            color: HexColor('#041316')),
                      ),
                      SizedBox(height: 40,),
                      GestureDetector(
      onTap: () {
          Get.to(() => CreditPrepaidScreen());
        },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: 
             Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width / 4.4
                : MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height * 0.07,
       decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
           'Let’s Start',
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
                )
              ],
            ),
      bottomNavigationBar: Responsive.isMobile(context)?AuthButton(
        onTap: () {
          Get.to(() => CreditPrepaidScreen());
        },
        text: 'Let’s Start',
        decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
      ):null,
    );
  }
}
