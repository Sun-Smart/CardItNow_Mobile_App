import 'package:cardit/api/payment_api.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../const/responsive.dart';
import '../../themes/theme_notifier.dart';
import '../../widgets/auth_button.dart';

class PaymentsDetails extends StatefulWidget {
  final fulldetails;
   PaymentsDetails({Key? key,this.fulldetails}) : super(key: key);

  @override
  State<PaymentsDetails> createState() => _PaymentsDetailsState();
}

class _PaymentsDetailsState extends State<PaymentsDetails> {
  PaymentAPI pay = PaymentAPI();

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Responsive.isMobile(context)?bulildbutton(widget.fulldetails):null,
      appBar: Responsive.isMobile(context)? PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: AppBar(
              leading: BackButton(
                color: themeChange.darkTheme ? Colors.white : Colors.black,
              ),
              centerTitle: true,
              title: Text(
                'Transaction Overview',
                style: TextStyle(
                    color: themeChange.darkTheme
                        ? Colors.white
                        : Color(0Xff1B1B1B),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ):null,
      body: Responsive.isMobile(context)?SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [bulildcard(), bulildPaymentsDetails()],
        ),
      ): Responsive.isDesktop(context)?
      Row(
        children: [
        Container(
                    width: MediaQuery.of(context).size.width / 3,
                   // height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/logoweb.png",
                            width: 150, height: 90),
                        SizedBox(height: 15),
                        Text(
                          '"Make your life simple"',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'sora'),
                        ),
                      ],
                    )),
                  ),
          Container(
              width: MediaQuery.of(context).size.width / 1.5,
            
            child: SingleChildScrollView(
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
                  'Transaction Overview',
                  style: TextStyle(
                      color: themeChange.darkTheme
                          ? Colors.white
                          : Color(0Xff1B1B1B),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                  bulildcard(), bulildPaymentsDetails(),
                SizedBox(height: 50,),
                GestureDetector(
            onTap: (){
              mailFunction(widget.fulldetails);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              width: 
                  
                       MediaQuery.of(context).size.width / 4,
                      
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
              color: HexColor('#CEE812'),
              borderRadius: BorderRadius.circular(5),
            ),
              child: Center(
                child: Text(
                 "Contact Support",
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
        ],
      ): Row(
        children: [
           Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      // height: MediaQuery.of(context).size.width / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/logoweb.png",
                              width: 150, height: 90),
                          SizedBox(height: 15),
                          Text(
                            '"Make your life simple"',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'sora'),
                          ),
                        ],
                      )),
                    ),
          Container(
            width: MediaQuery.of(context).size.width/2,
            child: SingleChildScrollView(
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
            BackButton(
                color: Colors.black,
              )
                    ],
                  ),
                  Text(
                'Transaction Overview',
                style: TextStyle(
                    color: themeChange.darkTheme
                        ? Colors.white
                        : Color(0Xff1B1B1B),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
                  bulildcard(),
                   bulildPaymentsDetails(),
                SizedBox(height: 50,),
                GestureDetector(
            onTap: (){
              mailFunction(widget.fulldetails);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              width: 
                    MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
              color: HexColor('#CEE812'),
              borderRadius: BorderRadius.circular(5),
            ),
              child: Center(
                child: Text(
                 "Contact Support",
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
        ],
      ),
    ));
  }

  Widget bulildcard() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Responsive.isMobile(context)?Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Paying',
          //   style: TextStyle(
          //       color: themeChange.darkTheme
          //           ? Colors.white
          //           : Color.fromARGB(255, 140, 140, 140),
          //       fontSize: 14,
          //       fontWeight: FontWeight.bold),
          // ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/logouser.png",
                width: 43,
                height: 43,
              ),
            ),
            title: Text(
              widget.fulldetails["paidto"].toString(),
              style: TextStyle(
                  color:
                      themeChange.darkTheme ? Colors.white : Color(0Xff000000),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              widget.fulldetails["uid"].toString(),
              style: TextStyle(
                  color: themeChange.darkTheme
                      ? Colors.white
                      : Color.fromARGB(255, 140, 140, 140),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ):Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Paying',
          //   style: TextStyle(
          //       color: themeChange.darkTheme
          //           ? Colors.white
          //           : Color.fromARGB(255, 140, 140, 140),
          //       fontSize: 14,
          //       fontWeight: FontWeight.bold),
          // ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/logouser.png",
                width: 43,
                height: 43,
              ),
            ),
            title: Text(
              widget.fulldetails["paidto"].toString(),
              style: TextStyle(
                  color:
                      themeChange.darkTheme ? Colors.white : Color(0Xff000000),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              widget.fulldetails["uid"].toString(),
              style: TextStyle(
                  color: themeChange.darkTheme
                      ? Colors.white
                      : Color.fromARGB(255, 140, 140, 140),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget bulildPaymentsDetails() {
    return  Responsive.isMobile(context)?Container(
      width: MediaQuery.of(context).size.width / 1,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/paymentdetails.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Total Amount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
         "${widget.fulldetails["payamount"].toString()}",
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Discount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "${widget.fulldetails["discount"].toString()}",

          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Amount After Discount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          widget.fulldetails["payamount"].toString(),
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Net Payable Amount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "${widget.fulldetails["contractamount"].toString()} +  ${widget.fulldetails["carditconvfee"].toString()} = ${widget.fulldetails["payamount"].toString()}",
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        // Text(
        //   'TXN ID: 45879652',
        //   style: TextStyle(
        //       color: Color(0XffFFFFFF),
        //       fontSize: 10,
        //       fontWeight: FontWeight.bold),
        // ),
        SizedBox(
          height: 10,
        ),
        Text(
          'View Invoice',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
      ]),
    ):Container(
      width: Responsive.isDesktop(context)?MediaQuery.of(context).size.width / 4:MediaQuery.of(context).size.width / 2,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/paymentdetails.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Total Amount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "${widget.fulldetails["payamount"].toString()}",
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Discount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "${widget.fulldetails["discount"].toString()}",
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Amount After Discount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          widget.fulldetails["payamount"].toString(),
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Net Payable Amount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
            "${widget.fulldetails["contractamount"].toString()} +  ${widget.fulldetails["carditconvfee"].toString()} = ${widget.fulldetails["payamount"].toString()}",
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        // Text(
        //   'TXN ID: 45879652',
        //   style: TextStyle(
        //       color: Color(0XffFFFFFF),
        //       fontSize: 10,
        //       fontWeight: FontWeight.bold),
        // ),
        SizedBox(
          height: 10,
        ),
        Text(
          'View Invoice',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
      ]),
    );
  }

  Widget bulildbutton(var item) {
    return AuthButton(
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: ()  {
        mailFunction(item);
      },
      text: "Contact Support",
    );
  }

  mailFunction(var item) async{
    var mailURL = Uri.parse("mailto:pingme@carditnow.com?subject=${item["txnid"]}&body=");
    if (!await launchUrl(mailURL)) {
    throw Exception('Could not launch $mailURL');
    }
  }
}
