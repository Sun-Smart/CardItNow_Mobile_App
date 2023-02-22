// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:cardit/const/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/bottom_navbar.dart';

class Loans extends StatefulWidget {
  const Loans({super.key});

  @override
  State<Loans> createState() => _LoansState();
}

class _LoansState extends State<Loans> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          Responsive.isMobile(context) ? BottomNavBarWidget(1) : null,
      appBar: Responsive.isMobile(context)
          ? PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leadingWidth: 5,
                    centerTitle: false,
                    title: Text('Easy Installment',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    actions: <Widget>[
                      Padding(
                          padding:
                              EdgeInsets.only(right: 10, top: 10, bottom: 10),
                          child: GestureDetector(
                              onTap: () {},
                              child: Image.asset('assets/search.png',
                                  fit: BoxFit.contain, width: 25, height: 22))),
                      Padding(
                          padding:
                              EdgeInsets.only(right: 10, top: 10, bottom: 10),
                          child: GestureDetector(
                              onTap: () {},
                              child: Image.asset('assets/notification.png',
                                  fit: BoxFit.contain, width: 25, height: 22))),
                    ],
                  )),
            )
          : null,
      body: Responsive.isMobile(context)
          ? Container(
              child: SingleChildScrollView(
              child: Column(
                children: [
                  topBanner(),
                  buildtitle(),
                  buildbutton(),
                  buildfaq(),
                ],
              ),
            ))
          : Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //  Container(
                //       width: MediaQuery.of(context).size.width / 3,
                //       height: MediaQuery.of(context).size.height / 1,
                //       color: Color(0XFF004751),
                //       child: Center(
                //           child: Image.asset("assets/applogo-02.png",
                //               width: MediaQuery.of(context).size.width / 1.5,
                //               height: MediaQuery.of(context).size.height / 3)),
                //     ),
                SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    // height: MediaQuery.of(context).size.width / 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text('Easy Installment',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        topBanner(),
                        buildtitle(),
                        buildbutton(),
                        buildfaq(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    ));
  }

//git commit
  Widget topBanner() {
    return Responsive.isMobile(context)?Container(
      color: Color(0XFFF7F7F7),
      child: Image.asset(
        "assets/loanpg.png",
      ),
    ):Container(
      width: 400,
      color: Color(0XFFF7F7F7),
      child: Image.asset(
        "assets/loanpg.png",
      ),
    );
  }

  Widget buildtitle() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Responsive.isMobile(context)
        ? Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const[
                Text(
                  'Get Instant loans !',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Sora',
                    // color:
                    //     themeChange.darkTheme ? Colors.white : HexColor('#026C7A'),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'for payments of carditnow participating Partners 0% fee,\n for non cardit dont  worry you can still do easy Payment plan at very low cost of 2% only.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Sora',
                    // color: themeChange.darkTheme ? Colors.white : Color(0Xff81898A),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ))
        : Container(
            width: MediaQuery.of(context).size.width / 4,
            alignment: Alignment.center,
            margin: EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:const [
                Text(
                  'Get Instant loans !',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Sora',
                    // color:
                    //     themeChange.darkTheme ? Colors.white : HexColor('#026C7A'),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'for payments of carditnow participating Partners 0% fee,\n for non cardit dont  worry you can still do easy Payment plan at very low cost of 2% only.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Sora',
                    // color: themeChange.darkTheme ? Colors.white : Color(0Xff81898A),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ));
  }

  Widget buildbutton() {
    return Responsive.isMobile(context)
        ? Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Color(0XFFCEE812),
            ),
            margin: EdgeInsets.all(10),
            child: InkWell(
              highlightColor: Color(0XFF004751),
              focusColor: Color(0XFF004751),
              splashColor: Colors.green, // splash color
              onTap: () {
                Navigator.of(context).pushNamed('/loanpayment');
              }, // button pressed
              child: const Padding(
                padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                child: Text(
                  "Let’s Go",
                  style: TextStyle(color: Color(0XFF004751), fontSize: 16),
                ),
                // text
              ),
            ))
        : Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Color(0XFFCEE812),
            ),
            margin: EdgeInsets.all(10),
            child: InkWell(
              highlightColor: Color(0XFF004751),
              focusColor: Color(0XFF004751),
              splashColor: Colors.green, // splash color
              onTap: () {
                Navigator.of(context).pushNamed('/loanpayment');
              }, // button pressed
              child: const Padding(
                padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                child: Text(
                  "Let’s Go",
                  style: TextStyle(color: Color(0XFF004751), fontSize: 16),
                ),
                // text
              ),
            ));
  }

  Widget buildfaq() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Responsive.isMobile(context)
        ? Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0Xff81898A))),
                  child: ExpansionTile(
                    title: Text('What are the benefits?',
                        style: TextStyle(
                            // color: themeChange.darkTheme
                            //     ? Colors.white
                            //     : Color(0Xff81898A),
                            fontSize: 18)),
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: const Text(
                              'There are several methods towidgets This is called composition.'))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0Xff81898A))),
                  child: ExpansionTile(
                    title: Text('How i can repay?',
                        style: TextStyle(
                            // color: themeChange.darkTheme
                            //     ? Colors.white
                            //     : Color(0Xff81898A),
                            fontSize: 18)),
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              'several methods towidgets This is called composition.'))
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width / 4,
            // padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0Xff81898A))),
                  child: ExpansionTile(
                    title: Text('What are the benefits?',
                        style: TextStyle(
                            // color: themeChange.darkTheme
                            //     ? Colors.white
                            //     : Color(0Xff81898A),
                            fontSize: 18)),
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: const Text(
                              'There are several methods towidgets This is called composition.'))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0Xff81898A))),
                  child: ExpansionTile(
                    title: Text('How i can repay?',
                        style: TextStyle(
                            // color: themeChange.darkTheme
                            //     ? Colors.white
                            //     : Color(0Xff81898A),
                            fontSize: 18)),
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              'several methods towidgets This is called composition.'))
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
