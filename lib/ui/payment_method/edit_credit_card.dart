// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, avoid_print

import 'package:cardit/const/responsive.dart';
import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/widgets/drawer_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../api/regster_api.dart';
import '../../widgets/auth_button.dart';

class EditCard extends StatefulWidget {
  const EditCard({Key? key}) : super(key: key);

  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  final RegisterAPI con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading:
              Icon(Icons.arrow_back_outlined, size: 25, color: Colors.black),
          centerTitle: true,
          title: Text('Manage Cards',
              style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold))),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AuthButton(
        decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        onTap: () {
          if(Responsive.isMobile(context)){
            Get.to(const DashbordScreen());
          }else{
              Get.to(const DrawerWeb());
          }
          
        },
        text: "Let's Start Payments",
      ),
    );
  }
}

class CustomeCardData extends StatelessWidget {
  final String bankName, cardNumber, nameHolder, validity;

  const CustomeCardData(
      {Key? key,
      required this.bankName,
      required this.cardNumber,
      required this.nameHolder,
      required this.validity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 230,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/card/card.png'))),
          child: Stack(
            children: [
              Positioned(
                  left: 32,
                  top: 35,
                  child: Text(bankName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Sora'))),
              Positioned(
                  left: 32,
                  bottom: 100,
                  child: Text(nameHolder,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Sora'))),
              Positioned(
                  right: 25,
                  bottom: 100,
                  child: Text('xxxx xxxx xxxx ${cardNumber.substring(12, 16)}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: 'Sora'))),
              Positioned(
                  left: 65,
                  bottom: 27,
                  child: Text('${validity.substring(0, 10)}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: 'Sora'))),
              Positioned(
                  right: 35,
                  bottom: 28,
                  child: Image.asset('assets/card/visa.png',
                      width: 35, height: 20)),
            ],
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.mode_edit_outline_outlined, size: 18),
            SizedBox(width: 3),
            GestureDetector(
              child: Text('Edit Card',
                  style: TextStyle(
                      fontFamily: 'Sora', fontSize: 14, color: Colors.black)),
              onTap: () {
              },
            ),
          ],
        ),
      ],
    );
  }
}
