import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../../widgets/auth_button.dart';

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
    "assets/Memoji Girls 4-13.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: [
          Center(
            child: GestureDetector(
              child: Container(
                // margin: EdgeInsets.only(),
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "Skip",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              children: [
                Text(
                  "Select Yout Avatar",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: HexColor('#413D4B')),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.amber,
            // height: size.height / 0.5,
            //
            // width: size.width / 1,
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
                        crossAxisCount: 3,
                        crossAxisSpacing: 1,
                        childAspectRatio: 1),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Card(
                            color: type == avatars[index]
                                ? Color(0xffA8DAB5)
                                : Colors.white,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
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
                    children: [
                      InkWell(
                        onTap: () {
                          imagePicker();
                        },
                        child: Row(
                          children: [
                            Text(
                              "Upload ",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Selfie / Pictures",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AuthButton(
                  decoration: BoxDecoration(
                    color: HexColor('#CEE812'),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/dashbordScreen');
                    // Navigator.of(context).pushNamed(
                    //   '/4digitpasscode',
                    // );
                    // if (formkey.currentState!.validate()) {}
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
        padding: EdgeInsets.only(left: 90, top: 12, bottom: 12, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                getIDImage(ImageSource.gallery);
              },
              icon: Icon(
                Icons.image_outlined,
              ),
            ),
            IconButton(
              onPressed: () {
                getIDImage(ImageSource.camera);
              },
              icon: Icon(
                Icons.camera_alt_outlined,
              ),
            )
          ],
        ),
      ),
    );
  }

//

}
