// ignore_for_file: camel_case_types, sized_box_for_whitespace, prefer_const_constructors

import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/regster_api.dart';
import '../../const/responsive.dart';
import '../../themes/theme_notifier.dart';

class termsandconditions extends StatefulWidget {
  const termsandconditions({Key? key}) : super(key: key);

  @override
  State<termsandconditions> createState() => _termsandconditionsState();
}

class _termsandconditionsState extends State<termsandconditions> {

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  final RegisterAPI con = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:
            Responsive.isMobile(context) ? bulildbutton() : null,
        body: Responsive.isMobile(context)
            ? Container(
                height: MediaQuery.of(context).size.height / 0.8,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 20, bottom: 0),
                          // margin: EdgeInsets.only(top: 40),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildToptitle(),
                                buildtitle(),
                              ])),
                      bulidForm(),
                      SizedBox(height: 30)
                    ],
                  ),
                ))
            : Responsive.isDesktop(context)
                ? Row(
                    children: [
                      // Container(
                      //   width: MediaQuery.of(context).size.width / 3,
                      //   height: MediaQuery.of(context).size.width / 1,
                      //   color: Color(0XFF004751),
                      //   child: Center(
                      //       child: Image.asset("assets/applogo-02.png",
                      //           width: MediaQuery.of(context).size.width / 1.5,
                      //           height:
                      //               MediaQuery.of(context).size.height / 3)),
                      // ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height / 1,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildToptitle(),
                                buildtitle(),
                                bulidForm(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                       onTap: () {
          con.Termspost(

          );
        },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        decoration: BoxDecoration(
                                            color: HexColor('#CEE812'),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            " Accept and Proceed",
                                            style: TextStyle(
                                              fontFamily: 'ProductSans',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: HexColor('#004751'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ])),
                    ],
                  )
                : Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          //eight: MediaQuery.of(context).size.height / 0.8,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding:
                                        EdgeInsets.only(top: 20, bottom: 0),
                                    // margin: EdgeInsets.only(top: 40),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          buildToptitle(),
                                          buildtitle(),
                                        ])),
                                bulidForm(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AuthButton(
                                        decoration: BoxDecoration(
                                            color: HexColor('#CEE812'),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        onTap: () {
          con.Termspost(

          );
        },
                                        text: "Accept and Proceed"),
                                  ],
                                ),
                                SizedBox(height: 30)
                              ],
                            ),
                          ))
                    ],
                  ),
      ),
    );
  }

  Widget bulidForm() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(15),
            height:
                  Responsive.isMobile(context)?
                MediaQuery.of(context).size.height / 1
             : MediaQuery.of(context).size.height / 2,
            width:
                // Responsive.isMobile(context)
                MediaQuery.of(context).size.width / 1,
            // : MediaQuery.of(context).size.width / 2,
            child:
                ListView.builder(
                    itemCount: con.termscond.length,
                    itemBuilder: (BuildContext context, int index) {
                      return
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child:
                        Html(

                          data: con.termscond[index]["termdetails"].toString(),
                          // onLinkTap: (url) async {
                          //   if (await canLaunch(url)) {
                          //     await launch(
                          //       url,
                          //     );
                          //   } else {
                          //     throw 'Could not launch $url';
                          //   }
                          // },


                          style: {
                      "body": Style(
                      fontSize: FontSize(14.0),
                      color: Colors.black87,
                      textAlign: TextAlign.left,
                      fontFamily: 'sora'
                      ),
                      },

                      )
                   ),
              ],
            );
        }),
        ),
        );
  }

  Widget buildToptitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back,
                color: themeChange.darkTheme ? Colors.white : Colors.black,
                size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container()
        ]);
  }

  Widget bulildbutton() {
    return AuthButton(
        decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        onTap: () {
          con.Termspost(

          );
        },
        text: "Accept and Proceed");
  }

  Widget buildtitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: Responsive.isMobile(context)
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          Text(
            'Terms of Use',
            style: TextStyle(
              fontSize: 28,
              color: themeChange.darkTheme ? Colors.white : HexColor('#004751'),
              fontWeight: FontWeight.bold,fontFamily: 'sora'
            ),
          ),
        ],
      ),
    );
  }
}
