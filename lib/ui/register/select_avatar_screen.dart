// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, unnecessary_this, avoid_print, unnecessary_null_comparison, unrelated_type_equality_checks

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cardit/auth/auth.dart';
import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/ui/register/4digit_passcode_screen.dart';
import 'package:cardit/ui/register/profile_information_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../../themes/styles.dart';
import '../../widgets/auth_button.dart';

class AvatarPageView extends StatefulWidget {
  const AvatarPageView({super.key});

  @override
  State<AvatarPageView> createState() => _AvatarPageViewState();
}

class _AvatarPageViewState extends State<AvatarPageView> {
  var indx = 0;
  var type = '';
  File? uploadfiles1;
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
  final AuthCon con = Get.find();

  Future<void> openCamera() async {
    var picker = ImagePicker();
    final imageGallery = await picker.pickImage(source: ImageSource.camera);
    if (imageGallery!.path.isEmpty == false) {
      setState(() {
        uploadfiles1 = File(imageGallery.path);
      });
      List<int> fileInBytes = await uploadfiles1!.readAsBytes();
      String fileInBase64 = base64Encode(fileInBytes);
      print('******************* BASE 64 SOURCE *******************');
      log(fileInBase64);
      ;
      con.uploadimg = base64.encode(fileInBytes);
      type = imageGallery.path;
      GetStorage().write('avatarpic', type);
      print('******************* BASE 64 SOURCE *******************');
    } else {
      if (kDebugMode) {
        print('Null');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Responsive.isMobile(context)
            ? AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back)),
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.transparent,
                actions: [
                  Center(
                    child: GestureDetector(
                      child: Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: HexColor('#CEE812'), width: 3),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text("Skip",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: HexColor('#004751'),
                                      fontWeight: FontWeight.bold)))),
                      onTap: () {
                        Get.to(const ProfileInformation());
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              )
            : null,
        body: Responsive.isMobile(context)
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Text("  Choose your Avatar",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,fontFamily: 'sora',
                                  color: HexColor('#004751'))),
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
                                  itemCount: avatars.length,
                                  // itemCount: con.avatarImageList.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                             
                                          crossAxisSpacing:  1,
                                             
                                          childAspectRatio:  1,
                                              ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Container(
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {

                                                type = avatars[index];
                                                GetStorage().write("avatarpic", type);
                                                print(type);

                                              });

                                            },
                                            child: Card(
                                              color: type ==avatars[index]
                                                  ? HexColor('#CEE812')
                                                  : Colors.white,
                                              elevation: 4,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0)),
                                              child: Container(
                                                child:
                                                    Image.asset(avatars[index]),
                                                // Image.network(
                                                //     con.avatarImageList[index]['aurl']),
                                                // child: Image.network(con.avatarImage),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  })),
                          // Container(
                          //   margin: EdgeInsets.only(left: 25),
                          //   child: Row(
                          //     mainAxisAlignment: Responsive.isMobile(context)
                          //         ? MainAxisAlignment.start
                          //         : MainAxisAlignment.center,
                          //     children: [
                          //       InkWell(
                          //           onTap: () {
                          //             // imagePicker();
                          //           },
                          //           child: Row(children: [
                          //             Text("Upload ",
                          //                 style: TextStyle(
                          //                     fontFamily: 'Sofa',
                          //                     fontSize: 18,
                          //                     color: HexColor('#004751'))),
                          //             Text("Selfie",
                          //                 style: TextStyle(
                          //                     fontFamily: 'Sofa',
                          //                     fontSize: 18,
                          //                     fontWeight: FontWeight.bold,
                          //                     color: HexColor('#004751')))
                          //           ]))
                          //     ],
                          //   ),
                          // ),
                          // Container(
                          //     margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          //     child: Text('',
                          //         style: TextStyle(
                          //             fontFamily: 'Sora',
                          //             fontSize: 14,
                          //             color: Styles.whitecustomlable))),
                          // const SizedBox(height: 20),
                          // displayImageSelfie(),
                          // const SizedBox(height: 20),
                          AuthButton(
                            decoration: BoxDecoration(
                                color: HexColor('#CEE812'),
                                borderRadius: BorderRadius.circular(5)),
                            onTap: () {
                              print('dhamu' + type);
                              GetStorage().read("avatarpic");
                              Get.to(const ProfileInformation());
                            },
                            text: "Next",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Responsive.isDesktop(context)
                ? Row(children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Image.asset("assets/applogo-02.png",
                                width: MediaQuery.of(context).size.width / 1.5, height:  MediaQuery.of(context).size.height / 3
                              )),
                    ),
                    Container(
                      width: size.width / 1.5,
                      child: Column(
                        children: [
                          buildToptitle(),
                          Text("Select Your Avatar",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: HexColor('#413D4B'))),
                          SizedBox(
                            height: 20,
                          ),
                          buildavatarweb()
                        ],
                      ),
                    ),
                  ])
                :Row(children: [
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
                      width: size.width / 1.5,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            buildToptitle(),
                            Text("Select Your Avatar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: HexColor('#413D4B'))),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                      // color: Colors.blue,
                                      height: size.height / 1.5,
                                      width: size.width / 1,
                                      child: GridView.builder(
                                          itemCount: avatars.length,
                                          // itemCount: con.avatarImageList.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  crossAxisSpacing: 1,
                                                  childAspectRatio: 1),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Column(
                                              children: [
                                                Container(
                                                  child: InkWell(
                                                    onTap: () {
                                                     setState(() {

                                                type = avatars[index];
                                                GetStorage().write("avatarpic", type);
                                                print("heiuiu"+type.toString());

                                              });

                                                      print(con.avatarImageList
                                                          .toString());
                                                    },
                                                    child: Card(
                                                      // color: type == con.avatarImageList.length
                                                      //     ? HexColor('#CEE812')
                                                      //     : Colors.white,
                                                      color: type ==
                                                              avatars[index]
                                                          ? HexColor('#CEE812')
                                                          : Colors.white,
                                                      elevation: 4,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0)),
                                                      child: Container(
                                                        child: Image.asset(
                                                            avatars[index]),
                                                        // Image.network(
                                                        //     con.avatarImageList[index]['aurl']),
                                                        // child: Image.network(con.avatarImage),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          })),
                                  // Container(
                                  //   margin: EdgeInsets.only(left: 25),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         Responsive.isMobile(context)
                                  //             ? MainAxisAlignment.start
                                  //             : MainAxisAlignment.center,
                                  //     children: [
                                  //       InkWell(
                                  //           onTap: () {
                                  //             // imagePicker();
                                  //           },
                                  //           child: Row(children: [
                                  //             Text("Upload ",
                                  //                 style: TextStyle(
                                  //                     fontFamily: 'Sofa',
                                  //                     fontSize: 18,
                                  //                     color:
                                  //                         HexColor('#004751'))),
                                  //             Text("Selfie",
                                  //                 style: TextStyle(
                                  //                     fontFamily: 'Sofa',
                                  //                     fontSize: 18,
                                  //                     fontWeight:
                                  //                         FontWeight.bold,
                                  //                     color:
                                  //                         HexColor('#004751')))
                                  //           ]))
                                  //     ],
                                  //   ),
                                  // ),
                                  // Container(
                                  //     margin: const EdgeInsets.fromLTRB(
                                  //         15, 0, 15, 0),
                                  //     child: Text('',
                                  //         style: TextStyle(
                                  //             fontFamily: 'Sora',
                                  //             fontSize: 14,
                                  //             color: Styles.whitecustomlable))),
                                  // const SizedBox(height: 20),
                                  // displayImageSelfie(),
                                  const SizedBox(height: 20),
                                  AuthButton(
                                    decoration: BoxDecoration(
                                        color: HexColor('#CEE812'),
                                        borderRadius: BorderRadius.circular(5)),
                                    onTap: () {
                                      print('dhamu' + type);

                                      GetStorage().read("avatarpic");
                                      Get.to(const ProfileInformation());
                                    },
                                    text: "Next",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]));
  }

  Widget buildavatarweb() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              // color: Colors.blue,
              height: size.height / 1.5,
              width: size.width / 4,
              child: GridView.builder(
                  itemCount: avatars.length,
                  // itemCount: con.avatarImageList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Responsive.isDesktop(context) ? 3 : 3,
                      crossAxisSpacing: Responsive.isDesktop(context) ? 2 : 2,
                      childAspectRatio: Responsive.isDesktop(context) ? 1 : 1),
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {

                                type = avatars[index];
                                GetStorage().write("avatarpic", type);
                                print(type);

                              });
                            },
                            child: Card(
                              // color: type == con.avatarImageList.length
                              //     ? HexColor('#CEE812')
                              //     : Colors.white,
                              color: type == avatars[index]
                                  ? HexColor('#CEE812')
                                  : Colors.white,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Container(
                                child: Image.asset(avatars[index]),
                                // Image.network(
                                //     con.avatarImageList[index]['aurl']),
                                // child: Image.network(con.avatarImage),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  })),
      //     SizedBox(
      //       width: 10,
      //     ),
      //     Text(
      //       "Or",
      //       style: TextStyle(color: Styles.whitecustomlable, fontSize: 15),
      //     ),
      //     SizedBox(

      //       width: 10,
      //     ),
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Container(
      //           // margin: EdgeInsets.only(left: 25),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               GestureDetector(
      //                   onTap: () {
      //                     // imagePicker();
      //                   },
      //                   child: Row(children: [
      //                     Text("Upload ",
      //                         style: TextStyle(
      //                             fontFamily: 'Sofa',
      //                             fontSize: 18,
      //                             color: HexColor('#004751'))),
      //                     Text("Selfie",
      //                         style: TextStyle(
      //                             fontFamily: 'Sofa',
      //                             fontSize: 18,
      //                             fontWeight: FontWeight.bold,
      //                             color: HexColor('#004751')))
      //                   ])),
      //               Container(
      //                   margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      //                   child: Text('',
      //                       style: TextStyle(
      //                           fontFamily: 'Sora',
      //                           fontSize: 14,
      //                           color: Styles.whitecustomlable))),
      //               const SizedBox(height: 10),
      //               displayImageSelfie(),
      //               const SizedBox(height: 20),
                    AuthButton(
                      decoration: BoxDecoration(
                          color: HexColor('#CEE812'),
                          borderRadius: BorderRadius.circular(5)),
                      onTap: () {
                        print('dhamu' + type);
                        GetStorage().read("avatarpic");
                        Get.to(const ProfileInformation());
                      },
                      text: "Next",
                    ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
        ],
       ),
    );
  }

  Widget buildToptitle() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
          mainAxisAlignment: Responsive.isMobile(context)
              ? MainAxisAlignment.start
              : Responsive.isDesktop(context)
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              hoverColor: Colors.transparent,
              icon: Icon(Icons.arrow_back, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            GestureDetector(
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
                Get.to(ProfileInformation());
              },
            ),
          ]),
    );
  }

  //Camera Image Picker

  Future getIDImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() => this.con.image = imageTemporary);
    imagePickerCamera(imageTemporary);
    print('File Path *************** $imageTemporary');
  }

  imagePicker() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
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

  void imagePickerCamera(File imagePath) async {
    bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          actions: <Widget>[
            con.image != null
                ? Image.file(
                    cacheHeight: 600,
                    cacheWidth: 500,
                    con.image!,
                    fit: BoxFit.fill)
                : Center(
                    child: Text('No Image Found',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                    color: HexColor('#CEE812'),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('CANCEL',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))),
                MaterialButton(
                    color: HexColor('#CEE812'),
                    onPressed: () {
                      print('llll');
                      GetStorage().write("avatarpic", type);
                      Get.back();
                      // Get.to(() => Passcode());
                      // Navigator.pop(context);
                      // con.avatorSelfi(imagePath);
                    },
                    child: Text('SAVE',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16))),
              ],
            ),
          ],
        );
      },
    );
  }

  //Avator Image Picker
  Future<bool> imagePickerAvator(
      String assestImage, void Function()? onTap) async {
    bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          actions: <Widget>[
            assestImage != null
                ? Center(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.tealAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(assestImage,
                            fit: BoxFit.fitWidth, height: 300)))
                : Center(
                    child: Text('No Image Found',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                    color: HexColor('#CEE812'),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pop(false);
                    },
                    child: Text('CANCEL',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))),
                MaterialButton(
                    color: HexColor('#CEE812'),
                    onPressed: () {
                      GetStorage().write("avatarpic", type);
                      Navigator.of(context, rootNavigator: true)
                          .pop(true);
                    },
                    child: Text('SAVE',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16))),
              ],
            ),
          ],
        );
      },
    );
    return exitApp;
  }

  Widget displayImageSelfie() {
    if (uploadfiles1 == null) {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width / 1
              : Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width / 4.5
                  : MediaQuery.of(context).size.width / 2.5,
          height: 160,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: InkWell(
            onTap: () async {
              openCamera();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/uplodicon.png", width: 32),
                const SizedBox(height: 5),
                const Text('Upload your Selfie'),
              ],
            ),
          ));
    } else {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: InkWell(
              onTap: () async {
                openCamera();
              },
              child: Image.file(
                uploadfiles1!,
              )));
    }
  }
}
