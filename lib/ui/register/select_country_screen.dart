// ignore_for_file: prefer_const_declarations, prefer_const_constructors, avoid_print, avoid_unnecessary_containers

import 'package:cardit/auth/auth.dart';
import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/ui/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Selectcountry extends StatefulWidget {
  const Selectcountry({Key? key}) : super(key: key);

  @override
  State<Selectcountry> createState() => _SelectcountryState();
}

class _SelectcountryState extends State<Selectcountry> {
  var type = '';

  var country = [
    {"img": 'assets/newlogo.png', "type": 'Philippines'},
    {"img": 'assets/newuae.png', "type": 'UAE'},
  ];
  final AuthCon con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: Responsive.isMobile(context)
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Container(
              // color: Styles.colorBackgroundBlock,
              child: Column(
                  crossAxisAlignment: Responsive.isMobile(context)
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                Container(
                    padding: EdgeInsets.only(top: 0, bottom: 30),
                    margin: EdgeInsets.only(top: 24),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/loginbg.png"),
                            fit: Responsive.isMobile(context)
                                ? BoxFit.cover
                                : BoxFit.fill)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          buildToptitle(),
                          buildtitle(),
                        ])),
              ])),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: Responsive.isMobile(context)
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Text("Select Your Country",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#004751'))),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width / 1
                : Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 4.3
                    : MediaQuery.of(context).size.width / 2.5,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                itemCount: country.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          type = country[index]['type']!;
                          print(type);
                          if (type == 'UAE') {
                            con.isUAE.value = true;
                          } else {
                            con.isUAE.value = false;
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(80, 20, 80, 20),
                        child: Card(
                          elevation: 0,
                          color: type == country[index]['type']
                              ? HexColor('#CEE812')
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Column(
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 10),
                                  Image.asset(country[index]['img']!,
                                      width: Responsive.isMobile(context)
                                          ? 100
                                          : 50,
                                      height: Responsive.isMobile(context)
                                          ? 100
                                          : 50),
                                  const SizedBox(height: 10),
                                  Text(country[index]['type']!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const Spacer(),
          if (type != '')
            Container(
              width: Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width / 1
                  : Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 4.3
                      : MediaQuery.of(context).size.width / 2.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: Responsive.isMobile(context)
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 55,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: HexColor('#CEE812'),
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Get.to(Register());
                          },
                          child: Text(
                            "CONFIRM",
                            style: TextStyle(
                              fontFamily: 'ProductSans',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: HexColor('#004751'),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          //const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget buildToptitle() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        mainAxisAlignment: Responsive.isMobile(context)
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.close, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container()
        ]);
  }

  Widget buildtitle() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        padding: const EdgeInsets.all(15),
        child: Row(
            mainAxisAlignment: Responsive.isMobile(context)
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text(
                    'Join ',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  Image.asset("assets/carditlogo.png", width: 100),
                ],
              ),
            ]));
  }
}
