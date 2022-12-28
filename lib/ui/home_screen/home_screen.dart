import 'dart:ui';

import 'package:cardit/ui/login_screen/login_screen.dart';
import 'package:cardit/ui/register_screen/register_screen.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../themes/styles.dart';
import '../../themes/theme_notifier.dart';

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
      backgroundColor: themeChange.darkTheme
          ? const Color(0XFF000000)
          : const Color(0XFFffffff),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 10, 15),
          child: AppBar(
            elevation: 0,
            leading: SvgPicture.asset(
              'assets/sortingleft.svg',
              width: 16,
            ),
            actions: [
              CustomSlidingSegmentedControl<int>(
                thumbDecoration: BoxDecoration(
                  color: const Color(0XFFCEE812),
                  borderRadius: BorderRadius.circular(4),
                ),
                fromMax: true,
                children: const {
                  1: Text('Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Sora',
                          color: Color(0XFF004751))),
                  2: Text('Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Sora',
                          color: Color(0XFF004751))),
                },
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.transparent,
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 3.0),
                    ),
                  ],
                ),
                fixedWidth: 100,
                onValueChanged: (int value) {
                  if (value == 1) {
                    Get.to(const Login());
                  } else if (value == 2) {
                    Get.to(const Register(value: []));
                  }
                },
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topBanner(),
          buildTitle(),
          buildButton(),
        ],
      ),
      bottomNavigationBar: _buildCart(),
    );
  }

  Widget topBanner() {
    return Container(
        color: Styles.colorBackgroundBlock,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
        child: Stack(clipBehavior: Clip.none, children: <Widget>[
          Image.asset("assets/banner.png"),
          Positioned(
            bottom: -60,
            right: 10,
            width: 120,
            height: 120,
            child: IconButton(
              icon: Image.asset(
                  height: 200, width: 200, "assets/banner-icon.png"),
              tooltip: 'start',
              onPressed: () {},
            ),
          )
        ]));
  }

  Widget buildTitle() {
    return Container(
        color: Styles.colorBackgroundBlock,
        padding: const EdgeInsets.all(15),
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
                  children: const <TextSpan>[
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
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  text: ' ',
                  style: TextStyle(
                      color: Styles.whitecolortext,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'With Carditnow you can pay ',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Sora',
                            color: Colors.grey)),
                    TextSpan(
                        text: 'Anyone, Anywhere, \n Anytime.',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(4, 19, 22, 0.75))),
                  ],
                ),
              ),
            ]));
  }

  Widget buildButton() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SwipeButton(
          activeThumbColor: const Color(0XFFCEE812),
          thumbPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          borderRadius: BorderRadius.circular(3),
          activeTrackColor: const Color(0XFF004751),
          height: 60,
          child: const Text("Get Started",
              style: TextStyle(
                  fontFamily: "assets/fonts/Sora.ttf",
                  fontSize: 16,
                  color: Color(0XFFCEE812))),
          onSwipe: () {
            Get.to(const Register(value: []));
          }),
    );
  }

  Widget _buildCart() {
    return Container(
        color: const Color(0XFFF7F7F7),
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
