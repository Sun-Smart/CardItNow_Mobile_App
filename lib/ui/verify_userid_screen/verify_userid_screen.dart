// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:cardit/themes/styles.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/ui/profile_information_screen/profile_information_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class VerifyUserId extends StatefulWidget {
  final List<String> value;
  const VerifyUserId({Key? key, required this.value}) : super(key: key);

  @override
  State<VerifyUserId> createState() => _VerifyUserIdState();
}

class _VerifyUserIdState extends State<VerifyUserId> {
  final formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();

  File? imageFile;
  File? imageFile1;
  Uint8List? bytes;
  String? img64;
  List<String> images = [];

  //Image to Byte64
  Future<void> openGallery() async {
    var picker = ImagePicker();
    final imageGallery = await picker.pickImage(source: ImageSource.gallery);
    if (imageGallery!.path.isEmpty == false) {
      setState(() {
        imageFile = File(imageGallery!.path);
      });
      List<int> fileInBytes = await imageFile!.readAsBytes();
      String fileInBase64 = base64Encode(fileInBytes);
      print('******************* BASE 64 SOURCE *******************');
      log(fileInBase64);
      print('******************* BASE 64 SOURCE *******************');
    } else {
      if (kDebugMode) {
        print('Null');
      }
    }
  }

  //Camera to Byte64
  Future<void> openCamera() async {
    var picker = ImagePicker();
    final imageGallery = await picker.pickImage(source: ImageSource.camera);
    if (imageGallery!.path.isEmpty == false) {
      setState(() {
        imageFile1 = File(imageGallery!.path);
      });
      List<int> fileInBytes = await imageFile1!.readAsBytes();
      String fileInBase64 = base64Encode(fileInBytes);
      print('******************* BASE 64 SOURCE *******************');
      log(fileInBase64);
      print('******************* BASE 64 SOURCE *******************');
    } else {
      if (kDebugMode) {
        print('Null');
      }
    }
  }

  String? dropdownvalue;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        bottomNavigationBar: bulildbutton(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: BackButton(
            color: themeChange.darkTheme ? Colors.white : Colors.black,
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
                  Get.to(const ProfileInformation());
                },
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: Container(
            //color: Color(0XFFffffff),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              buildtitle(),
              bulidForm(),
            ]))));
  }

  Widget buildtitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(
        'Verify Your Id',
        style: TextStyle(
          fontSize: 28,
          fontFamily: 'Sora',
          color: themeChange.darkTheme ? Colors.white : HexColor('#004751'),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget bulidForm() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Select ID',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: Styles.whitecustomlable))),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 15,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0XffB7C5C7), width: 1.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton(
                        underline: const SizedBox(),
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        value: dropdownvalue,
                        hint: Text('Select Document',
                            style: TextStyle(
                                color: Styles.whitecustomlable, fontSize: 14)),
                        icon: InkWell(
                            child: Icon(Icons.keyboard_arrow_down,
                                color: themeChange.darkTheme
                                    ? Colors.white
                                    : Colors.black45)),
                        items: widget.value.map((String item) {
                          return DropdownMenuItem(
                              value: item,
                              child: Text(item,
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(
                      'Upload your ID',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 14,
                          color: Styles.whitecustomlable),
                    ),
                  ),
                  const SizedBox(height: 20),
                  displayImage(),
                  const SizedBox(height: 20),
                  MyCustomInputBox(
                      enabled: true,
                      label: "Enter ID Number ",
                      controller: phoneNumberController,
                      obsecureText: false,
                      inputDecoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter ${dropdownvalue}',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        helperStyle:
                            const TextStyle(fontFamily: 'Sora', fontSize: 14),
                        hintStyle: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.normal),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        focusColor: Colors.grey.shade300,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            gapPadding: 7,
                            borderSide: const BorderSide(color: Colors.grey)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: Colors.grey)),
                        errorStyle: const TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      inputHint: dropdownvalue == null
                          ? "Enter Your Document Number"
                          : "Enter Your ${dropdownvalue.toString()} Number",
                      validator: (value) {
                        if (phoneNumberController.text.isEmpty) {
                          return "Enter ${dropdownvalue.toString()} Number";
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(height: 20),
                  Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Upload your Selfie',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: Styles.whitecustomlable))),
                  const SizedBox(height: 20),
                  displayImageSelfie(),
                  const SizedBox(height: 20),
                ])));
  }

  //Upload Your selfie
  Widget displayImageSelfie() {
    if (imageFile1 == null) {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 1,
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
              child: Image.file(imageFile1!)));
    }
  }

  //Upload Your Document
  Widget displayImage() {
    if (imageFile == null) {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 1,
          height: 160,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: InkWell(
            onTap: () async {
              openGallery();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/uplodicon.png", width: 32),
                const SizedBox(height: 5),
                const Text('Image should not be more than 2 mb'),
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
              openGallery();
            },
            child: Image.file(imageFile!),
          ));
    }
  }

  Widget bulildbutton() {
    return AuthButton(
        decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        onTap: () {
          if (formKey.currentState!.validate()) {
            Navigator.of(context).pushNamed('/profileInformation');
          }
        },
        text: "Next");
  }
}
