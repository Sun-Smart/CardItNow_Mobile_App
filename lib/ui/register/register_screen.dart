

// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'dart:ui';

import 'package:cardit/const/responsive.dart';
import 'package:cardit/ui/splash/country.dart';
import 'package:cardit/utils/gmail_auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../api/regster_api.dart';
import '../../themes/styles.dart';
import '../../themes/theme_notifier.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';
import '../auth/login_screen.dart';

bool isChecked = false;
bool isChecked1 = true;
bool isLoggedIn = false;
Map userObj = {};

class Register extends StatefulWidget {

  const Register({
    super.key,
  });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  final RegisterAPI con = Get.find();
  String? gender;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Responsive.isMobile(context)
              ? SingleChildScrollView(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/backimg.png",
                                      ),
                                      fit: BoxFit.fill),
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      buildtitle(),
                                      Container(
                                          width: Responsive.isMobile(context)
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1
                                              : Responsive.isDesktop(context)
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4.3
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              border: Border.all(
                                                  color: Color(0XFFB7C5C7),
                                                  width: 1.5),
                                              color: Colors.transparent),
                                          margin: EdgeInsets.all(15),
                                          child: InkWell(
                                            highlightColor: Color(0XFFffffff),
                                            focusColor: Color(0XFFffffff),
                                            splashColor:
                                                Colors.green, // splash color
                                            onTap: () {
                                              if(isChecked == true){
                                                FacebookAuth.instance.login(
                                                    permissions: ["public_profile", "email"]).then((value) {
                                                  FacebookAuth.instance.getUserData().then((userData) {
                                                    setState(() {
                                                      isLoggedIn = true;
                                                      userObj = userData;
                                                    });


                                                    if (userData["email"] == null) {
                                                      Fluttertoast.showToast(msg: "Your Facebook Account not registerd with Email");
                                                    }
                                                    else if(
                                                    isLoggedIn == true
                                                    ){
                                                      con.emailController.text = userData["email"];
                                                      print(userData.toString());
                                                      var userDatas = {
                                                        "email": userData["email"].toString(),
                                                        "firstname": userData['name'].toString(),
                                                        "lastname": "",
                                                        "socialid": userData['id'].toString(),
                                                        "mediatype": "Facebook",
                                                       "mobile":"",
                                                        "geoid": RegisterAPI.dropdownvalue["geoid"].toString()
                                                      };
                                                      con.registerSignAPI(userDatas);
                                                      GetStorage().write('username', userData['name']
                                                      );

                                                    }
                                                    else {
                                                      Fluttertoast.showToast(msg: "Check Your Facebook Account");
                                                    }
                                                  });
                                                });
                                              }else{
                                                Fluttertoast.showToast(msg: "Please Check Terms and Conditions");
                                              }

                                            }, // button pressed
                                            child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    SizedBox(width: 30),
                                                    Image.asset("assets/fb.png",
                                                        width: 32),
                                                    SizedBox(width: 15),
                                                    Text(
                                                        "Sign Up using Facebook",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0XFF413D4B),
                                                            fontSize: 16,
                                                            fontFamily: 'sora',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    // text
                                                  ],
                                                )),
                                          )),
                                      buildbutton(),
                                    ])),
                            buildToptitle(),
                          ],
                        ),
                        bulidForm(),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ))
              : Responsive.isDesktop(context)
                  ? Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Container(
                        //   width: MediaQuery.of(context).size.width / 3,
                        //   height: MediaQuery.of(context).size.width / 1,
                        //   color: Color(0XFF004751),
                        //   child: Center(
                        //       child: Image.asset("assets/applogo-02.png",
                        //           width:
                        //               MediaQuery.of(context).size.width / 1.5,
                        //           height:
                        //               MediaQuery.of(context).size.height / 3)),
                        // ),
                        Container(
                           width: MediaQuery.of(context).size.width / 1.5,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    color: Styles.colorBackgroundBlock,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          alignment: Alignment.topLeft,
                                          children: [
                                            Container(
                                                // decoration: BoxDecoration(
                                                //   image: DecorationImage(
                                                //       image: AssetImage("assets/backimg.png",),
                                                //       fit: BoxFit.fill),
                                                // ),
                        
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                  buildtitle(),
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4.3,
                                                      // : MediaQuery.of(context).size.width / 2.5,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                          border: Border.all(
                                                              color: Color(
                                                                  0XFFB7C5C7),
                                                              width: 1.5),
                                                          color:
                                                              Colors.transparent),
                                                      margin: EdgeInsets.all(15),
                                                      child: InkWell(
                                                        highlightColor:
                                                            Color(0XFFffffff),
                                                        focusColor:
                                                            Color(0XFFffffff),
                                                        splashColor: Colors
                                                            .green, // splash color
                                                        onTap: () {
                                                if(isChecked == true){
                                                  FacebookAuth.instance.login(
                                                      permissions: ["public_profile", "email"]).then((value) {
                                                    FacebookAuth.instance.getUserData().then((userData) {
                                                      setState(() {
                                                        isLoggedIn = true;
                                                        userObj = userData;
                                                      });
                        
                        
                                                      if (userData["email"] == null) {
                                                        Fluttertoast.showToast(msg: "Your Facebook Account not registerd with Email");
                                                      }
                                                      else if(
                                                      isLoggedIn == true
                                                      ){
                                                        con.emailController.text = userData["email"];
                                                        print(userData.toString());
                                                        var userDatas = {
                                                          "email": userData["email"].toString(),
                                                          "firstname": userData['name'].toString(),
                                                          "lastname": "",
                                                          "socialid": userData['id'].toString(),
                                                          "mediatype": "Facebook",
                                                         "mobile":"",
                                                          "geoid": RegisterAPI.dropdownvalue["geoid"].toString()
                                                        };
                                                        con.registerSignAPI(userDatas);
                                                        GetStorage().write('username', userData['name']
                                                        );
                        
                                                      }
                                                      else {
                                                        Fluttertoast.showToast(msg: "Check Your Facebook Account");
                                                      }
                                                    });
                                                  });
                                                }else{
                                                  Fluttertoast.showToast(msg: "Please Check Privacy Clause");
                                                }
                        
                                              }, //tton pressed
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <Widget>[
                                                                SizedBox(
                                                                    width: 30),
                                                                Image.asset(
                                                                    "assets/fb.png",
                                                                    width: 32),
                                                                SizedBox(
                                                                    width: 15),
                                                                Text(
                                                                    "Sign Up using Facebook",
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0XFF413D4B),
                                                                        fontSize:
                                                                            16,
                                                                        fontFamily:
                                                                            'sora',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold)),
                                                                // text
                                                              ],
                                                            )),
                                                      )),
                                                  buildbutton(),
                                                  buildformweb()
                                                ])),
                                            // buildToptitle(),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    )
                  : Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Container(
                        //   width: MediaQuery.of(context).size.width / 2.5,
                        //   color: Color(0XFF004751),
                        //   child: Center(
                        //       child: Image.asset("assets/applogo-02.png",
                        //           width:
                        //               MediaQuery.of(context).size.width / 1.5,
                        //           height:
                        //               MediaQuery.of(context).size.height / 3)),
                        // ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                           width: MediaQuery.of(context).size.width / 2,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    color: Styles.colorBackgroundBlock,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Stack(
                                          // alignment: Alignment.top,
                                          children: [
                                            Container(

                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                  buildtitle(),
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      // : MediaQuery.of(context).size.width / 2.5,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                          border: Border.all(
                                                              color: Color(
                                                                  0XFFB7C5C7),
                                                              width: 1.5),
                                                          color: Colors
                                                              .transparent),
                                                      margin:
                                                          EdgeInsets.all(15),
                                                      child: InkWell(
                                                        highlightColor:
                                                            Color(0XFFffffff),
                                                        focusColor:
                                                            Color(0XFFffffff),
                                                        splashColor: Colors
                                                            .green, // splash color
                                                        onTap: () {
                                                          // FacebookAuth.instance.login(
                                                          //     permissions: ["public_profile", "email"]).then((value) {
                                                          //   FacebookAuth.instance.getUserData().then((userData) {
                                                          //     setState(() {
                                                          //       isLoggedIn = true;
                                                          //       userObj = userData;
                                                          //     });
                                                          //     if (isLoggedIn == true) {
                                                          //       con.emailController.text = userData["email"];
                                                          //       print(userData.toString());
                                                          //       var userDatas = {
                                                          //         "email": userData["email"].toString(),
                                                          //         "firstname": userData['name'].toString(),
                                                          //         "lastname": "",
                                                          //         "socialid": userData['id'].toString(),
                                                          //         "mediatype": "Facebook"
                                                          //       };
                                                          //       con.registerSignAPI(userDatas);
                                                          //       GetStorage().write('username', userData['name']
                                                          //       );
                                                          //     } else {
                                                          //       Fluttertoast.showToast(msg: "Check Your Facebook Account");
                                                          //     }
                                                          //   });
                                                          // });
                                                        }, // button pressed
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                SizedBox(
                                                                    width: 30),
                                                                Image.asset(
                                                                    "assets/fb.png",
                                                                    width: 32),
                                                                SizedBox(
                                                                    width: 15),
                                                                Text(
                                                                    "Sign Up using Facebook",
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0XFF413D4B),
                                                                        fontSize:
                                                                            16,
                                                                        fontFamily:
                                                                            'sora',
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                // text
                                                              ],
                                                            )),
                                                      )),
                                                  buildbutton(),
                                                  buildformweb()
                                                ])),
                                            // buildToptitle(),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
    );
  }

  Widget buildToptitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.close,
                color: themeChange.darkTheme ? Colors.black : Colors.black,
                size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container()
        ]);
  }

  Widget buildtitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        height: MediaQuery.of(context).size.height / 3.7,
        alignment: Alignment.bottomRight,
        padding:
            Responsive.isMobile(context) ? EdgeInsets.all(10) : EdgeInsets.zero,
        child: Row(
            mainAxisAlignment: Responsive.isMobile(context)
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            crossAxisAlignment: Responsive.isMobile(context)
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              SizedBox(width: Responsive.isMobile(context) ? 0 : 0

                  ),
              Image.asset("assets/regnew.png", width: 107),
            ]));
  }

  Widget buildformweb() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: Responsive.isDesktop(context)
                        ? MediaQuery.of(context).size.width / 4.5
                        : MediaQuery.of(context).size.width / 2.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Use your Email",
                          style: TextStyle(
                              fontFamily: 'sora', fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          enabled: true,
                          //label: "Use your Email ",
                          keyboardType: TextInputType.emailAddress,
                          controller: con.emailController,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          // inputHint: 'Enter your email',
                          validator: (value) {
                            if (con.emailController.text.isEmpty) {
                              return "Please Enter The Email";
                            } else if (!con.emailController.text.contains("@")
                                //     ||
                                //     !emailController.text.endsWith('.com')||
                                // !emailController.text.endsWith('.co.in')
                                ) {
                              return "Please Enter The valid Email";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            hoverColor: Colors.transparent,
                            fillColor: Colors.white,
                            hintText: 'Enter your email',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle: const TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.normal,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            focusColor: Colors.grey.shade300,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                gapPadding: 7,
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            errorStyle: const TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            //alignment: Alignment.bottomLeft,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                              Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: themeChange.darkTheme
                                        ? Colors.white
                                        : Color(0xff004751)),
                                child: Checkbox(
                                  activeColor: themeChange.darkTheme
                                      ? Colors.white
                                      : Color(0xff004751),
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      if (isChecked) {
                                        isChecked = false;
                                      } else {
                                        isChecked = true;
                                        // showAlertDialog(context);
                                      }
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text("I agree to the",
                                  style: TextStyle(
                                      color: themeChange.darkTheme
                                          ? Colors.white
                                          : Color(0xff646464),
                                      fontSize: 16,
                                      fontFamily: 'sora',
                                      fontWeight: FontWeight.bold)),
                              InkWell(
                                onTap: () {
                                  showAlertDialog(context);
                                },
                                child: Text(
                                  ' Privacy Clause',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: themeChange.darkTheme
                                          ? Colors.white
                                          : HexColor('#004751')),
                                ),
                              ),
                            ])),
                      ],
                    ),
                  ),
                  AuthButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                      } else if (isChecked == false) {
                        Fluttertoast.showToast(
                            msg: "Please Accept Privacy Clause");
                      }

                      if (con.emailController.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter your Email Id');
                      } else if (isChecked == false) {
                        Fluttertoast.showToast(
                            msg: "Please Accept  Privacy Clause");
                      } else {
                        con.registerAPI(
                            con.emailController.text.toString()

                        );
                      }
                    },
                    // text: isChecked == false
                    //     ? 'Accept Terms & Condition'
                    text: "Register",
                    decoration: BoxDecoration(
                        color:
                            // isChecked == false
                            //     ? HexColor('#E9F9B2')
                            HexColor('#CEE812'),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () async {

                      Get.off(Login());
                    },
                    child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: ' Login',
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Color(0xff004751),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ])));
  }

