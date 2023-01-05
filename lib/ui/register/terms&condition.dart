// ignore_for_file: camel_case_types

import 'package:cardit/auth/auth.dart';
import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../themes/theme_notifier.dart';

class termsandconditions extends StatefulWidget {
  const termsandconditions({Key? key}) : super(key: key);

  @override
  State<termsandconditions> createState() => _termsandconditionsState();
}

class _termsandconditionsState extends State<termsandconditions> {
  final AuthCon con = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bulildbutton(),
        body: Container(
            height: MediaQuery.of(context).size.height / 0.8,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 20, bottom: 0),
                      margin: EdgeInsets.only(top: 40),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildToptitle(),
                            buildtitle(),
                          ])),
                  bulidForm(),
                  SizedBox(height: 30)
                ],
              ),
            )),
      ),
    );
  }

  Widget bulidForm() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height / 1,
        width: MediaQuery.of(context).size.width / 1,
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1.Clause",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                     con.termscond["label"].toString(),

                   // "Customer shall pay for all Products delivered or date services performed within 30 days from the date of Supplier’s invoice. Payment shall be deemed to have been made when a check is received by Supplier or payment is received by an electronic transfer in Supplier’s bank account. Supplier reserves the right to assess interest on any late payments from the date due until receipt of payment in full at the lesser of (a) one and one-half percent per month compounded monthly, or (b) the maximum rate permitted by law, and to charge Customer for any collection or litigation expenses, including reasonable attorney’s fees incurred by Supplier in the collection of late payment.",

                    style: TextStyle(
                        fontSize: 16, color: Colors.grey, fontFamily: 'sora'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            }),
      ),
    );
  }

  Widget buildToptitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: themeChange.darkTheme ? Colors.white : Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container()
        ]);
  }

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        Get.to(() => DashbordScreen());
      },
      text: "Done",
    );
  }

  Widget buildtitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        'Terms of Use',
        style: TextStyle(
          fontSize: 28,
          color: themeChange.darkTheme ? Colors.white : HexColor('#004751'),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
