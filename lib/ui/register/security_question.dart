
import 'package:cardit/const/responsive.dart';
import 'package:cardit/ui/register/terms&condition.dart';
import 'package:cardit/ui/register/twofactor.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../api/regster_api.dart';
import '../../themes/styles.dart';

class SecurityQuestion extends StatefulWidget {
  const SecurityQuestion({Key? key}) : super(key: key);

  @override
  State<SecurityQuestion> createState() => _SecurityQuestionState();
}

class _SecurityQuestionState extends State<SecurityQuestion> {
  final RegisterAPI auth = Get.find();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar:
              AppBar(
            backgroundColor: Colors.transparent,
            leading: BackButton(
              onPressed: (){Get.back();},
              color: HexColor('#004751'),
            ),

          ),
        body:Responsive.isMobile(context)
              ? Container(
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
Obx(() =>Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 40,
      ),
      Text(
      'Choose Your Question',
        style: TextStyle(fontFamily: 'Sora', fontSize: 16,fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 30),
      Container(

        decoration: BoxDecoration(
            border:
            Border.all(color: const Color(0XffB7C5C7), width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(3))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButton(
            underline: const SizedBox(),
            dropdownColor: Colors.white,
            isExpanded: true,
            value: auth.securequestions,
            hint: Text('Choose Your Questions',
                style: TextStyle(
                    color: Styles.whitecustomlable, fontSize: 14)),
            icon: InkWell(
                child: Icon(
                  Icons.keyboard_arrow_down,

                )),
            items: auth.securityQuestionList.map((dynamic item) {
              return DropdownMenuItem(
                  value: item,
                  child: Text(item["question"],
                      style: const TextStyle(
                          color: Color(0Xff413D4B), fontSize: 14)));
            }).toList(),
            onChanged: (dynamic newValue) {
              setState(() {
                auth.securequestions = newValue!;
              });
            },
            style: const TextStyle(color: Colors.black,fontFamily: "Sora",fontWeight: FontWeight.bold),
          ),
        ),
      ),
      SizedBox(height: 20,),
      auth.securequestions!=null?
      TextFormField(
        decoration: InputDecoration(

          hintText: "Answer Your Question",

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black,
                  width: 1.0)
          ),
        ),

        textAlign: TextAlign.start,
        controller:  auth.securityquestioncontroller,
        autofocus: false,
        keyboardType: TextInputType.text,):SizedBox()


    ],
  ),

),
),

          ],
        ),
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

                            child: Text("${item["question"]}"),

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
                        
                            child: Text("${item["question"]}"),
                        
                          ),
                                              ),
                                            );
                                        }),

                        
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
          if(auth.securityquestioncontroller.text.isEmpty){
            Fluttertoast.showToast(msg: "Please Enter Your Answer");
          }else{
            auth.securityPost();
          }
          },
          text: "Next",
        ):null
      ),
    );
  }

}
