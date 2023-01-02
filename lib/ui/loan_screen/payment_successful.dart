import 'package:flutter/material.dart';
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
      bottomNavigationBar: bulildbutton(),
  
          backgroundColor: HexColor('#004751'),
           appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
              color: Colors.white)),
body: Column(
  children: [
    buildimage()
  ],
),
    );
  }

  Widget buildimage(){
    return Column(
     // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.width/4),
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50,
            child: ClipOval(
                child: Image.asset("assets/profile.png",
                fit: BoxFit.cover,
                width: 70.0,
                height: 70.0,
                )
                ),
          ),
        ),
        SizedBox(height: 20,),
        Text("Payment Successfull ! ",
        style: TextStyle(
          fontSize: 15,
           color: HexColor('#CEE812'),
        ),),
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.only(left: 40,right: 40),
          child: Text("Your payment with ID 1321324 is completed on 23 December 2022",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white.withOpacity(0.6)
          ),)),
          SizedBox(height:MediaQuery.of(context).size.width/1.5),
           Container(
          margin: EdgeInsets.only(left: 40,right: 40),
          child: Text("Check your email for confirmation and Connect with your Recipient for delivery of product",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white.withOpacity(0.6)
          ),)),
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
         Navigator.of(context).pushNamed(
      '/dashbordScreen'
       );
      
       // showAlertDialog(context);
      },
      text: "Go to dashboard",
    );
  }
}