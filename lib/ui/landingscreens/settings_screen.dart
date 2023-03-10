// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/responsive.dart';
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
            iconTheme: IconThemeData(
              color: Colors.black
            ),
            elevation: 0,
            centerTitle: false,
            leadingWidth: 50,
            titleSpacing: 0.0,

            title:  Padding(
                padding: EdgeInsets.only(top: 0.0),
                child:Responsive.isMobile(context)?  Text(
                  "Settings",
                  style: TextStyle(
                      color: Color(0XFF1B1B1B),
                      fontSize: 18,fontFamily: "Sora",
                      fontWeight: FontWeight.bold),
                ):Center(
                  child: Text(
                    "Settings",
                    style: TextStyle(
                        color: Color(0XFF1B1B1B),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ),
        body: Responsive.isMobile(context)? 
        SingleChildScrollView(
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
                              fontSize: 16,fontFamily: "Sora",
                            ),
                          ),
                          Text(
                            "Turn Notification on and off",
                            style: TextStyle(
                              color: Color(0XFFF000000),
                              fontSize: 12,fontFamily: "Sora",
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
                              fontSize: 16,fontFamily: "Sora",
                            ),
                          ),
                          Text(
                            "Update Your Login Pin",
                            style: TextStyle(
                              color: Color(0XFFF000000),
                              fontSize: 12,fontFamily: "Sora",
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
                              fontSize: 16,fontFamily: "Sora",
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
                              fontSize: 16,fontFamily: "Sora",
                            ),
                          ),
                          Text(
                            "Get Updated with latest version",
                            style: TextStyle(
                              color: Color(0XFFF000000),
                              fontSize: 12,fontFamily: "Sora",
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
                            fontSize: 16,fontFamily: "Sora",
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
                              fontSize: 12,fontFamily: "Sora",
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
                              fontSize: 16,fontFamily: "Sora",
                            ),
                            ),
                          ),
                          Text(
                            "change your payment details",
                            style: TextStyle(
                              color: Color(0XFFF000000),
                              fontSize: 12,fontFamily: "Sora",
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
                ]))): SingleChildScrollView(
            child: Container(
             width: Responsive.isDesktop(context)
                                    ? MediaQuery.of(context).size.width / 2
                                    : MediaQuery.of(context).size.width / 1.5,
                //margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              SizedBox(height: 30,),
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
                  ]),
                ))));
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
