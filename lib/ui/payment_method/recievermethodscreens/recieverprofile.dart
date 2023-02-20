import 'package:cardit/auth/auth.dart';
import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/ui/payment_method/manula_card_screen.dart';
import 'package:cardit/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../widgets/auth_button.dart';
import '../../landingscreens/settings_screen.dart';
import '../../landingscreens/user_details_screen.dart';

class recieverprofile extends StatefulWidget {
  const recieverprofile({Key? key}) : super(key: key);

  @override
  State<recieverprofile> createState() => _recieverprofileState();
}

class _recieverprofileState extends State<recieverprofile> {
  final AuthCon con = Get.put(AuthCon());
  var usertab = '/userdetails';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        bottomNavigationBar:
        Responsive.isMobile(context) ? BottomNavBarReceiver(index: 2) : null,
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


                  buildmenu('assets/banner/card.png', 'Manage Cards',
                      '/manualCard'),

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
            child: SingleChildScrollView(
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

                    buildmenu('assets/banner/card.png',
                        'Manage Cards', '/manualCard'),
                    SizedBox(height: 15),
                    buildmenu('assets/banner/reward.png',
                        'My Rewards', '/settings'),
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
          ),

               usertab == '/manualCard'
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
              )
        ])
            : Row(children: [
          Container(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.width / 1,
            decoration: BoxDecoration(
              // color: Colors.blue
            ),
            child: SingleChildScrollView(
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

                    buildmenu('assets/banner/card.png',
                        'Manage Cards', '/manualCard'),
                    SizedBox(height: 15),
                    buildmenu('assets/banner/reward.png',
                        'My Rewards', '/settings'),
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
          ),
          usertab == '/manualCard'
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
          if (Responsive.isDesktop(context) || Responsive.isTablet(context)) {
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
        return Responsive.isMobile(context)
            ? AlertDialog(
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
                  GetStorage().remove("customer_type");
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
        )
            : AlertDialog(
          insetPadding: EdgeInsets.symmetric(vertical: 50),
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
            GestureDetector(
              onTap: () {
                GetStorage().remove('save_token');
                GetStorage().remove("customer_type");
                Get.offAndToNamed('/home');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 20),
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 8
                    : MediaQuery.of(context).size.width / 10,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    color: HexColor('#90BA06'),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      fontFamily: 'ProductSans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#004751'),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 20),
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 8
                    : MediaQuery.of(context).size.width / 10,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    color: HexColor('#D2ED78'),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "No",
                    style: TextStyle(
                      fontFamily: 'ProductSans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#004751'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
    return exitApp ?? false;
  }
}