//for desktop and tablet
  Widget bulidForm() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                      ],
                    ),
                  ),
                  Responsive.isMobile(context)
                      ? MyCustomInputBox(
                          enabled: true,
                          label: "Use your Email ",
                          keyboardType: TextInputType.emailAddress,
                          controller: con.emailController,
                          textInputAction: TextInputAction.next,
                          obsecureText: false,
                          inputHint: 'Enter your email',
                          validator: (value) {

                          },
                          inputDecoration: InputDecoration(
                            filled: true,
                            hoverColor: Colors.transparent,
                            fillColor: Colors.white,
                            hintText: 'Enter your email',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle: const TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            focusColor: Colors.grey.shade300,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                gapPadding: 7,
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            errorStyle: const TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container(
                          width: Responsive.isDesktop(context)
                              ? MediaQuery.of(context).size.width / 4.5
                              : MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Use your Email",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'sora'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                enabled: true,
                                //label: "Use your Email ",
                                keyboardType: TextInputType.emailAddress,
                                controller: con.emailController,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                // inputHint: 'Enter your email',
                                validator: (value) {
                                  if (con.emailController.text.isEmpty) {
                                    return "Please Enter The Email";
                                  } else if (!con.emailController.text
                                          .contains("@")  ) {
                                    return "Please Enter The valid Email";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  hoverColor: Colors.transparent,
                                  fillColor: Colors.white,
                                  hintText: 'Enter your email',
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  helperStyle: const TextStyle(
                                      fontFamily: 'Sora', fontSize: 14),
                                  hintStyle: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.normal,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  focusColor: Colors.grey.shade300,
                                  border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      gapPadding: 7,
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  errorStyle: const TextStyle(
                                      fontFamily: 'Sora',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(height: 90),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: Responsive.isMobile(context)
                            ? MainAxisAlignment.start
                            : Responsive.isDesktop(context)
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: Responsive.isMobile(context)
                                  ? MainAxisAlignment.start
                                  : Responsive.isDesktop(context)
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.start,
                              children: [

                                Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                      SizedBox(
                                          height: 20.0,
                                          width: 24.0,
                                          child: Theme(
                                            data: ThemeData(
                                                unselectedWidgetColor:
                                                    themeChange.darkTheme
                                                        ? Colors.white
                                                        : Color(0xff004751)),
                                            child: Checkbox(
                                              activeColor: themeChange.darkTheme
                                                  ? Colors.white
                                                  : Color(0xff004751),
                                              value: isChecked,
                                              onChanged: (value) {
                                                setState(() {
                                                  if (isChecked) {
                                                    isChecked = false;
                                                  } else {
                                                    isChecked = true;
                                                    // showAlertDialog(context);
                                                  }
                                                });
                                              },
                                            ),
                                          )),
                                      SizedBox(width: 10.0),
                                      Text("I agree to the ",
                                          style: TextStyle(
                                              color: themeChange.darkTheme
                                                  ? Colors.white
                                                  : Color(0xff646464),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'sora'))
                                    ])),
                                InkWell(
                                  onTap: () {
                                    showAlertDialog(context);
                                  },
                                  child: Text(
                                    'Privacy Clause.',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        fontSize: 16,
                                        fontFamily: 'sora',
                                        fontWeight: FontWeight.bold,
                                        color: themeChange.darkTheme
                                            ? Colors.white
                                            : HexColor('#004751')),
                                  ),
                                ),
                              ]),
                        ],
                      )),

                  //mobileview button
                  AuthButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        // Get.to(VerifyEmail());
                      } else if (isChecked == false) {
                        Fluttertoast.showToast(
                            msg: "Please Accept Terms and conditions");
                      }
                      if (con.emailController.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter your Email Id');
                      } else if (isChecked == false) {
                        Fluttertoast.showToast(
                            msg: "Please Accept Terms and conditions");
                      } else {
                        con.registerAPI(con.emailController.text.toString());
                      }
                    },
                    // text: isChecked == false
                    //     ? 'Accept Terms & Condition'
                    text: "Register",
                    decoration: BoxDecoration(
                        color:
                            // isChecked == false
                            //     ? HexColor('#E9F9B2')
                            HexColor('#CEE812'),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      Get.off(Login());
                    },
                    child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: ' Login',
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Color(0xff004751),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ])));
  }

  Widget buildbutton() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Responsive.isMobile(context)? Column(children: [
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Color(0XFFB7C5C7), width: 1.5),
            color: Color(0XFFffffff),
          ),
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(10),
          child: InkWell(
            highlightColor: Color(0XFFffffff),
            focusColor: Color(0XFFffffff),
            splashColor: Colors.green, // splash color
            onTap: () async {
              //Gmail Auth
            if(isChecked==true){
              AuthService().signinWithGoogle();
            }else{
              Fluttertoast.showToast(msg: "Please Check Terms and Conditions");
            }
            }, // button pressed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 20),
                Image.asset("assets/google.png", width: 32),
                SizedBox(width: 15),
                Text("Sign Up using Google",
                    style: TextStyle(
                        color: Color(0XFF413D4B),
                        fontSize: 16,
                        fontFamily: 'sora',
                        fontWeight: FontWeight.bold)), // text
              ],
            ),
          )),
      const SizedBox(height: 10),
      Text('Or',
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'sora',
              color:
                  themeChange.darkTheme ? Colors.white : HexColor('#413D4B'))),
      const SizedBox(height: 10),
    ]):Column(children: [
      // const SizedBox(height: 10),
      Container(

          // height: Responsive.isMobile(context)
          //     ? MediaQuery.of(context).size.height /10
          //     : Responsive.isDesktop(context)
          //         ? MediaQuery.of(context).size.height /14
          //         : MediaQuery.of(context).size.height / 14,
           width: Responsive.isMobile(context)
               ? MediaQuery.of(context)
              .size
              .width /
               1
               : Responsive.isDesktop(context)
             ? MediaQuery.of(context)
             .size
              .width /
              4.3
              : MediaQuery.of(context)
              .size
              .width /
              2.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Color(0XFFB7C5C7), width: 1.5),
            color: Color(0XFFffffff),
          ),
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(10),
          child: InkWell(
            highlightColor: Color(0XFFffffff),
            focusColor: Color(0XFFffffff),
            splashColor: Colors.green, // splash color
            onTap: () async {
              //Gmail Auth
            if(isChecked==true){
              AuthService().signinWithGoogle();
            }else{
              Fluttertoast.showToast(msg: "Please Check Privacy Clause");
            }
            }, // button pressed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 20),
                Image.asset("assets/google.png", width: 32),
                SizedBox(width: 15),
                Text("Sign Up using Google",
                    style: TextStyle(
                        color: Color(0XFF413D4B),
                        fontSize: 16,
                        fontFamily: 'sora',
                        fontWeight: FontWeight.bold)), // text
              ],
            ),
          )),
      const SizedBox(height: 10),
      Text('Or',
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'sora',
              color:
                  themeChange.darkTheme ? Colors.white : HexColor('#413D4B'))),
      const SizedBox(height: 10),
    ]);
  }


  showAlertDialog(BuildContext context) {
    Widget okButton = Center(
      child: Container(
          alignment: Alignment.center,
          width:Responsive.isMobile(context)? 300:MediaQuery.of(context).size.width / 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Color(0XFF004751)),
          margin: EdgeInsets.all(15),
          child: InkWell(
            highlightColor: Color(0XFF004751),
            focusColor: Color(0XFF004751),
            splashColor: Colors.green, // splash color
            onTap: () {
              setState(() {
                Navigator.pop(context);
                isChecked = true;
              });
            }, // button pressed
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Accept and Proceed",
                style: TextStyle(color: Color(0XFFCEE812), fontSize: 12),
              ),
              // text
            ),
          )),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Privacy Policy"),
      content: Container(
        margin: EdgeInsets.all(5),
        height:
              Responsive.isMobile(context)?
            MediaQuery.of(context).size.height / 1
         : MediaQuery.of(context).size.height / 2,
        width:
             Responsive.isMobile(context)?
            MediaQuery.of(context).size.width / 1
        : MediaQuery.of(context).size.width / 2,
        child: ListView.builder(
            itemCount: con.privacycontent.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(5),
                      child:Html(
                      data: con.privacycontent["privacyclause"].toString(),
                        style: {
                          "body": Style(
                            fontSize: FontSize(14.0),
                              textAlign: TextAlign.left,
                              fontFamily: 'sora'
                          ),
                        },
                      )
                      // Text(
                      //     con.privacycontent["privacyclause"].toString(),
                      //     textAlign: TextAlign.left,
                      //     style: TextStyle(
                      //         fontSize: 13,
                      //         color: Colors.black,
                      //         fontFamily: 'sora')
              // )
              ),
                ],
              );
            }),
      ),
      actions: [okButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}