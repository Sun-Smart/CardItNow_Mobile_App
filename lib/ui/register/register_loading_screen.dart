// ignore_for_file: prefer_const_constructors

import 'package:cardit/ui/payment_method/recievermethodscreens/letsstartpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../themes/styles.dart';
import '../../themes/theme_notifier.dart';

class Registerloading extends StatefulWidget {
  const Registerloading({Key? key}) : super(key: key);

  @override
  State<Registerloading> createState() => _RegisterloadingState();
}

Future<bool> _willPopCallback() async {
  // await showDialog or Show add banners or whatever
  // then
  return Future.value(false);
}

class _RegisterloadingState extends State<Registerloading> {
  @override
  void initState() {
    _navigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
          body: Container(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              //color: Color(0XFFffffff),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    topBanner(),
                    buildtitle1(),
                    // buildtitle(),
                  ])))),
    );
  }

  Widget topBanner() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0XFFF7F7F7),
        image: DecorationImage(
          image: AssetImage("assets/loading-banner.png"),
          fit: BoxFit.cover,
        ),
      ),
      width: MediaQuery.of(context).size.width / 0.8,
      height: 400,
    );
  }

  Widget buildtitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Take a Few Minutes to Relax !',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Sora',
                color: Styles.whitecolortext,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'We are verifying your ID and Details. We will notify you once done',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Sora',
                color: themeChange.darkTheme
                    ? Colors.white
                    : Color.fromRGBO(4, 19, 22, 0.6),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              themeChange.darkTheme
                  ? "assets/blockmode.gif"
                  : "assets/loading.gif",
              height: 220,
              //color: Colors.blueGrey,
            ),
          ],
        ));
  }
}

_navigation() async {
  await Future.delayed(const Duration(milliseconds: 3000), () {});
  Get.to(() => Letsstartpage());
}

Widget buildtitle1() {
  return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Take a Few Minutes to Relax !',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Sora',
              color: Styles.whitecolortext,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'We are verifying your ID and Details. We will notify you once done',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Sora',
              color: Color.fromRGBO(4, 19, 22, 0.6),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Image.asset(
            "assets/loading.gif",
            height: 220,
            //color: Colors.blueGrey,
          ),
        ],
      ));
}
