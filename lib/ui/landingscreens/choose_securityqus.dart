import 'package:cardit/api/regster_api.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../const/responsive.dart';
import '../../themes/styles.dart';

class ChooseSecQus extends StatefulWidget {
  final customeridqusestion;
   ChooseSecQus({Key? key,this.customeridqusestion}) : super(key: key);

  @override
  State<ChooseSecQus> createState() => _ChooseSecQusState();
}

class _ChooseSecQusState extends State<ChooseSecQus> {
  final RegisterAPI auth = Get.find();
  List<TextEditingController> protectcontrollers = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar:
          Responsive.isMobile(context)
              ? AppBar(
            backgroundColor: Colors.transparent,
            leading: BackButton(
              onPressed: (){Get.back();},
              color: HexColor('#004751'),
            ),

          ):null,
          body:Responsive.isMobile(context)
              ? SingleChildScrollView(
                child: Container(
            margin: EdgeInsets.all(15),
            child: Column(

                children: [


                  Row(
                    children: [
                      Text("Security Questions",
                          style: TextStyle(
                              fontSize: 24,fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,
                              color: HexColor('#004751'))),
                    ],
                  ),
                  Obx(() =>Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),


                      ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: auth.securedetailslist.length,
                          itemBuilder: (BuildContext context, int index) {
                            protectcontrollers.add(new TextEditingController());
                            return Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${auth.securedetailslist[index]["question"]}",
                                    style: TextStyle(fontFamily: 'Sora', fontSize: 16,fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),

                                  TextFormField(
                                    textAlign: TextAlign.start,
                                    controller:  protectcontrollers[index],
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
                                    ),),
                                  SizedBox(height: 30,),
                                ],

                              ),);}),
                      SizedBox(height: 30,),



                    ],
                  ),
                  ),

                ],
            ),
          ),
              ): Responsive.isDesktop(context)?Row(
            children: [
              Container(
                    width: MediaQuery.of(context).size.width / 3,
                  //  height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/logoweb.png",
                                width: 140, height: 75),
                                SizedBox(height: 15),
                                  Text('"Make your life simple"',
                  style: TextStyle(
                    letterSpacing: 1,
                  fontSize: 16, color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'sora'
                  ),
                ),
                          ],
                        )),
                  ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child:  Column(

                  children: [
                    Row(
                      children: [
                        BackButton(

                          onPressed: (){Get.back();},

                          color: HexColor('#004751'),

                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Security Questions",
                            style: TextStyle(
                                fontSize: 24,fontFamily: 'Sora',
                                fontWeight: FontWeight.bold,
                                color: HexColor('#004751'))),
                      ],
                    ),
                    Obx(() =>Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                         ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: auth.securedetailslist.length,
                          itemBuilder: (BuildContext context, int index) {
                            protectcontrollers.add(new TextEditingController());
                            return Container(
                                width: MediaQuery.of(context).size.width / 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${auth.securedetailslist[index]["question"]}",
                                    style: TextStyle(fontFamily: 'Sora', fontSize: 16,fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),

                                  Container(
                                 width: MediaQuery.of(context).size.width / 4,
                                    child: TextFormField(
                                      textAlign: TextAlign.start,
                                      controller:  protectcontrollers[index],
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
                                      ),),
                                  ),
                                  SizedBox(height: 30,),
                                ],

                              ),);}),
                      SizedBox(height: 30,),
                        ],
                      ),

                    ),
                    ),
                    AuthButton(
                      decoration: BoxDecoration(
                        color: HexColor('#CEE812'),
                        borderRadius: BorderRadius.circular(5),
                      ),
                       onTap: () {
              var checklist = [];

              for (var i = 0; i < protectcontrollers.length; i++) {
                if (protectcontrollers[i].text.isNotEmpty) {
                  var body = {
                    "securityquestionid": auth.securedetailslist[i]["securityquestionid"],
                    "customerid": widget.customeridqusestion,
                    "questionid": auth.securedetailslist[i]["questionid"],
                    "answer": protectcontrollers[i].text,
                    "status": ""
                  };
                  checklist.add(body);
                }
              }
              if (checklist.isEmpty) {
                Fluttertoast.showToast(
                    msg: "Please Enter Your Valid Answers");
              } else {
                auth.securitycheck(checklist);
              }
            },
                      text: "Next",
                    )
                  ],
                ),
              )
            ],
          ):Row(
            children: [
              Container(
                    width: MediaQuery.of(context).size.width / 3,
                 //   height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/logoweb.png",
                                width: 140, height: 75),
                                SizedBox(height: 15),
                                  Text('"Make your life simple"',
                  style: TextStyle(
                    letterSpacing: 1,
                  fontSize: 16, color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'sora'
                  ),
                ),
                          ],
                        )),
                  ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(

                  children: [
                    Row(
                      children: [
                        BackButton(

                          onPressed: (){Get.back();},

                          color: HexColor('#004751'),

                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Security Questions",
                            style: TextStyle(
                                fontSize: 24,fontFamily: 'Sora',
                                fontWeight: FontWeight.bold,
                                color: HexColor('#004751'))),
                      ],
                    ),
                    Obx(() =>Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                             ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: auth.securedetailslist.length,
                          itemBuilder: (BuildContext context, int index) {
                            protectcontrollers.add(new TextEditingController());
                            return Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${auth.securedetailslist[index]["question"]}",
                                    style: TextStyle(fontFamily: 'Sora', fontSize: 16,fontWeight: FontWeight.bold),
                                  ),
                                
                                  SizedBox(
                                    height: 15,
                                  ),

                                  Container(
                                 width: MediaQuery.of(context).size.width / 2.5,
                                    child: TextFormField(
                                      textAlign: TextAlign.start,
                                      controller:  protectcontrollers[index],
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
                                      ),),
                                  ),
                                  SizedBox(height: 30,),
                                ],

                              ),);}),
                  
                         
                        ],
                      ),

                    ),
                    ),
                    AuthButton(
                      decoration: BoxDecoration(
                        color: HexColor('#CEE812'),
                        borderRadius: BorderRadius.circular(5),
                      ),
                       onTap: () {
              var checklist = [];

              for (var i = 0; i < protectcontrollers.length; i++) {
                if (protectcontrollers[i].text.isNotEmpty) {
                  var body = {
                    "securityquestionid": auth.securedetailslist[i]["securityquestionid"],
                    "customerid": widget.customeridqusestion,
                    "questionid": auth.securedetailslist[i]["questionid"],
                    "answer": protectcontrollers[i].text,
                    "status": ""
                  };
                  checklist.add(body);
                }
              }
              if (checklist.isEmpty) {
                Fluttertoast.showToast(
                    msg: "Please Enter Your Valid Answers");
              } else {
                auth.securitycheck(checklist);
              }
            },
                      text: "Next",
                    )
                  ],
                ),
              )

            ],
          ),
          bottomNavigationBar: Responsive.isMobile(context)? AuthButton(
            decoration: BoxDecoration(
              color: HexColor('#CEE812'),
              borderRadius: BorderRadius.circular(5),
            ),
            onTap: () {
              var checklist = [];

              for (var i = 0; i < protectcontrollers.length; i++) {
                if (protectcontrollers[i].text.isNotEmpty) {
                  var body = {
                    "securityquestionid": auth.securedetailslist[i]["securityquestionid"],
                    "customerid": widget.customeridqusestion,
                    "questionid": auth.securedetailslist[i]["questionid"],
                    "answer": protectcontrollers[i].text,
                    "status": ""
                  };
                  checklist.add(body);
                }
              }
              if (checklist.isEmpty) {
                Fluttertoast.showToast(
                    msg: "Please Enter Your Valid Answers");
              } else {
                auth.securitycheck(checklist);
              }
            },
            text: "Next",
          ):null
      ),
    );
  }
}
