// ignore_for_file: prefer_const_declarations, prefer_const_constructors, avoid_print, avoid_unnecessary_containers

import 'package:cardit/api/regster_api.dart';
import 'package:cardit/const/responsive.dart';
import 'package:cardit/ui/register/twofactor.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../themes/styles.dart';

class SecurityQuestion extends StatefulWidget {
  const SecurityQuestion({Key? key}) : super(key: key);

  @override
  State<SecurityQuestion> createState() => _SecurityQuestionState();
}

class _SecurityQuestionState extends State<SecurityQuestion> {
  final RegisterAPI auth = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    securecontrollers.clear();
    super.initState();
  }

  List<TextEditingController> securecontrollers = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: Responsive.isMobile(context)
              ? AppBar(
                  backgroundColor: Colors.transparent,
                  leading: BackButton(
                    onPressed: () {
                      Get.back();
                    },
                    color: HexColor('#004751'),
                  ),
                )
              : null,
          body: Responsive.isMobile(context)
              ? SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Security Questions",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#004751'))),
                          ],
                        ),
                       Obx(() =>  Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(
                             height: 40,
                           ),
                           ListView.builder(
                               shrinkWrap: true,
                               scrollDirection: Axis.vertical,
                               physics: ScrollPhysics(),
                               itemCount: auth.securityQuestionList.length,
                               itemBuilder: (BuildContext context, int index) {
                                 securecontrollers
                                     .add(TextEditingController());
                                 return Container(
                                   child: Column(
                                     crossAxisAlignment:
                                     CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         "${auth.securityQuestionList[index]["question"]}",
                                         style: TextStyle(
                                             fontFamily: 'Sora',
                                             fontSize: 16,
                                             fontWeight: FontWeight.bold),
                                       ),
                                       SizedBox(height: 20),
                                       Container(

                                         child: TextFormField(
                                           textAlign: TextAlign.start,
                                           controller:
                                           securecontrollers[index],
                                           autofocus: false,
                                           keyboardType: TextInputType.text,
                                           decoration: InputDecoration(
                                             enabledBorder: OutlineInputBorder(
                                               borderSide: BorderSide(
                                                 width: 1, //<-- SEE HERE
                                                 color: Colors.black,
                                               ),
                                               borderRadius:
                                               BorderRadius.circular(10.0),
                                             ),
                                             focusedBorder: OutlineInputBorder(
                                               borderSide: BorderSide(
                                                 width: 1, //<-- SEE HERE
                                                 color: Colors.black,
                                               ),
                                               borderRadius:
                                               BorderRadius.circular(10.0),
                                             ),
                                           ),
                                         ),
                                       ),
                                       SizedBox(
                                         height: 10,
                                       )
                                     ],
                                   ),
                                 );
                               }),
                         ],
                       ),)
                      ],
                    ),
                  ),
                )
              : Responsive.isDesktop(context)
                  ? SingleChildScrollView(

                    child: Container(
                      child: Column(
                        children: [
                          Row(
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
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          BackButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            color: HexColor('#004751'),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Security Questions",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontFamily: 'Sora',
                                                  fontWeight: FontWeight.bold,
                                                  color: HexColor('#004751'))),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Obx(() => Container(
                                            width:
                                            MediaQuery.of(context).size.width / 4.5,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ScrollPhysics(),
                                                itemCount:
                                                auth.securityQuestionList.length,
                                                itemBuilder:
                                                    (BuildContext context, int index) {
                                                  securecontrollers
                                                      .add(TextEditingController());
                                                  return Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "${auth.securityQuestionList[index]["question"]}",
                                                          style: TextStyle(
                                                              fontFamily: 'Sora',
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),
                                                        SizedBox(height: 20),
                                                        Container(
                                                          width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                              4.5,
                                                          child: TextFormField(
                                                            textAlign: TextAlign.start,
                                                            controller:
                                                            securecontrollers[
                                                            index],
                                                            autofocus: false,
                                                            keyboardType:
                                                            TextInputType.text,
                                                            decoration: InputDecoration(
                                                              enabledBorder:
                                                              OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                  width:
                                                                  1, //<-- SEE HERE
                                                                  color: Colors.black,
                                                                ),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(10.0),
                                                              ),
                                                              focusedBorder:
                                                              OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                  width:
                                                                  1, //<-- SEE HERE
                                                                  color: Colors.black,
                                                                ),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          ),),
                                          SizedBox(
                                            height: 20,
                                          ),
                                            AuthButton(
                                        decoration: BoxDecoration(
                                          color: HexColor('#CEE812'),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        onTap: () {
                    var answerList = [];
                    print(auth.securityQuestionList[0]["questionid"]);
                    for (var i = 0; i < securecontrollers.length; i++) {
                      if (securecontrollers[i].text.isNotEmpty) {
                        var body = {
                          "securityquestionid": null,
                          "customerid": int.parse(GetStorage().read("custid")),
                          "questionid": auth.securityQuestionList[i]
                              ["questionid"],
                          "answer": securecontrollers[i].text,
                          "status": ""
                        };
                        answerList.add(body);
                      }
                    }
                    if (answerList.length < 3) {
                      Fluttertoast.showToast(
                          msg: "You must answer 3 Questions");
                    } else {
                      auth.securityPost(answerList);
                    }
                  },
                                        text: "Next",
                                      )
                                                               
                                        ],
                                      ),
                                     ],
                                  ),
                                )
                              ],
                            ),
                        ],
                      ),
                    ),
                  )
                  : SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                              children: [
                                // Container(
                                //   width: MediaQuery.of(context).size.width / 3,
                                //   //  height: MediaQuery.of(context).size.width / 1,
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
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          BackButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            color: HexColor('#004751'),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Security Questions",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontFamily: 'Sora',
                                                  fontWeight: FontWeight.bold,
                                                  color: HexColor('#004751'))),
                                        ],
                                      ),
                                   Obx(() =>    Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       SizedBox(
                                         height: 40,
                                       ),
                                       ListView.builder(
                                           shrinkWrap: true,
                                           scrollDirection: Axis.vertical,
                                           physics: ScrollPhysics(),
                                           itemCount:
                                           auth.securityQuestionList.length,
                                           itemBuilder:
                                               (BuildContext context, int index) {
                                             securecontrollers
                                                 .add(TextEditingController());
                                             return Container(
                                               child: Column(
                                                 crossAxisAlignment:
                                                 CrossAxisAlignment.start,
                                                 children: [
                                                   Row(
                                                     children: [
                                                       SizedBox(
                                                           width:
                                                           MediaQuery.of(context)
                                                               .size
                                                               .width /
                                                               10),
                                                       Text(
                                                         "${auth.securityQuestionList[index]["question"]}",
                                                         style: TextStyle(
                                                             fontFamily: 'Sora',
                                                             fontSize: 16,
                                                             fontWeight:
                                                             FontWeight.bold),
                                                       ),
                                                     ],
                                                   ),
                                                   SizedBox(height: 20),
                                                   Container(
                                                     width: MediaQuery.of(context)
                                                         .size
                                                         .width /
                                                         2.5,
                                                     child: TextFormField(
                                                       textAlign: TextAlign.start,
                                                       controller:
                                                       securecontrollers[index],
                                                       autofocus: false,
                                                       keyboardType:
                                                       TextInputType.text,
                                                       decoration: InputDecoration(
                                                         enabledBorder:
                                                         OutlineInputBorder(
                                                           borderSide: BorderSide(
                                                             width: 1, //<-- SEE HERE
                                                             color: Colors.black,
                                                           ),
                                                           borderRadius:
                                                           BorderRadius.circular(
                                                               10.0),
                                                         ),
                                                         focusedBorder:
                                                         OutlineInputBorder(
                                                           borderSide: BorderSide(
                                                             width: 1, //<-- SEE HERE
                                                             color: Colors.black,
                                                           ),
                                                           borderRadius:
                                                           BorderRadius.circular(
                                                               10.0),
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                   SizedBox(
                                                     height: 10,
                                                   )
                                                 ],
                                               ),
                                             );
                                           }),
                                     ],
                                   ),),
                                      AuthButton(
                                        decoration: BoxDecoration(
                                          color: HexColor('#CEE812'),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        onTap: () {
                    var answerList = [];
                    print(auth.securityQuestionList[0]["questionid"]);
                    for (var i = 0; i < securecontrollers.length; i++) {
                      if (securecontrollers[i].text.isNotEmpty) {
                        var body = {
                          "securityquestionid": null,
                          "customerid": int.parse(GetStorage().read("custid")),
                          "questionid": auth.securityQuestionList[i]
                              ["questionid"],
                          "answer": securecontrollers[i].text,
                          "status": ""
                        };
                        answerList.add(body);
                      }
                    }
                    if (answerList.length < 3) {
                      Fluttertoast.showToast(
                          msg: "You must answer 3 Questions");
                    } else {
                      auth.securityPost(answerList);
                    }
                  },
                                        text: "Next",
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
          bottomNavigationBar: Responsive.isMobile(context)
              ? AuthButton(
                  decoration: BoxDecoration(
                    color: HexColor('#CEE812'),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onTap: () {
                    var answerList = [];
                    print(auth.securityQuestionList[0]["questionid"]);
                    for (var i = 0; i < securecontrollers.length; i++) {
                      if (securecontrollers[i].text.isNotEmpty) {
                        var body = {
                          "securityquestionid": null,
                          "customerid": int.parse(GetStorage().read("custid")),
                          "questionid": auth.securityQuestionList[i]
                              ["questionid"],
                          "answer": securecontrollers[i].text,
                          "status": ""
                        };
                        answerList.add(body);
                      }
                    }
                    if (answerList.length < 3) {
                      Fluttertoast.showToast(
                          msg: "You must answer 3 Questions");
                    } else {
                      auth.securityPost(answerList);
                    }
                  },
                  text: "Next",
                )
              : null),
    );
  }
}
