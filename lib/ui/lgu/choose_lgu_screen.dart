// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cardit/auth/auth.dart';
import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/ui/register/pdfView.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../themes/Themes.dart';
import '../../widgets/custom_dropdown.dart';
import 'your_tax_details.dart';

class ChooseLGUScreen extends StatefulWidget {
  const ChooseLGUScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLGUScreen> createState() => _ChooseLGUScreenState();
}

class _ChooseLGUScreenState extends State<ChooseLGUScreen> {
  String? dropdownvalue;
  String? dropdownvalueCity;
  var selectedcountry = ['Batac','Helo','hiiii','hobby'];

  List<String> _pictures = [];
  final AuthCon con = Get.find();

  File? imageFile;

  //Image to Byte64
  File? _file;
  PlatformFile? _platformFile;
  final countryCon = TextEditingController();

  openGallery() async {
    final file = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;
        List<int> fileBytes = _file!.readAsBytesSync();
        con.regDoc = base64.encode(fileBytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          foregroundColor: Colors.black,
          title: Text('Choose LGU',
              style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 14,
                  fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Select LGU name',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 16,
                          color: Colors.black))),
              const SizedBox(height: 10),
              // CustomDropdown.search(
              //     borderRadius: BorderRadius.zero,
              //     borderSide: BorderSide(color: Colors.grey),
              //     hintText: 'Select job role',
              //     listItemStyle: TextStyle(color: Colors.black),
              //     selectedStyle:
              //     TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
              //     items: selectedcountry,
              //     controller: countryCon,
              //     onChanged: (v) {
              //       print(v);
              //
              //       // var ins =
              //       // dummy.indexWhere((element) => element.containsValue(v));
              //       // print(dummy[ins]['id']);
              //     },
              //   ),
              // SizedBox(
              //   height: 20,
              // ),

              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0XffB7C5C7), width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(3))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton(
                    underline: const SizedBox(),
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    value: dropdownvalue,
                    hint: Text('San Nicolas',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: 'Sora')),
                    icon: InkWell(child: Icon(Icons.keyboard_arrow_down)),
                    items: selectedcountry.map((String item) {
                      return DropdownMenuItem(
                          value: item,
                          child: Text(item,
                              style: const TextStyle(
                                  color: Color(0Xff413D4B), fontSize: 14)));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalueCity = null;
                        dropdownvalue = newValue!;
                      });
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Select Your Province',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 16,
                          color: Colors.black))),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0XffB7C5C7), width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(3))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton(
                    underline: const SizedBox(),
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    value: dropdownvalue,
                    hint: Text('San Nicolas',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: 'Sora')),
                    icon: InkWell(child: Icon(Icons.keyboard_arrow_down)),
                    items: selectedcountry.map((String item) {
                      return DropdownMenuItem(
                          value: item,
                          child: Text(item,
                              style: const TextStyle(
                                  color: Color(0Xff413D4B), fontSize: 14)));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalueCity = null;
                        dropdownvalue = newValue!;
                      });
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Select Your Province',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 16,
                          color: Colors.black))),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0XffB7C5C7), width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(3))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton(
                    underline: const SizedBox(),
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    value: dropdownvalue,
                    hint: Text('San Nicolas',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: 'Sora')),
                    icon: InkWell(child: Icon(Icons.keyboard_arrow_down)),
                    items: selectedcountry.map((String item) {
                      return DropdownMenuItem(
                          value: item,
                          child: Text(item,
                              style: const TextStyle(
                                  color: Color(0Xff413D4B), fontSize: 14)));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalueCity = null;
                        dropdownvalue = newValue!;
                      });
                    },
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Upload Statement of Account',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 16,
                          color: Colors.black))),
              const SizedBox(height: 10),
              displayImageSelfie(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AuthButton(
          decoration: BoxDecoration(
              color: HexColor('#CEE812'),
              borderRadius: BorderRadius.circular(5)),
          onTap: () {
            Get.to(() => YourTaxDetails());
          },
          text: "Proceed to Confirm"),
    );
  }

  //Upload Your selfie
  Widget displayImageSelfie() {
    if (imageFile == null) {
      return Container(
          width: MediaQuery.of(context).size.width,
          height: 160,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: InkWell(
            onTap: () async {
              popupScreen();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/uplodicon.png", width: 32),
                const SizedBox(height: 5),
                const Text('Upload Document'),
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
                popupScreen();
              },
              child: Image.file(imageFile!,
                  fit: BoxFit.cover, cacheHeight: 400, cacheWidth: 400)));
    }
  }

  //Scan
  void onPressed() async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures() ?? [];
      if (!mounted) return;
      setState(() {
        _pictures = pictures;
        imageFile = File(_pictures[0]);
      });
    } catch (exception) {
      print('Image Not Pic');
    }
    List<int> fileInBytes = await imageFile!.readAsBytes();
    String fileInBase64 = base64Encode(fileInBytes);
    print('******************* BASE 64 SOURCE *******************');
    log(fileInBase64);
    //con.uploaddoc = base64.encode(fileInBytes);
    print('******************* BASE 64 SOURCE *******************');
  }

  //Popup
  Future<bool> popupScreen() async {
    bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          actions: <Widget>[
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Upload Documents',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close, size: 25, color: Colors.black))
              ],
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('Choose from options',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            fontWeight: FontWeight.bold)))),
            SizedBox(height: 20),
            GestureDetector(
                child: Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            width: 50,
                            height: 55,
                            decoration: BoxDecoration(
                                color: HexColor('CEE812'),
                                borderRadius: BorderRadius.circular(10)),
                            child:
                                Icon(Icons.pages_sharp, color: Colors.black)),
                        Text(
                          'Choose a document',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: Colors.black),
                        ),
                      ],
                    )),
                onTap: () {
                  print('Garudan Tapped');
                  openGallery();
                }),
            GestureDetector(
                onTap: () {
                  onPressed();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          width: 50,
                          height: 55,
                          decoration: BoxDecoration(
                              color: HexColor('CEE812'),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(Icons.image, color: Colors.black)),
                      Text(
                        'Take a Picture',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            color: Colors.black),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 40),
          ],
        );
      },
    );
    return exitApp ?? false;
  }
}
