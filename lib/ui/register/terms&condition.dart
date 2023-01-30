// ignore_for_file: camel_case_types, sized_box_for_whitespace, prefer_const_constructors

import 'package:cardit/auth/auth.dart';
import 'package:cardit/ui/register/congratsscreen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../themes/theme_notifier.dart';
import '../payment_method/choose_payment_method.dart';

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
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 20, bottom: 0),
                      // margin: EdgeInsets.only(top: 40),
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
            child:
                // ListView.builder(
                //     itemCount:1,
                //     itemBuilder: (BuildContext context, int index) {
                //       return
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("1.Clause",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black)),
                SizedBox(height: 15),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(con.termscond.toString(),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontFamily: 'sora'))),
                SizedBox(height: 20),
              ],
            ))
        // }),
        // ),
        );
  }

  Widget buildToptitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back,
                color: themeChange.darkTheme ? Colors.white : Colors.black,
                size: 30),
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
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        onTap: () {
          if (GetStorage().read('save_token') == null) {
            Get.to(congratesscreen());
          } else {
            Get.to(congratesscreen());
          }
        },
        text: "Done");
  }

  Widget buildtitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        'Terms & Conditions',
        style: TextStyle(
          fontSize: 28,
          color: themeChange.darkTheme ? Colors.white : HexColor('#004751'),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
