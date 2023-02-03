// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'changepaymethod.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  bool isSwitched = false;
  bool isdark = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        //bottomNavigationBar: BottomNavBarWidget(2),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            elevation: 0,
            centerTitle: false,
            leadingWidth: 50,
            titleSpacing: 0.0,
            backgroundColor: Colors.white,
            title: const Padding(
                padding: EdgeInsets.only(top: 0.0),
                child: Text(
                  "Settings",
                  style: TextStyle(
                      color: Color(0XFF1B1B1B),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(20),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Notification",
                            style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Turn Notification on and off",
                            style: TextStyle(
                              color: Color(0XFFF000000),
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Change Login Pin",
                            style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Update Your Login Pin",
                            style: TextStyle(
                              color: Color(0XFFF000000),
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: (() {}),
                        child: Text(
                          "Change",
                          style: TextStyle(
                              color: Color(0XFF026C7A),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Check for Updates",
                            style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Get Updated with latest version",
                            style: TextStyle(
                              color: Color(0XFFF000000),
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: (() {}),
                        child: Text(
                          "Check",
                          style: TextStyle(
                            color: Color(0XFF026C7A),
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dark Mode",
                            style: TextStyle(
                              // color: themeChange.darkTheme
                              //     ? Colors.white
                              //     : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Turn Dark Mode on and off",
                            style: TextStyle(
                              color: Color(0XFFF000000),
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),


                          GestureDetector(
                            onTap: (){
                              Get.to(()=>changepaymethod());
                            },
                            child: Text("Change Payment Method",
                            style: TextStyle(
                              fontSize: 16
                            ),
                            ),
                          ),
                          Text(
                            "change your payment details",
                            style: TextStyle(
                              color: Color(0XFFF000000),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      // Switch(
                      //   // value: themeChange.darkTheme,
                      //   onChanged: (value) {
                      //     themeChange.darkTheme = value;
                      //   },
                      //   activeTrackColor: Colors.lightGreenAccent,
                      //   activeColor: Colors.green,
                      // ),
                    ],
                  ),
                ]))));
  }

  /* Widget buildCard(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Container(
        margin: EdgeInsets.all(20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notification",
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Turn Notification on and off",
                    style: TextStyle(
                      color: Color(0XFFF000000),
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Change Login Pin",
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Update Your Login Pin",
                    style: TextStyle(
                      color: Color(0XFFF000000),
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: (() {}),
                child: Text(
                  "Change",
                  style: TextStyle(
                      color: Color(0XFF026C7A),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Check for Updates",
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Get Updated with latest version",
                    style: TextStyle(
                      color: Color(0XFFF000000),
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: (() {}),
                child: Text(
                  "Check",
                  style: TextStyle(
                    color: Color(0XFF026C7A),
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dark Mode",
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Turn Dark Mode on and off",
                    style: TextStyle(
                      color: Color(0XFFF000000),
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              Switch(
                value: _darkTheme,
                onChanged: (value) {
                  setState(() {
                    _darkTheme = value;
                  });
                  onThemeChanged(value, themeNotifier);
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
            ],
          ),
        ]));
  }*/

}
