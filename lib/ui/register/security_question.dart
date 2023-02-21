// ignore_for_file: prefer_const_declarations, prefer_const_constructors, avoid_print, avoid_unnecessary_containers

import 'package:cardit/auth/auth.dart';
import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/ui/register/register_screen.dart';
import 'package:cardit/ui/register/terms&condition.dart';
import 'package:cardit/ui/register/twofactor.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class SecurityQuestion extends StatefulWidget {
  const SecurityQuestion({Key? key}) : super(key: key);

  @override
  State<SecurityQuestion> createState() => _SecurityQuestionState();
}

class _SecurityQuestionState extends State<SecurityQuestion> {
  final AuthCon auth = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Responsive.isMobile(context)
              ? Column(
          // crossAxisAlignment: Responsive.isMobile(context)
          //     ? CrossAxisAlignment.start
          //     : Responsive.isDesktop(context)
          //     ? CrossAxisAlignment.center
          //     : CrossAxisAlignment.center,
          children: [
            Text("Security Questions",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#004751'))),
            ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                itemCount: auth.securityQuestionList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var item = auth.securityQuestionList[index];
                  return
                    SingleChildScrollView(
                      child: InkWell(
                        hoverColor: Colors.transparent,
                        onTap: () {
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 5),

                          child: Text("${item['label']}"),

                        ),
                      ),
                    );
                }),

          ],
        ): Responsive.isDesktop(context)?Row(
          children: [
            Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.width / 1,
                          color: Color(0XFF004751),
                          child: Center(
                              child: Image.asset("assets/applogo-02.png",
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  height:
                                      MediaQuery.of(context).size.height / 3)),
                        ),
                        Container(
                           width: MediaQuery.of(context).size.width / 1.5,
                          child: Column(
                                  // crossAxisAlignment: Responsive.isMobile(context)
                                  //     ? CrossAxisAlignment.start
                                  //     : Responsive.isDesktop(context)
                                  //     ? CrossAxisAlignment.center
                                  //     : CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 20,),
                                    Text("Security Questions",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: HexColor('#004751'))),
                                    ListView.builder(
                                        physics: ScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.all(10),
                                        itemCount: auth.securityQuestionList.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          var item = auth.securityQuestionList[index];
                                          return
                                            SingleChildScrollView(
                                              child: InkWell(
                          hoverColor: Colors.transparent,
                          onTap: () {
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                        
                            child: Text("${item['label']}"),
                        
                          ),
                                              ),
                                            );
                                        }),
                                        SizedBox(height: 50,),
                                        AuthButton(
          decoration: BoxDecoration(
            color: HexColor('#CEE812'),
            borderRadius: BorderRadius.circular(5),
          ),
          onTap: () {
            if(kIsWeb){
              Get.to(() => termsandconditions());
            } else{
              Get.to(() => Twofactor());
            }
          },
          text: "Next",
        ),
                        
                                  ],
                                ),
                        )
          ],
        ):Row(
          children: [
            Container(
                      width: MediaQuery.of(context).size.width / 3,
                    //  height: MediaQuery.of(context).size.width / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Image.asset("assets/applogo-02.png",
                                width: MediaQuery.of(context).size.width / 1.5, height:  MediaQuery.of(context).size.height / 3
                              )),
                    ),
                       Container(
                           width: MediaQuery.of(context).size.width / 1.5,
                          child: Column(
                                  // crossAxisAlignment: Responsive.isMobile(context)
                                  //     ? CrossAxisAlignment.start
                                  //     : Responsive.isDesktop(context)
                                  //     ? CrossAxisAlignment.center
                                  //     : CrossAxisAlignment.center,
                                  children: [
                                     SizedBox(height: 20,),
                                    Text("Security Questions",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: HexColor('#004751'))),
                                    ListView.builder(
                                        physics: ScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.all(10),
                                        itemCount: auth.securityQuestionList.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          var item = auth.securityQuestionList[index];
                                          return
                                            SingleChildScrollView(
                                              child: InkWell(
                          hoverColor: Colors.transparent,
                          onTap: () {
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                        
                            child: Text("${item['label']}"),
                        
                          ),
                                              ),
                                            );
                                        }),
                                        SizedBox(height: 50,),
                                        AuthButton(
          decoration: BoxDecoration(
            color: HexColor('#CEE812'),
            borderRadius: BorderRadius.circular(5),
          ),
          onTap: () {
            if(kIsWeb){
              Get.to(() => termsandconditions());
            } else{
              Get.to(() => Twofactor());
            }
          },
          text: "Next",
        ),
                        
                                  ],
                                ),
                        )
         
          ],
        ),
        bottomSheet: Responsive.isMobile(context)? AuthButton(
          decoration: BoxDecoration(
            color: HexColor('#CEE812'),
            borderRadius: BorderRadius.circular(5),
          ),
          onTap: () {
            if(kIsWeb){
              Get.to(() => termsandconditions());
            } else{
              Get.to(() => Twofactor());
            }
          },
          text: "Next",
        ):null
      ),
    );
  }

}
