import 'package:cardit/api/regster_api.dart';
import 'package:cardit/const/responsive.dart';
import 'package:cardit/ui/auth/login_screen.dart';
import 'package:cardit/ui/register/terms&condition.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../main.dart';
import '../payment_method/choose_payment_method.dart';


class congratesscreen extends StatefulWidget {
  const congratesscreen({Key? key}) : super(key: key);

  @override
  State<congratesscreen> createState() => _congratesscreenState();
}

class _congratesscreenState extends State<congratesscreen> {
  final RegisterAPI reg = Get.put(RegisterAPI());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#004751'),
        body: Responsive.isMobile(context)? 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(100)
                ),
                child: Center(
                  child:  Image.asset('assets/wish.gif',
                      width: 230, height: 150),
                ),

              ),

              SizedBox(height: 30),
            reg.firstNameController.text == null?
              Text("Hey Congrats your Document Verification done",
                  style: TextStyle(
                      fontSize: 22, color: Colors.lightGreen, fontFamily: 'sora',
                      fontWeight: FontWeight.bold
                  )):
              Text("Hey Congrats ${reg.firstNameController.text} !",
                  style: TextStyle(
                      fontSize: 22, color: Colors.lightGreen, fontFamily: 'sora',
                  fontWeight: FontWeight.bold
                  )),
              SizedBox(
                height: 10,
              ),
              Text("We are very happy to onboard you.",
                  style: TextStyle(
                  fontSize: 13, color: Colors.white, fontFamily: 'sora')),
            ],
          ),
        ):   Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(100)
                ),
                child: Center(
                  child:  Image.asset('assets/wish.png',
                      width: 230, height: 150),
                ),

              ),

              SizedBox(height: 30),
              reg.firstNameController.text == null?
              Text("Hey Congrats your Document",
                  style: TextStyle(
                      fontSize: 22, color: Colors.lightGreen, fontFamily: 'sora',
                  fontWeight: FontWeight.bold
                  )):
              Text("Hey Congrats ${reg.firstNameController.text} !",
                  style: TextStyle(
                      fontSize: 22, color: Colors.lightGreen, fontFamily: 'sora',
                      fontWeight: FontWeight.bold
                  )),

              SizedBox(
                height: 10,
              ),
              Text("We are very happy to onboard you.",
                  style: TextStyle(
                  fontSize: 13, color: Colors.white, fontFamily: 'sora')),
                  AuthButton(
      decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
      onTap: () {
  if (GetStorage().read('save_token') == null) {
  Get.to(()=>Login());
  } else {
    Get.to(()=>Login());
  }



      },

      text: "Click to Login")
            ],
          ),
        )
    ,
      bottomNavigationBar:  Responsive.isMobile(context)?bulildbutton():Responsive.isDesktop(context)?null: bulildbutton(),
    );
  }
}

Widget bulildbutton() {
  return AuthButton(
      decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
      onTap: () {


  if (GetStorage().read('save_token') == null) {
    // Fluttertoast.showToast(msg: "Your token is null");
    Get.to(()=>termsandconditions());
    // Get.to(()=>ChoosePaymentPage());

  } else {
    Get.to(()=>termsandconditions());
    // Get.to(()=>ChoosePaymentPage());
  }

      },

      text: "Next");
}
