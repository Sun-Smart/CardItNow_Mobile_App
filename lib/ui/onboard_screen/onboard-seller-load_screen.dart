import 'package:cardit/ui/onboard_screen/onboard-seller-apply_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../const/responsive.dart';
import '../../themes/theme_notifier.dart';
import '../../widgets/auth_button.dart';

class OnboardSellerLoad extends StatefulWidget {
  const OnboardSellerLoad({Key? key}) : super(key: key);

  @override
  State<OnboardSellerLoad> createState() => _OnboardSellerloadState();
}

class _OnboardSellerloadState extends State<OnboardSellerLoad> {
  @override
  void initState() {
    super.initState();
    _navigation();
  }

  _navigation() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      Get.to(const OnboardSellerApply());
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar:
              Responsive.isMobile(context) ? bulildbutton() : null,
          appBar: Responsive.isMobile(context)
              ? PreferredSize(
                  preferredSize: Size.fromHeight(90.0),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: AppBar(
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                          color: themeChange.darkTheme
                              ? Colors.white
                              : Colors.black,
                        ),
                        centerTitle: true,
                        title: Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xff036D7A),
                                    ),
                                    child: Image.asset(
                                      'assets/profile.png',
                                      fit: BoxFit.cover,
                                      height: 43,
                                      width: 43,
                                    )),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                            text: TextSpan(
                                          text: 'Angelo',
                                          style: TextStyle(
                                              fontFamily: "Sora",
                                              color: themeChange.darkTheme
                                                  ? Colors.white
                                                  : Color(0xff000000),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          /*defining default style is optional */
                                        )),
                                        Text(
                                          'Angelo@gmail.com',
                                          style: TextStyle(
                                              color: themeChange.darkTheme
                                                  ? Colors.white
                                                  : Color(0xffA49EA5),
                                              fontSize: 12,
                                              fontFamily: "Sora",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ))
                              ],
                            )),
                      )),
                )
              : null,
          body: Responsive.isMobile(context)
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/lodaing-img.gif',
                        fit: BoxFit.cover,
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Please wait untill your Recipient is being verified',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: themeChange.darkTheme
                                ? Colors.white
                                : Color(0xff413D4B),
                            fontSize: 12,
                            fontFamily: "Sora",
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              : Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Image.asset("assets/applogo-02.png",
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 3)),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 1,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close),
                                color: themeChange.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color(0xff036D7A),
                                  ),
                                  child: Image.asset(
                                    'assets/profile.png',
                                    fit: BoxFit.cover,
                                    height: 43,
                                    width: 43,
                                  )),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                        text: 'Angelo',
                                        style: TextStyle(
                                            fontFamily: "Sora",
                                            color: themeChange.darkTheme
                                                ? Colors.white
                                                : Color(0xff000000),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                        /*defining default style is optional */
                                      )),
                                      Text(
                                        'Angelo@gmail.com',
                                        style: TextStyle(
                                            color: themeChange.darkTheme
                                                ? Colors.white
                                                : Color(0xffA49EA5),
                                            fontSize: 12,
                                            fontFamily: "Sora",
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 150,
                          ),
                          Image.asset(
                            'assets/lodaing-img.gif',
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Please wait untill your Recipient is being verified',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: themeChange.darkTheme
                                    ? Colors.white
                                    : Color(0xff413D4B),
                                fontSize: 12,
                                fontFamily: "Sora",
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: null,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'Start New Payment',
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ])),
    );
  }

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5),
      ),
      // color: Color(0XffC4C4C4),
      onTap: null,
      text: "Start BNPL Payment", color: Colors.grey,
    );
  }
}

  

