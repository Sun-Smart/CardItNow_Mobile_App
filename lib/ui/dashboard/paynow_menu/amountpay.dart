
import 'package:cardit/ui/dashboard/paynow_menu/payment_purpose.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../api/regster_api.dart';
import '../../../const/responsive.dart';

class AmountPay extends StatefulWidget {
  const AmountPay({super.key});

  @override
  State<AmountPay> createState() => _AmountPayState();
}

class _AmountPayState extends State<AmountPay> {
  String? dropdownvalue;
  final RegisterAPI con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Responsive.isMobile(context)?bulildbutton():null,
      appBar:Responsive.isMobile(context)? PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: AppBar(
            leading: BackButton(
              color: Colors.black,
            ),
            centerTitle: true,
            title: Text(
              'Enter Amount to Pay',
              style: TextStyle(
                  fontFamily: 'Sora',
                  color: HexColor('#413D4B'),
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ):null,
      body: Responsive.isMobile(context)?Column(
        children: [user_mid()],
      ):Row(
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
          Text(
              'Enter Amount to Pay',
              style: TextStyle(
                  fontFamily: 'Sora',
                  color: HexColor('#413D4B'),
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          user_mid()],
                    )
        
      ),
    ]));
  }

  // ignore: non_constant_identifier_names
  Widget user_mid() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Row(
            children: [
              SizedBox(
                width: 50,
              ),
              ClipOval(
                  child: Image.asset(
                "assets/user-img.png",
                fit: BoxFit.cover,
                width: 50.0,
                height: 50.0,
              )),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Paying Angelo",
                    style: TextStyle(
                        fontSize: 14,
                        color: HexColor('#000000'),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Sora"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        bulidForm()
      ],
    );
  }

  Widget bulidForm() {
    return Responsive.isMobile(context)? Container(
        child: Form(
            // key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "₱",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Container(
                    margin: EdgeInsets.only(right: 30),
                    // color: Colors.green,
                    child: Text(
                      con.invoicejson["Rent"]??'',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40),
                    )
                    ),
              ),
            ],
          ),
       
    
        ]))):Container(
        child: Form(
            // key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "₱",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Container(
                    margin: EdgeInsets.only(right: 30),
                    // color: Colors.green,
                    child: Text(
                      con.invoicejson["Rent"]??'',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40),
                    )
                    ),
              ),
            ],
            ),
               SizedBox(height: 100,),
       GestureDetector(
     onTap: () {
        Get.to(PaymentPurpose());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width:Responsive.isDesktop(context)?
                 MediaQuery.of(context).size.width / 4.4:  MediaQuery.of(context).size.width / 3,
              
        height: MediaQuery.of(context).size.height * 0.07,
       decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
        child: Center(
          child: Text(
          "Done",
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
 
            ]
            )));
   
  }

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        Get.to(PaymentPurpose());
      },
      text: "Done",
    );
  }
}
