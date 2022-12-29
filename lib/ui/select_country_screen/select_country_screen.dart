// ignore_for_file: prefer_const_declarations, prefer_const_constructors, avoid_print

import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/ui/home_screen/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

var type = '';
var countrytype = ['assets/newlogo.png', 'assets/newuae.png'];
var countryname = ['Philippines', 'UAE'];
var philipineData = ['Passport', 'Driving Licence', 'National ID', 'UMID'];
var uaeData = ['UAE Number'];
final philipine = 'philipine Data';
final uae = 'UAE Data';
bool country = false;
var isphilipines;

class Selectcountry extends StatefulWidget {
  const Selectcountry({Key? key}) : super(key: key);

  @override
  State<Selectcountry> createState() => _SelectcountryState();
}

class _SelectcountryState extends State<Selectcountry> {
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
                    padding: EdgeInsets.only(top: 10, bottom: 30),
                    margin: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/loginbg.png"),
                        fit: Responsive.isMobile(context)
                            ? BoxFit.cover
                            : BoxFit.fill,
                      ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildToptitle(),
                          buildtitle(),
                        ])),
              ])),
          Container(
            margin: const EdgeInsets.all(15),
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
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              itemCount: countrytype.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      country == isphilipines ? true : false;
                      print(country);
                      isphilipines;
                      print(isphilipines);
                      type = countrytype[index];
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(80, 20, 80, 20),
                    child: Card(
                      color: type == countrytype[index]
                          ? HexColor('#CEE812')
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Image.asset(countrytype[index],
                                  width: 100, height: 100),
                              SizedBox(height: 10),
                              Text(countryname[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              SizedBox(height: 10),
                            ],
                          ),
                        ],
                      )),
                    ),
                  ),
                );
              }),
          const Spacer(),
          if (type != '')
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 55,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: HexColor('#CEE812'),
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          if (type == countrytype[0]) {
                            Get.to(Register(value: philipineData));
                          } else if (type == countrytype[1]) {
                            Get.to(Register(value: uaeData));
                          }
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
                  )),
                ],
              ),
            ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget buildToptitle() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      // color: themeChange.darkTheme
                      //     ? Colors.white
                      //     : HexColor('#CEE812'),
                    ),
                  ),
                  Image.asset("assets/carditlogo.png", width: 100, height: 65),
                ],
              ),
            ]));
  }
}
