import 'package:cardit/ui/login/login_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';


class congratesscreen extends StatefulWidget {
  const congratesscreen({Key? key}) : super(key: key);

  @override
  State<congratesscreen> createState() => _congratesscreenState();
}

class _congratesscreenState extends State<congratesscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#004751'),
        body: Center(
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
                  child:  Image.asset('assets/congrats.png',
                      width: 230, height: 150),
                ),

              ),

              SizedBox(height: 30),
              Text("Hey Congrats ${GetStorage().read('username')} !",
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
        ),
      bottomNavigationBar: bulildbutton(),
    );
  }




}

Widget bulildbutton() {
  return AuthButton(
      decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
      onTap: () {
  if (GetStorage().read('save_token') == null) {
  Get.to(()=>Login());
  } else {
    Get.to(()=>Login());
  }



      },

      text: "Click to Login");
}
