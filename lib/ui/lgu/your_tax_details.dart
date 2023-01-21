// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/auth_button.dart';

class YourTaxDetails extends StatefulWidget {
  const YourTaxDetails({Key? key}) : super(key: key);

  @override
  State<YourTaxDetails> createState() => _YourTaxDetailsState();
}

class _YourTaxDetailsState extends State<YourTaxDetails> {
  TextEditingController paymentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text('Your Tax Details',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Sora',
                  color: Colors.black,
                  fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Property Owner',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text('Rita Ganes',
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Text('Property Address',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text('34 Data, Quezon City, 1113 Metro Manila, Philippines',
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Text('Tax Assessment Value',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text("₱ 20,000",
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Text('Market Value',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text("₱ 40,000",
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Text('Assesment Period',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text("2 Years",
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Text('Tax Declaration Number',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text("232342545345",
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Text('Property Identification Number',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text("232342545345",
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Text('NA Number',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text("34345345345",
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Text('Assessment Date',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text("1st January 2022",
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: TextFormField(
                            controller: paymentController,
                            decoration: InputDecoration(
                                hintText: 'Enter How Much you want to pay',
                                hintStyle: TextStyle(
                                    fontFamily: 'Sora', fontSize: 14)))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AuthButton(
          decoration: BoxDecoration(
              color: HexColor('#CEE812'),
              borderRadius: BorderRadius.circular(5)),
          onTap: () {},
          text: "Agree and Proceed"),
    );
  }
}
