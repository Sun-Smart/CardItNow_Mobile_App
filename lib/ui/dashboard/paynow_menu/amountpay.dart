import 'package:cardit/auth/auth.dart';
import 'package:cardit/ui/dashboard/paynow_menu/payment_purpose.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../responsive/responsive.dart';

class AmountPay extends StatefulWidget {
  const AmountPay({super.key});

  @override
  State<AmountPay> createState() => _AmountPayState();
}

class _AmountPayState extends State<AmountPay> {
  //var item = ['Pay now', 'Schedule '];
  String? dropdownvalue;
  TextEditingController _controller = TextEditingController();
  final AuthCon con = Get.find();
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
                // mainAxisAlignment: MainAxisAlignment.start,
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
                  //  Text(con.invoicejson["Rent"].toString())
                  // Text(
                  //   (int.parse("Invoice No. ${con.invoicejson["Amount"]}")
                  //       .toString()),

                  //   style: TextStyle(
                  //       fontStyle: FontStyle.normal,
                  //       fontSize: 15,
                  //       color: HexColor('#2C3A4B'),
                  //       fontWeight: FontWeight.w400,
                  //       fontFamily: "Sora"),
                  // ),
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
    //final themeChange = Provider.of<DarkThemeProvider>(context);
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
              //  SizedBox(width: MediaQuery.of(context).size.width/8),
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
                    //     TextFormField(

                    //   style: TextStyle(fontSize: 30),
                    //   controller: _controller,
                    //   keyboardType: TextInputType.number,
                    //   inputFormatters: <TextInputFormatter>[
                    //     FilteringTextInputFormatter.digitsOnly
                    //   ],
                    //   decoration: InputDecoration(
                    //     border: InputBorder.none,

                    //     contentPadding: EdgeInsets.all(10),
                    //   ),
                    // )
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
              //  SizedBox(width: MediaQuery.of(context).size.width/8),
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
                    //     TextFormField(

                    //   style: TextStyle(fontSize: 30),
                    //   controller: _controller,
                    //   keyboardType: TextInputType.number,
                    //   inputFormatters: <TextInputFormatter>[
                    //     FilteringTextInputFormatter.digitsOnly
                    //   ],
                    //   decoration: InputDecoration(
                    //     border: InputBorder.none,

                    //     contentPadding: EdgeInsets.all(10),
                    //   ),
                    // )
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
