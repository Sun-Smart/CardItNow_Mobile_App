import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/bottom_navbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarWidget(3),
      backgroundColor: Color(0XFFffffff),
      body: Container(
          color: Color(0XFFffffff),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        top: 30, bottom: 30, left: 20, right: 20),
                    margin: EdgeInsets.only(top: 40),
                    decoration: const BoxDecoration(
                      color: Color(0XffF9F9F9),
                      image: DecorationImage(
                        image: AssetImage("assets/loginbg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildToptitle(),
                          buildtitle(),
                        ])),
                SizedBox(
                  height: 20,
                ),
                buildmenu('assets/banner/usericon.png', 'User Details', ''),
                SizedBox(
                  height: 15,
                ),
                buildmenu('assets/banner/card.png', 'Manage Cards', ''),
                SizedBox(
                  height: 15,
                ),
                buildmenu('assets/banner/reward.png', 'My Rewards', ''),
                SizedBox(
                  height: 15,
                ),
                buildmenu('assets/banner/setting.png', 'Settings', ''),
                SizedBox(
                  height: 15,
                ),
                buildmenu('assets/banner/chart.png', 'Help and Support', ''),
                SizedBox(
                  height: 15,
                ),
                buildlogout('assets/banner/logout.png', 'Log out', '')
              ],
            ),
          )),
    );
  }

  Widget buildToptitle() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Profile',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0XFF1B1B1B),
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 14, color: HexColor('#004751')),
            ),
            onPressed: () {},
            child: Text(
              'Set up to Recieve',
              style: TextStyle(
                  fontSize: 12,
                  color: HexColor('#1B1B1B'),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]);
  }

  Widget buildtitle() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/userimg.png",
                width: 107,
              ),
              const Text('Rita Ganes',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0XFF1B1B1B),
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const Text('ritaganes@gmail.com',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(255, 177, 178, 178),
                      fontSize: 16,
                      fontWeight: FontWeight.normal)),
              SizedBox(
                height: 20,
              )
            ]));
  }

  Widget buildmenu(String icon, String text, String link) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed('/userdetails');
      },
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color(0XffCEE812),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: Image.asset(
          icon,
          width: 20,
        ),
      ),
      title: Text(text,
          style: const TextStyle(
              color: Color(0Xff1B1B1B),
              fontSize: 16,
              fontWeight: FontWeight.normal)),
      trailing: const Icon(
        Icons.keyboard_arrow_right_outlined,
        size: 35,
        color: Colors.black,
      ),
    );
  }

  Widget buildlogout(String icon, String text, String link) {
    return ListTile(
      onTap: () {
        // Navigator.of(context).pushNamed('/onboardsellerlode');
      },
      leading: Image.asset(
        icon,
        width: 24,
      ),
      title: Text(text,
          style: const TextStyle(
              color: Color(0Xff004751),
              fontSize: 18,
              fontWeight: FontWeight.normal)),
    );
  }
}
