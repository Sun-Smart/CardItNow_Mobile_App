// ignore_for_file: unrelated_type_equality_checks, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../register_screen/register_screen.dart';

var type = '';
var countrytype = ['assets/newlogo.png', 'assets/newuae.png'];
var countryname = ['Philippines', 'UAE'];
bool country = false;
var isphilipines;
var philipineData = ['Passport', 'Driving Licence', 'National ID', 'UMID'];
var uaeData = ['UAE Number'];

class Selectcountry extends StatefulWidget {
  const Selectcountry({Key? key}) : super(key: key);

  @override
  State<Selectcountry> createState() => _SelectcountryState();
}

class _SelectcountryState extends State<Selectcountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildToptitle(),
            buildtitle(),
            Container(
              margin: const EdgeInsets.all(15),
              child: Row(
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
                padding: const EdgeInsets.all(5),
                itemCount: countrytype.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        country == countrytype[0] ? true : false;
                        isphilipines;
                        type = countrytype[index];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Card(
                        color: type == countrytype[index]
                            ? HexColor('#CEE812')
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(countrytype[index],
                                    width: 100, height: 100),
                                const SizedBox(width: 30),
                                Text(countryname[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
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
