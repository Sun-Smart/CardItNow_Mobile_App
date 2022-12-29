// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors

import 'dart:io';

import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/ui/avator_screen/4digit_psw_screen/4digit_passcode_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../../../main.dart';
import '../../../widgets/auth_button.dart';

var type = '';

class AvatarPageView extends StatefulWidget {
  const AvatarPageView({super.key});

  @override
  State<AvatarPageView> createState() => _AvatarPageViewState();
}

class _AvatarPageViewState extends State<AvatarPageView> {
  var indx = 0;
  var avatars = [
    "assets/Memoji Girls 4-17.png",
    "assets/Memoji Boys 1-12.png",
    "assets/Memoji Boys 1-15.png",
    "assets/Memoji Boys 1-20.png",
    "assets/Memoji Boys 1-24.png",
    "assets/Memoji Boys 2-1.png",
    "assets/Memoji Boys 2-18.png",
    "assets/Memoji Girls 1-13.png",
    "assets/Memoji Girls 1-15.png",
    "assets/Memoji Girls 2-6.png",
    "assets/Memoji Girls 4-13.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
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
              onTap: (){
                Get.to(const Passcode());
              },
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              children: [
                Text("Select Your Avatar",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: HexColor('#413D4B'))),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  // color: Colors.blue,
                  height: size.height / 1.5,
                  width: size.width / 1,
                  child: GridView.builder(
                    //itemCount: images.length,
                    itemCount: avatars.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Responsive.isMobile(context)
                            ? 3
                            : Responsive.isDesktop(context)
                                ? 6
                                : 4,
                        crossAxisSpacing: Responsive.isMobile(context)
                            ? 1
                            : Responsive.isDesktop(context)
                                ? 4
                                : 2,
                        childAspectRatio: Responsive.isMobile(context)
                            ? 1
                            : Responsive.isDesktop(context)
                                ? 2
                                : 2),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Card(
                            color: type == avatars[index]
                                ? Color(0xffA8DAB5)
                                : Colors.white,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Container(
                              child: Image.asset(
                                //images[index],
                                avatars[index],
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Row(
                    mainAxisAlignment: Responsive.isMobile(context)
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            imagePicker();
                          },
                          child: Row(children: [
                            Text("Upload ",
                                style: TextStyle(
                                    fontFamily: 'Sofa',
                                    fontSize: 18,
                                    color: HexColor('#004751'))),
                            Text("Selfie",
                                style: TextStyle(
                                    fontFamily: 'Sofa',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#004751')))
                          ]))
                    ],
                  ),
                ),
                AuthButton(
                  decoration: BoxDecoration(
                      color: HexColor('#CEE812'),
                      borderRadius: BorderRadius.circular(5)),
                  onTap: () {
                    Get.to(const Passcode());
                  },
                  text: "Next",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //imagepicker
  Future getIDImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      Get.back();
      // _imageID = imageTemporary;
    });
  }

  imagePicker() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        padding: EdgeInsets.only(left: 0, top: 12, bottom: 12, right: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                getIDImage(ImageSource.camera);
              },
              icon: Icon(Icons.camera_alt_outlined, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
