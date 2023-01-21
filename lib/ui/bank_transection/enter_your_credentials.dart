// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:cardit/ui/register/register_loading_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'loading_screen.dart';

class EnterYourCredential extends StatefulWidget {
  const EnterYourCredential({Key? key}) : super(key: key);

  @override
  State<EnterYourCredential> createState() => _EnterYourCredentialState();
}

class _EnterYourCredentialState extends State<EnterYourCredential> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close, size: 30, color: Colors.black)),
          centerTitle: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(20.0),
              height: 600.0,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffDDDDDD),
                        blurRadius: 6.0,
                        spreadRadius: 5.0,
                        offset: Offset(0.0, 0.0))
                  ]),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back)),
                        SizedBox(width: 30),
                        Text('Brankas',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.bold,
                                fontSize: 26))
                      ],
                    ),
                    Divider(color: Colors.grey),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Enter your credentials',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          Text('We do not store or share your credentials.'),
                          SizedBox(height: 30),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 90,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Username',
                                        style: TextStyle(
                                            fontFamily: 'Sora',
                                            fontSize: 16,
                                            color: Colors.grey)),
                                    TextFormField(
                                        controller: userNameController,
                                        keyboardType:
                                            TextInputType.emailAddress),
                                  ],
                                ),
                              )),
                          SizedBox(height: 30),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 90,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Password',
                                        style: TextStyle(
                                            fontFamily: 'Sora',
                                            fontSize: 16,
                                            color: Colors.grey)),
                                    TextFormField(
                                        controller: passwordController,
                                        obscureText: true,
                                        keyboardType: TextInputType.text),
                                  ],
                                ),
                              )),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                      value: checkValue,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          checkValue = newValue!;
                                        });
                                      })),
                              Text('Remember me on this device',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontFamily: 'Sora')),
                            ],
                          ),
                          SizedBox(height: 20),
                          MaterialButton(
                              onPressed: () {
                                if (checkValue == true) {
                                  _popupScreen();
                                } else {
                                  Get.to(() => LoadingPage());
                                }
                              },
                              height: 50,
                              color: Colors.black,
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text('Login',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Sora',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                          SizedBox(height: 30),
                          Align(
                              alignment: Alignment.center,
                              child: Text('RESET PASSWORD',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Sora',
                                      fontSize: 16,
                                      color: Colors.grey))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text('Secure Banking Connection by',
                style: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Divider(color: Colors.grey)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<bool> _popupScreen() async {
    bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Center(child: Icon(Icons.person_search_rounded, size: 50)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: Text('Remember me on this device',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 20),
              Text(
                  'Automatically log in to your selected bank for future transactions on this device. Your login credentials will be encrypted and saved on your mobile device/browser.',
                  style: TextStyle(fontFamily: 'Sora', fontSize: 14),
                  textAlign: TextAlign.center),
              SizedBox(height: 20),
              Text(
                  'To forget your account on this device, simply change your password or clear your browser’s cache.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontFamily: 'Sora'))
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 40,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        side:
                            BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                    onPressed: () {
                      Get.back();
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Colors.white,
                    textColor: Color.fromRGBO(0, 160, 227, 1),
                    child: Text("Cancel",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Sora',
                            color: Colors.black)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 40,
                  child: MaterialButton(
                    onPressed: () {
                      Get.to(() => LoadingPage());
                    },
                    child: Text('Continue',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Sora',
                            color: Colors.black)),
                    color: HexColor('#CEE812'),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
    return exitApp ?? false;
  }
}
