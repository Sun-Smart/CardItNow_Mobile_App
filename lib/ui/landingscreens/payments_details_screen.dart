import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../responsive/responsive.dart';
import '../../themes/theme_notifier.dart';
import '../../widgets/auth_button.dart';

class PaymentsDetails extends StatefulWidget {
  const PaymentsDetails({Key? key}) : super(key: key);

  @override
  State<PaymentsDetails> createState() => _PaymentsDetailsState();
}

class _PaymentsDetailsState extends State<PaymentsDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Responsive.isMobile(context)?bulildbutton():null,
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
      ): Responsive.isDesktop(context)?SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [bulildcard(), bulildPaymentsDetails(),
          SizedBox(height: 50,),
          GestureDetector(
      onTap: (){},
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
      ): Container(
        width: MediaQuery.of(context).size.width/2.5,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [bulildcard(), bulildPaymentsDetails(),
            SizedBox(height: 50,),
            GestureDetector(
        onTap: (){},
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
    ));
  }

  Widget bulildcard() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Responsive.isMobile(context)?Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Paying',
            style: TextStyle(
                color: themeChange.darkTheme
                    ? Colors.white
                    : Color.fromARGB(255, 140, 140, 140),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
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
              'San Nicolas',
              style: TextStyle(
                  color:
                      themeChange.darkTheme ? Colors.white : Color(0Xff000000),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'MID - 23344565',
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
          Text(
            'Paying',
            style: TextStyle(
                color: themeChange.darkTheme
                    ? Colors.white
                    : Color.fromARGB(255, 140, 140, 140),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
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
              'San Nicolas',
              style: TextStyle(
                  color:
                      themeChange.darkTheme ? Colors.white : Color(0Xff000000),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'MID - 23344565',
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
          '₱ 4000',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'LGU Discount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '₱ 0',
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
          '₱ 4000',
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
          '₱ 4000 + ₱ 80 = ₱ 4080',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 12,
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
          '₱ 4000',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'LGU Discount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '₱ 0',
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
          '₱ 4000',
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
          '₱ 4000 + ₱ 80 = ₱ 4080',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 12,
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

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {},
      text: "Contact Support",
    );
  }
}
