import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/ui/login/login_screen.dart';
import 'package:cardit/ui/register/verify_userid_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

class passcodecongrats extends StatefulWidget {
  const passcodecongrats({Key? key}) : super(key: key);

  @override
  State<passcodecongrats> createState() => _passcodecongratsState();
}

class _passcodecongratsState extends State<passcodecongrats> {
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
            Center(
              child: Text("Congratulations your passcode has been successfully created, keep this safe and do not share with anybody.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15, color: Colors.lightGreen, fontFamily: 'sora',
                      fontWeight: FontWeight.bold
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            // Text("We are very happy to onboard you.",
            //     style: TextStyle(
            //         fontSize: 13, color: Colors.white, fontFamily: 'sora')),
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
             Center(
               child: Container(
                width: 400,
                 child: Text("Congratulations your passcode has been successfully created, keep this safe and do not share with anybody.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 15, color: Colors.lightGreen, fontFamily: 'sora',
                        fontWeight: FontWeight.bold
                    )),
               ),
             ),
            SizedBox(
              height: 40,
            ),
            // Text("We are very happy to onboard you.",
            //     style: TextStyle(
           GestureDetector(
      onTap:(){
         Get.to(VerifyUserId());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: Responsive.isMobile(context)
            ? MediaQuery.of(context).size.width / 1
            : Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width / 4.4
                : MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            "Go to Document Verification",
            style: TextStyle(
              fontFamily: 'ProductSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: HexColor('#004751'),
            ),
          ),
        ),
      ),
    )//         fontSize: 13, color: Colors.white, fontFamily: 'sora')),

          ],
        ),
      )
      ,
      bottomNavigationBar:  Responsive.isMobile(context)?bulildbutton():Responsive.isDesktop(context)?null: null,
    );
  }
}
Widget bulildbutton() {
  return AuthButton(
      decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
      onTap: () {

        Get.to(VerifyUserId());



      },

      text: "Go to Document Verification");
}