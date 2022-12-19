import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';

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
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: bulildbutton(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: AppBar(
              leading: const BackButton(
                color: Colors.black,
              ),
              centerTitle: true,
              title: const Text(
                'Transaction Overview',
                style: TextStyle(
                    color: Color(0Xff1B1B1B),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [bulildcard(), bulildPaymentsDetails()],
        ),
      ),
    ));
  }

  Widget bulildcard() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Paying',
            style: TextStyle(
                color: Color.fromARGB(255, 140, 140, 140),
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
            title: const Text(
              'San Nicolas',
              style: TextStyle(
                  color: Color(0Xff000000),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              'MID - 23344565',
              style: TextStyle(
                  color: Color.fromARGB(255, 140, 140, 140),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
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
      onTap: () {},
      text: "Contact Support",
    );
  }
}
