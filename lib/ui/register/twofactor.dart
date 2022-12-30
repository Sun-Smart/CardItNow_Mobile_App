import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'select_avatar_screen.dart';

class Twofactor extends StatefulWidget {
  const Twofactor({Key? key}) : super(key: key);

  @override
  State<Twofactor> createState() => _TwofactorState();
}

class _TwofactorState extends State<Twofactor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: buildbutton(),
        appBar: AppBar(

          backgroundColor: Colors.transparent,
          leading: BackButton(

            color:  Colors.black,
          ),

          actions: [
            Center(
              child: GestureDetector(
                child: Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#CEE812'), width: 3),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Skip",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: HexColor('#004751'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  Get.to(const AvatarPageView());
                },
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body:
        Container(

            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // padding: EdgeInsets.only(top: 20, bottom: 30),
                        // margin: EdgeInsets.only(top: 40),
                        // decoration: const BoxDecoration(
                        //   image: DecorationImage(
                        //     image: AssetImage("assets/loginbg.png"),
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        child: Column(children: [
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //
                          //     children: [
                          //     // InkWell(
                          //     //       child: Icon(Icons.arrow_back,
                          //     //       color: Colors.black,),
                          //     //       onTap: (){
                          //     //         Navigator.pop(context);
                          //     //       },
                          //     //     ),
                          //     //
                          //           Row(
                          //             children: [
                          //               Container(
                          //
                          //           width:60 ,
                          //               height: 25,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.circular(25),
                          //                 border: Border.all(
                          //                   color: HexColor('#004751')
                          //                 )
                          //
                          //               ),
                          //               child: Center(
                          //                 child: Text("Skip",
                          //                 style: TextStyle(
                          //                   color:  HexColor('#004751')
                          //                 ),),
                          //               ),),
                          //             ],
                          //           )],),
                          // ),

                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text("Enable",

                                style: TextStyle(

                                    color:  HexColor('#004751'),

                                    fontSize: 28,

                                    fontWeight: FontWeight.bold

                                ),),
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text("Biometrics",

                                style: TextStyle(

                                    color:  HexColor('#004751'),

                                    fontSize: 28,

                                    fontWeight: FontWeight.bold

                                ),),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height/5,),
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [


                              InkWell(child: Image.asset('assets/touch  id 1.png'),
                                onTap: (){},),
                              SizedBox(width: 20,),

                              InkWell(child: Image.asset('assets/face id.png'),
                                onTap: (){},),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text("Enable Touch ID and Face ID \n  to verify Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(

                                    color:  HexColor('#004751'),

                                    fontSize: 18,

                                    fontWeight: FontWeight.w700

                                ),)
                            ],
                          )
                        ]),
                      )]))));
  }
  Widget buildbutton() {
    return AuthButton(
      onTap: () {
        Navigator.pop(context);
        Get.to(AvatarPageView());
      },
      text: "Enable",  decoration: BoxDecoration(
      color: HexColor('#CEE812'),
      borderRadius: BorderRadius.circular(5),
    ),
    );
}
}
