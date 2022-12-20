import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../themes/styles.dart';
import '../themes/theme_notifier.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          themeChange.darkTheme ? Color(0XFF000000) : Color(0XFFffffff),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: AppBar(
              elevation: 0,
              leading: Container(
                  width: 10,
                  height: 10,
                  child: SvgPicture.asset('assets/sortingleft.svg',
                      color: themeChange.darkTheme
                          ? Color(0XFFffffff)
                          : Color(0XFF000000),
                      width: 10,
                      height: 10)),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle:
                        TextStyle(fontSize: 14, color: HexColor('#004751')),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/login',
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 16,
                        color: themeChange.darkTheme
                            ? HexColor('#ffffff')
                            : HexColor('#004751')),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                    height: 10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor('#CEE812'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/selectcountry',
                        );
                      },
                      child: Text('Register',
                          style: TextStyle(
                              fontSize: 14, color: HexColor('#004751'))),
                    )),
                const SizedBox(
                  width: 10,
                ),
              ],
            )),
      ),
      body: Container(
          color: Styles.colorBackgroundBlock,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topBanner(),
                buildtitle(),
                SizedBox(
                  height: 20,
                ),
                buildbutton(),
                buildbCart()
              ],
            ),
          )),
    );
  }

  Widget topBanner() {
    return Container(
        color: Styles.colorBackgroundBlock,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
        child: Stack(clipBehavior: Clip.none, children: <Widget>[
          Image.asset(
            "assets/banner.png",
          ),
          Positioned(
            bottom: -60,
            right: 10,
            width: 120,
            height: 120,
            child: IconButton(
              icon: Image.asset(
                height: 200,
                width: 200,
                "assets/banner-icon.png",
              ),
              tooltip: 'start',
              onPressed: () {},
            ),
          )
        ]));
  }

  Widget buildtitle() {
    return Container(
        color: Styles.colorBackgroundBlock,
        padding: EdgeInsets.all(15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Simplify Payments",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Styles.whitecolortext,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              RichText(
                text: TextSpan(
                  text: 'with ',
                  style: TextStyle(
                      color: Styles.whitecolortext,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Cardit',
                        style:
                            TextStyle(fontSize: 18, color: Color(0XFFCEE812))),
                    TextSpan(text: ' it '),
                    TextSpan(
                        text: 'Now',
                        style:
                            TextStyle(fontSize: 18, color: Color(0XFFCEE812))),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  text: ' ',
                  style: TextStyle(
                      color: Styles.whitecolortext,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'With Carditnow you can pay ',
                        style: TextStyle(
                            fontSize: 14, color: Styles.whitecolortext)),
                    TextSpan(
                        text: 'Anyone, Anywhere, Anytime.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(4, 19, 22, 0.75))),
                  ],
                ),
              ),
            ]));
  }

  Widget buildbutton() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0XFF004751),
        ),
        margin: EdgeInsets.all(15),
        child: InkWell(
          highlightColor: Color(0XFF004751),
          focusColor: Color(0XFF004751),
          splashColor: Colors.green, // splash color
          onTap: () {}, // button pressed
          child: Padding(
              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Get Started",
                    style: TextStyle(color: Color(0XFFCEE812), fontSize: 18),
                  ),
                  SvgPicture.asset(
                    'assets/getstart.svg',
                    width: 42,
                    height: 42,
                  ), // text
                ],
              )),
        ));
  }

  Widget buildbCart() {
    return Container(
        color: Color(0XFFF7F7F7),
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Image.asset("assets/visa.png", width: 50),
          const SizedBox(width: 10),
          Image.asset(width: 50, 'assets/americon.png'),
          const SizedBox(width: 10),
          SvgPicture.asset('assets/master.svg', width: 40)
        ]));
  }
}
