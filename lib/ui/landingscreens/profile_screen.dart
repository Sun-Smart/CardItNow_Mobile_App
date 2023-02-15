// ignore_for_file: unused_import, unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:io';

import 'package:cardit/auth/auth.dart';
import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/services/gmail_auth_services.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/ui/landingscreens/loans_screen.dart';
import 'package:cardit/ui/landingscreens/payments_screen.dart';
import 'package:cardit/ui/landingscreens/settings_screen.dart';
import 'package:cardit/ui/landingscreens/user_details_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../widgets/drawer_web.dart';
import '../payment_method/manula_card_screen.dart';
import '../register/drawer/drawerscreen.dart';
import 'dashbord_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthCon con = Get.put(AuthCon());
  var usertab = '/userdetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            Responsive.isMobile(context) ? BottomNavBarWidget(3) : null,
        body: Responsive.isMobile(context)
            ? Container(
                child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            top: 40, bottom: 30, left: 20, right: 20),
                        margin: EdgeInsets.only(top: 30),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/loginbg.png"),
                                fit: BoxFit.cover)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [buildToptitle(), buildtitle()])),
                    buildmenu('assets/banner/usericon.png', 'User Details',
                        '/userdetails'),
                    SizedBox(height: 15),
                    buildmenu('assets/banner/card.png', 'Manage Cards',
                        '/manualCard'),
                    SizedBox(height: 15),
                    buildmenu(
                        'assets/banner/reward.png', 'My Rewards', '/settings'),
                    SizedBox(height: 15),
                    buildmenu(
                        'assets/banner/setting.png', 'Settings', '/settings'),
                    SizedBox(height: 15),
                    buildmenu('assets/banner/chart.png', 'Help and Support',
                        '/settings'),
                    SizedBox(height: 15),
                    buildlogout('assets/banner/logout.png', 'Log out')
                  ],
                ),
              ))
            : Responsive.isDesktop(context)
                ? Row(children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      height: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                          // color: Colors.blue
                          ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            profileweb(),
                            TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                onPressed: () {},
                                child: Text('Set up to Recieve',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            buildmenu('assets/banner/usericon.png',
                                'User Details', '/userdetails'),
                            SizedBox(height: 15),
                            buildmenu('assets/banner/card.png', 'Manage Cards',
                                '/manualCard'),
                            SizedBox(height: 15),
                            buildmenu('assets/banner/reward.png', 'My Rewards',
                                '/settings'),
                            SizedBox(height: 15),
                            buildmenu('assets/banner/setting.png', 'Settings',
                                '/settings'),
                            SizedBox(height: 15),
                            buildmenu('assets/banner/chart.png',
                                'Help and Support', '/settings'),
                            SizedBox(height: 15),
                            buildlogout('assets/banner/logout.png', 'Log out')
                          ]),
                    ),
                    usertab == '/userdetails'
                        ? Container(
                            // decoration: BoxDecoration(color: Colors.blueGrey),
                            width: MediaQuery.of(context).size.width / 2,
                            child: UserDetails())
                        : usertab == '/manualCard'
                            ? Container(
                                // decoration: BoxDecoration(color: Colors.blue),
                                width: MediaQuery.of(context).size.width / 2,
                                child: ManualCard())
                            : usertab == '/settings'
                                ? Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Settings())
                                : usertab == '/settings'
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Settings())
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: UserDetails())
                  ])
                : Row(children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                          // color: Colors.blue
                          ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            profileweb(),
                            TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                onPressed: () {},
                                child: Text('Set up to Recieve',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            buildmenu('assets/banner/usericon.png',
                                'User Details', '/userdetails'),
                            SizedBox(height: 15),
                            buildmenu('assets/banner/card.png', 'Manage Cards',
                                '/manualCard'),
                            SizedBox(height: 15),
                            buildmenu('assets/banner/reward.png', 'My Rewards',
                                '/settings'),
                            SizedBox(height: 15),
                            buildmenu('assets/banner/setting.png', 'Settings',
                                '/settings'),
                            SizedBox(height: 15),
                            buildmenu('assets/banner/chart.png',
                                'Help and Support', '/settings'),
                            SizedBox(height: 15),
                            buildlogout('assets/banner/logout.png', 'Log out')
                          ]),
                    ),
                    usertab == '/userdetails'
                        ? Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: UserDetails())
                        : usertab == '/manualCard'
                            ? Container(
                                // decoration: BoxDecoration(color: Colors.blue),
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: ManualCard())
                            : usertab == '/settings'
                                ? Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.2,
                                    child: Settings())
                                : usertab == '/settings'
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.2,
                                        child: Settings())
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.2,
                                        child: UserDetails())
                  ]));
  }

  Widget buildToptitle() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Profile',
              textAlign: TextAlign.left,
              style: TextStyle(
                  // color:
                  //     themeChange.darkTheme ? Colors.white : Color(0XFF1B1B1B),
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 14, color: HexColor('#004751')),
              ),
              onPressed: () {},
              child: Text('Set up to Recieve',
                  style: TextStyle(
                      fontSize: 12,
                      // color: themeChange.darkTheme
                      //     ? Colors.white
                      //     : HexColor('#1B1B1B'),
                      fontWeight: FontWeight.bold))),
        ]);
  }

  Widget profileweb() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xff036D7A)),
                  child: GetStorage().read("avatarpic") == null
                      ? Container()
                      : GetStorage()
                              .read("avatarpic")
                              .toString()
                              .contains('assets')
                          ? Image.asset(GetStorage().read("avatarpic"),
                              fit: BoxFit.cover, height: 43, width: 43)
                          : Container()
                  // Image.file(File(GetStorage().read("avatarpic")),
                  //             fit: BoxFit.cover, height: 43, width: 43)
    ),
              // CircleAvatar(
              //     radius: 50,
              //     backgroundImage: ,),
              const SizedBox(height: 5),
              Text('${GetStorage().read('username')}',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text('${GetStorage().read('username')}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(255, 177, 178, 178),
                      fontSize: 16,
                      fontWeight: FontWeight.normal)),
              SizedBox(height: 20)
            ]));
  }

  Widget buildtitle() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xff036D7A)),
                  child: GetStorage().read("avatarpic") == null
                      ? Container()
                      : GetStorage()
                              .read("avatarpic")
                              .toString()
                              .contains('assets')
                          ? Image.asset(GetStorage().read("avatarpic"),
                              fit: BoxFit.cover, height: 43, width: 43)
                          : Container()
                  // Image.file(File(GetStorage().read("avatarpic")),
                  //             fit: BoxFit.cover, height: 43, width: 43)
              ),
              // CircleAvatar(
              //     radius: 50,
              //     backgroundImage: ,),
              const SizedBox(height: 5),
              Text('${GetStorage().read('username')}',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text('${GetStorage().read('username')}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(255, 177, 178, 178),
                      fontSize: 16,
                      fontWeight: FontWeight.normal)),
              SizedBox(height: 20)
            ]));
  }

  Widget buildmenu(String icon, String text, String link) {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return ListTile(
        hoverColor: Colors.transparent,
        onTap: () {
          if (Responsive.isDesktop(context) ||Responsive.isTablet(context)) {
            setState(() {
              usertab = link;
            });
          } else {
            Navigator.of(context).pushNamed(link);
          }
        },
        leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Color(0XffCEE812),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Image.asset(icon, width: 20)),
        title: Text(text,
            style: TextStyle(
                // color: themeChange.darkTheme ? Colors.white : Color(0Xff1B1B1B),
                fontSize: 16,
                fontWeight: FontWeight.normal)),
        trailing: Icon(
          Icons.keyboard_arrow_right_outlined,
          size: 35,
        ));
    // color: themeChange.darkTheme ? Colors.white : Colors.black));
  }

  Widget buildlogout(String icon, String text) {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return ListTile(
        onTap: () {
          _onBackButtonPressed();
        },
        leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Color(0XffCEE812),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Image.asset(icon, width: 20)),
        title: Text(text,
            style: TextStyle(
                // color: themeChange.darkTheme ? Colors.white : Color(0Xff1B1B1B),
                fontSize: 16,
                fontWeight: FontWeight.normal)),
        trailing: Icon(
          Icons.keyboard_arrow_right_outlined,
          size: 35,
          // color: themeChange.darkTheme ? Colors.white : Colors.black,
        ));
  }

  //Back Press
  Future<bool> _onBackButtonPressed() async {
    bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          title: const Text('Really...',
              style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          content: const Text('Do you want to Logout the app?',
              style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          actions: <Widget>[
            AuthButton(
                decoration: BoxDecoration(
                    color: HexColor('#90BA06'),
                    borderRadius: BorderRadius.circular(5)),
                onTap: () {
                  GetStorage().remove('save_token');
                  Get.offAndToNamed('/home');
                },
                text: "Yes"),
            AuthButton(
                decoration: BoxDecoration(
                    color: HexColor('#D2ED78'),
                    borderRadius: BorderRadius.circular(5)),
                onTap: () {
                  Get.back();
                },
                text: "No"),
          ],
        );
      },
    );
    return exitApp ?? false;
  }
}
