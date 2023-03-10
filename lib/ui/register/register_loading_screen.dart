// ignore_for_file: prefer_const_constructors



import 'package:cardit/ui/payment_method/recievermethodscreens/letsstartpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../const/responsive.dart';
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
  return Future.value(true);
}

class _RegisterloadingState extends State<Registerloading> {
  @override
  void initState() {
    // _navigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        backgroundColor: Colors.white,
          body: Responsive.isMobile(context)
              ? Container(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  //color: Color(0XFFffffff),
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        topBanner(),
                        buildtitle1(context),
                        // buildtitle(),
                      ])))
              : Row(
                children: [
                  //  Container(
                  //       width: MediaQuery.of(context).size.width / 3,
                  //       height: MediaQuery.of(context).size.height / 1,
                  //       color: Color(0XFF004751),
                  //       child: Center(
                  //           child: Image.asset("assets/applogo-02.png",
                  //               width: MediaQuery.of(context).size.width / 1.5, height:  MediaQuery.of(context).size.height / 3
                  //             )),
                  //     ),
                  Container(
                      width: MediaQuery.of(context).size.width / 1,
                      //padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      //color: Color(0XFFffffff),
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            topBanner(),
                            buildtitle1(context),
                            // buildtitle(),
                          ]))),
                ],
              )),
    );
  }

  Widget topBanner() {
    return Responsive.isMobile(context)
        ? Container(
            decoration: const BoxDecoration(
              color: Color(0XFFF7F7F7),
              image: DecorationImage(
                image: AssetImage("assets/loading-banner.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width / 0.8,
            height: 400,
          )
        : Container(
            decoration: const BoxDecoration(
              color: Color(0XFFF7F7F7),
              image: DecorationImage(
                image: AssetImage("assets/loading-banner.png"),
                fit: BoxFit.cover,
              ),
            ),
             width: Responsive.isMobile(context)
                 ? MediaQuery.of(context).size.width / 5
                : MediaQuery.of(context).size.width / 3,
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
                color: HexColor('#004751'),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'We are verifying your Details. We will notify you once done',
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

// _navigation() async {
//   await Future.delayed(const Duration(milliseconds: 3000), () {});
//   Get.to(() => Letsstartpage());
// }

Widget buildtitle1(context) {
  return Responsive.isMobile(context)? Container(
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
              color: HexColor('#004751'),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'We are verifying your Details. We will notify you once done',
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
      )):
       Container(
        width: MediaQuery.of(context).size.width/1.5,
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
              color: HexColor('#004751'),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'We are verifying your Details. We will notify you once done',
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
