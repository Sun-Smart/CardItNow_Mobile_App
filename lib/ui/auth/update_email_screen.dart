// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import

import 'package:cardit/ui/auth/update_password_code_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../api/regster_api.dart';
import '../../const/responsive.dart';

class UpdateEmailScreen extends StatefulWidget {

   UpdateEmailScreen({Key? key,}) : super(key: key);

  @override
  State<UpdateEmailScreen> createState() => _UpdateEmailScreenState();
}

class _UpdateEmailScreenState extends State<UpdateEmailScreen> {
  final formKey = GlobalKey<FormState>();
  final RegisterAPI con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive.isMobile(context)?Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 20, bottom: 30),
                    margin: EdgeInsets.only(top: 40),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildToptitle(),
                          buildtitle(),
                        ])),
                bulidForm(),
                SizedBox(height: 10),
              ],
            ),
          )): Responsive.isDesktop(context)?Row(children: [
                 Container(
                    width: MediaQuery.of(context).size.width / 3,
                    //height: MediaQuery.of(context).size.width / 1,
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
                  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                     width: MediaQuery.of(context).size.width / 1.5,
                    padding: EdgeInsets.only(top: 20, bottom: 30),
                    margin: EdgeInsets.only(top: 40),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start
                            ,
                            children: [
                              buildToptitle(),
                            ],
                          ),
                          buildtitle(),
                          SizedBox(height: 20,),
                          bulidForm(),
                        ])),
                
                SizedBox(height: 30),
                GestureDetector(
        onTap: () {
       if(con.emailController.text.isEmpty){
         Fluttertoast.showToast(msg: "Enter your Email Id");
       }else{

         con.forgotPasswordOTP(con.emailController.text.toString().trim(),

         );
       }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width:  MediaQuery.of(context).size.width / 4.4
             ,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            "Next",
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
                  ]):Row(children: [
                 Container(
                    width: MediaQuery.of(context).size.width / 3,
                   // height: MediaQuery.of(context).size.width / 1,
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
                   Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                     width: MediaQuery.of(context).size.width / 1.5,
                    padding: EdgeInsets.only(top: 20, bottom: 30),
                    margin: EdgeInsets.only(top: 40),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start
                            ,
                            children: [
                              buildToptitle(),
                            ],
                          ),
                          buildtitle(),
                            SizedBox(height: 20,),
                          bulidForm(),
                        ])),
             
                SizedBox(height: 30),
                GestureDetector(
       onTap: () {
       if(con.emailController.text.isEmpty){
         Fluttertoast.showToast(msg: "Enter your Email Id");
       }else{

         con.forgotPasswordOTP(con.emailController.text.toString().trim(),

         );
       }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width:  MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            "Next",
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
                 ]),
      bottomSheet:Responsive.isMobile(context)? buildbutton():null,
    );
  }

  Widget buildToptitle() {
    return Responsive.isMobile(context)? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
            onPressed: () {
             Get.back();
            },
          ),
          Container()
        ]): Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
            onPressed: () {
              Get.back();
            },
          ),
          Container()
        ]);
  }

  Widget buildtitle() {
    return Responsive.isMobile(context)?Container(
        padding: EdgeInsets.all(15),
        child: Text('Forgot \nPassword',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))):
            Container(
        padding: EdgeInsets.all(15),
        child: Text('Forgot Password',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)));
  }
//for web and tab also.....
  Widget bulidForm() {
    return Responsive.isMobile(context)? Form(
      key: formKey,
      child: MyCustomInputBox(
        enabled: true,
        label: "Enter Email/Phone number",
        controller: con.emailController,
        obsecureText: false,
        validator: (value) {
          if (con.emailController.text.isEmpty) {
            return "Please Enter The Email";
          } else if (!con.emailController.text.contains("@") ||
              !con.emailController.text.endsWith('.com')) {
            return "Please Enter The valid Email";
          } else {
            return null;
          }
        },
        inputDecoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Enter Email/Phone Number',
          floatingLabelBehavior: FloatingLabelBehavior.never,
          helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
          hintStyle: const TextStyle(
              fontSize: 12, fontFamily: 'Sora', fontWeight: FontWeight.normal),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          focusColor: Colors.grey.shade300,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              gapPadding: 7,
              borderSide: const BorderSide(color: Colors.grey)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.grey)),
          errorStyle: const TextStyle(
              fontFamily: 'Sora', fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    ):Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4.8:
              MediaQuery.of(context).size.width/12,),
Text("Enter Email",
 style: TextStyle(fontFamily: 'Sora', fontSize: 16,fontWeight: FontWeight.bold),
)
            ],
          ),
          SizedBox(height: 10,),
          Container(
            width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width/4:
            MediaQuery.of(context).size.width/2,
            child: TextFormField(
              enabled: true,
             /// label: "Enter Email",
              controller: con.emailController,
              obscureText: false,
              validator: (value) {
                if (con.emailController.text.isEmpty) {
                  return "Please Enter The Email";
                } else if (!con.emailController.text.contains("@") ||
                    !con.emailController.text.endsWith('.com')) {
                  return "Please Enter The valid Email";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hoverColor: Colors.transparent,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter Email',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                    fontSize: 12, fontFamily: 'Sora', fontWeight: FontWeight.normal),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                focusColor: Colors.grey.shade300,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    gapPadding: 7,
                    borderSide: const BorderSide(color: Colors.grey)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey)),
                errorStyle: const TextStyle(
                    fontFamily: 'Sora', fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
      onTap: () {
       if(con.emailController.text.isEmpty){
         Fluttertoast.showToast(msg: "Enter your Email Id");
       }else{

         con.forgotPasswordOTP(con.emailController.text.toString().trim(),

         );
       }
      },
      text: "Next",
    );
  }
}
