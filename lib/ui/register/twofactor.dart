// ignore_for_file: prefer_const_constructors

import 'package:cardit/ui/register/congratsscreen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:local_auth/local_auth.dart';


class Twofactor extends StatefulWidget {
  const Twofactor({Key? key}) : super(key: key);

  @override
  State<Twofactor> createState() => _TwofactorState();
}

class _TwofactorState extends State<Twofactor> {
  final LocalAuthentication auth = LocalAuthentication();


  bool pass = false;
  String msg = "You are not authorized.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: buildbutton(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: BackButton(color: Colors.black),
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
                  Get.to(const congratesscreen());
                },
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: Container(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              Container(
                child: Column(children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Enable",
                        style: TextStyle(
                            color: HexColor('#004751'),
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Biometrics",
                        style: TextStyle(
                            color: HexColor('#004751'),
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Image.asset('assets/touch  id 1.png'),
                        onTap: ()  async{

                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        child: Image.asset('assets/face id.png'),
                        onTap: () async {
                          // try {
                          //   // _authenticate();
                          //
                          //   pass = await auth.authenticate(
                          //       localizedReason:
                          //           'Authenticate with pattern/pin/passcode',
                          //       options: const AuthenticationOptions(
                          //           biometricOnly: true, stickyAuth: false,
                          //       useErrorDialogs: true
                          //       ));
                          //
                          //   if (pass) {
                          //     msg = "Biometric Successfully setted";
                          //     setState(() {});
                          //   }
                          // } catch (e) {
                          //   print("ss" + e.toString());
                          //   msg =
                          //       "Error while opening fingerprint/face scanner";
                          // }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enable Touch ID and Face ID \n  to verify Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: HexColor('#004751'),
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ]),
              )

            ]))));

  }

  Widget buildbutton() {
    return AuthButton(
      onTap: () {
        if (pass = true) {
          GetStorage().write("bioAuth", true);
          Get.to(congratesscreen());
        } else {
          Fluttertoast.showToast(msg: "Please Go settings Enable Your Security Settings");
          // Get.to(termsandconditions());
        }
      },
      text: "Enable",
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }



}




