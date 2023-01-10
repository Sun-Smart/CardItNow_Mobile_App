import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../responsive/responsive.dart';
import '../../widgets/auth_button.dart';

class PaymentOverview extends StatefulWidget {
  const PaymentOverview({super.key});

  @override
  State<PaymentOverview> createState() => _PaymentOverviewState();
}

class _PaymentOverviewState extends State<PaymentOverview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: buildButton(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: AppBar(
              leading: BackButton(
                color: Colors.black,
              ),
              centerTitle: true,
              title: Text(
                'Payment Overview',
                style: TextStyle(
                    color: 
                         Color(0Xff1B1B1B),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bulildcard(),
            bulildPaymentsDetails()
            ],
        ),
      ),
    ));
  }
   Widget bulildcard() {
  //  final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Apply for Loan',
            style: TextStyle(
                color:
            
                   Color.fromARGB(255, 140, 140, 140),
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            leading:  ClipOval(
            child: Image.asset("assets/user-img.png",
            fit: BoxFit.cover,
            width: 45.0,
            height: 45.0,
            )
            ),
            title: Text(
              'Angelo',
              style: TextStyle(
                  color:
                      //themeChange.darkTheme ? Colors.white :
                       Color(0Xff000000),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'MID - 23344565',
              style: TextStyle(
                  color:  Color.fromARGB(255, 140, 140, 140),
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
  Widget bulildPaymentsDetails() {
    return Container(
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
          'Total Amount Pay',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '₱ 4120',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Service changes(3%)',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              '₱ 4000',
              style: TextStyle(
                  color: Color(0XffCEE812),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
             Text(
              '+',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
             Text(
              '₱ 120',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'For Amilyar on 23 December\n 2022',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
       
        SizedBox(
          height: 30,
        ),
        Text(
          'TXN ID: 45879652',
          style: TextStyle(
              color: Color(0XffFFFFFF),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
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
 
  Widget buildButton() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SwipeButton(
          width: Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width / 1
              : Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width / 4.4
                  : MediaQuery.of(context).size.width / 2.5,
          activeThumbColor: const Color(0XFFCEE812),
          thumbPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          borderRadius: BorderRadius.circular(3),
          activeTrackColor: const Color(0XFF004751),
          height: 60,
          child: const Text("Swipe to Apply",
              style: TextStyle(
                  fontFamily: "assets/fonts/Sora.ttf",
                  fontSize: 16,
                  color: Color(0XFFCEE812))),
          onSwipe: () {
            Navigator.of(context).pushNamed('/paymentsuccess');
          }),
    );
  }

  }