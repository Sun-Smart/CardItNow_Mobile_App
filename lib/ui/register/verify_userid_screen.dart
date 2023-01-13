// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_null_comparison, avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cardit/auth/auth.dart';
import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/themes/styles.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/ui/register/profile_information_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class VerifyUserId extends StatefulWidget {
  const VerifyUserId({Key? key}) : super(key: key);

  @override
  State<VerifyUserId> createState() => _VerifyUserIdState();
}

class _VerifyUserIdState extends State<VerifyUserId> {
  final formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();

  File? _pictures;
  File? imageFile;
  File? imageCamera;

  var collectionImage = [];

  Future<void> openCamera() async {
    var picker = ImagePicker();
    final imagePath = await picker.pickImage(source: ImageSource.camera);
    if (imagePath!.path.isEmpty == false) {
      setState(() {
        imageCamera = File(imagePath.path);
      });
      List<int> fileInBytes = await imageCamera!.readAsBytes();
      String fileInBase64 = base64Encode(fileInBytes);
      print('******************* BASE 64 SOURCE *******************');
      log(fileInBase64);
      con.uploadimg = base64.encode(fileInBytes);
      print('******************* BASE 64 SOURCE *******************');
    } else {
      if (kDebugMode) {
        print('Null');
      }
    }
  }

  final AuthCon con = Get.find();
  String? dropdownvalue;
  var philipineData = ['Passport', 'Driving Licence', 'National ID', 'UMID'];
  var uaeData = ['UAE'];

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        bottomNavigationBar: bulildbutton(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: BackButton(
              color: themeChange.darkTheme ? Colors.white : Colors.black),
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
                      child: Text("Skip",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: HexColor('#004751'),
                              fontWeight: FontWeight.bold)))),
              onTap: () {
                Get.to(const ProfileInformation());
              },
            )),
            const SizedBox(width: 20),
          ],
        ),
        body: Container(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: Responsive.isMobile(context)
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
              buildtitle(),
              bulidForm(),
            ]))));
  }

  Widget buildtitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        padding: const EdgeInsets.all(15),
        child: Text('Verify Your Id',
            style: TextStyle(
                fontSize: 28,
                fontFamily: 'Sora',
                color:
                    themeChange.darkTheme ? Colors.white : HexColor('#004751'),
                fontWeight: FontWeight.bold)));
  }

  Widget bulidForm() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: Responsive.isMobile(context)
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                mainAxisAlignment: Responsive.isMobile(context)
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
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
                    width: Responsive.isMobile(context)
                        ? MediaQuery.of(context).size.width / 1
                        : Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4.5
                            : MediaQuery.of(context).size.width / 2.5,
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
                        items: con.isUAE.value
                            ? uaeData.map((String item) {
                                return DropdownMenuItem(
                                    value: item,
                                    child: Text(item,
                                        style: const TextStyle(
                                            color: Color(0Xff413D4B),
                                            fontSize: 14)));
                              }).toList()
                            : philipineData.map((String item) {
                                return DropdownMenuItem(
                                    value: item,
                                    child: Text(item,
                                        style: const TextStyle(
                                            color: Color(0Xff413D4B),
                                            fontSize: 14)));
                              }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            con.choosedDocId = newValue;
                          });
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  displayImagedoc(),
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
    if (imageCamera == null) {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width / 1
              : Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width / 4.5
                  : MediaQuery.of(context).size.width / 2.5,
          height: 200,
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
              )));
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
              child:
                  Image.file(imageCamera!, cacheHeight: 600, cacheWidth: 500)));
    }
  }

  //photo doc upload
  Widget displayImagedoc() {
    if (imageFile == null) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width / 1
                : Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 4.5
                    : MediaQuery.of(context).size.width / 2.5,
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
                borderRadius: const BorderRadius.all(Radius.circular(3))),
            child: InkWell(
              onTap: () async {
                onPressed();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt_outlined),
                  const SizedBox(height: 5),
                  const Text('Scan your Document'),
                  //for (var picture in _pictures)
                  //   Image.file(_pictures!,
                  //     fit: BoxFit.cover,
                  //     height: 100,
                  //     width: MediaQuery.of(context).size.width,
                  //   ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: InkWell(onTap: () async {}, child: Image.file(_pictures!)));
    }
  }

  //Scan Document
  void onPressed() async {
    imageFile = (await CunningDocumentScanner.getPictures()) as File?;
    // if (!mounted) return;
    // setState(() {
    //   imageFile = _pictures;
    // });
    if (imageFile!.path.isEmpty == false) {
      setState(() {
        imageFile = _pictures;
      });
    } else {
      print(' Error');
    }
  }

  Widget bulildbutton() {
    return AuthButton(
        decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        onTap: () {},
        text: "Next");
  }
}
