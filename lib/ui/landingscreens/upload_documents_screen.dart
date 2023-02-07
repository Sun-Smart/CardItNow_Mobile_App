import 'dart:io';

import 'package:cardit/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../../responsive/responsive.dart';

class UploadDocuments extends StatefulWidget {
  const UploadDocuments({Key? key}) : super(key: key);

  @override
  State<UploadDocuments> createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {
  final formKey = GlobalKey<FormState>();
  final _postalController = TextEditingController();
  final _possportController = TextEditingController();
  File? imgFiles;
  File? imgcameraFile;
  File? imggalleryFile;
  final ImagePicker _picker = ImagePicker();

  void openCamera() async {
    var cameraFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      imgcameraFile = File(cameraFile!.path);
    });
  }

  void openGallery() async {
    var imgGallery = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imggalleryFile = File(imgGallery!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive.isMobile(context)?
       SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 15),
                MyCustomInputBox(
                  enabled: true,
                  label: "Your Id",
                  controller: _possportController,
                  obsecureText: false,
                  inputDecoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Your Id',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    helperStyle:
                        const TextStyle(fontFamily: 'Sora', fontSize: 14),
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.normal,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    focusColor: Colors.grey.shade300,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0)),
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
                  validator: (value) {
                    if (_possportController.text.isEmpty) {
                      return "Please Enter Passport";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 15),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text('Upload your ID',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            color: HexColor('#505050')))),
                const SizedBox(height: 15),
                displayImage(),
                const SizedBox(height: 15),
                MyCustomInputBox(
                  enabled: true,
                  label: "Id Number",
                  controller: _postalController,
                  obsecureText: false,
                  inputDecoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Id Number',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    helperStyle:
                        const TextStyle(fontFamily: 'Sora', fontSize: 14),
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.normal,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    focusColor: Colors.grey.shade300,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0)),
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
                  validator: (value) {
                    if (_postalController.text.isEmpty) {
                      return "Please Enterid Number";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 15),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text('Upload your Selfie',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            color: HexColor('#505050')))),
                const SizedBox(height: 15),
                displayImageSelfie(),
                const SizedBox(height: 15),
              ],
            ),
          )):
          SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(  width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /8
                            : MediaQuery.of(context).size.width / 14,),
                    Text("Your Id",
                     style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            color: HexColor('#505050')))
                  ],
                ),
                SizedBox(height: 10),
              Container(
                 width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /4
                            : MediaQuery.of(context).size.width / 3,
                child: TextFormField(
                    enabled: true,
                   // label: "Your Id",
                    controller: _possportController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hoverColor: Colors.transparent,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Your Id',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      helperStyle:
                          const TextStyle(fontFamily: 'Sora', fontSize: 14),
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.normal,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      focusColor: Colors.grey.shade300,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0)),
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
                    validator: (value) {
                      if (_possportController.text.isEmpty) {
                        return "Please Enter Passport";
                      } else {
                        return null;
                      }
                    },
                  ),
              ),
                const SizedBox(height: 15),
                 Row(
                  children: [
                    SizedBox(  width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /8
                            : MediaQuery.of(context).size.width / 14,),
                    Text("Upload Your Id",
                     style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            color: HexColor('#505050')))
                  ],
                ),
                const SizedBox(height: 15),
                displayImage(),
                const SizedBox(height: 15),
                 Row(
                  children: [
                    SizedBox(  width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /8
                            : MediaQuery.of(context).size.width / 14,),
                    Text("ID Number",
                     style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            color: HexColor('#505050')))
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /4
                            : MediaQuery.of(context).size.width / 3,
                  child: TextFormField(
                    enabled: true,
                   // label: "Id Number",
                    controller: _postalController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hoverColor: Colors.transparent,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Id Number',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      helperStyle:
                          const TextStyle(fontFamily: 'Sora', fontSize: 14),
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.normal,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      focusColor: Colors.grey.shade300,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0)),
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
                    validator: (value) {
                      if (_postalController.text.isEmpty) {
                        return "Please Enterid Number";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(  width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /8
                            : MediaQuery.of(context).size.width / 14,),
                    Text("Upload Your Selfie",
                     style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            color: HexColor('#505050')))
                  ],
                ),
                const SizedBox(height: 15),
                displayImageSelfie(),
                const SizedBox(height: 15),
              ],
            ),
          ))
    );
  }

  Widget displayImageSelfie() {
    if (imgcameraFile == null) {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
           width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /4
                            : MediaQuery.of(context).size.width / 3,
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
                Image.asset(
                  "assets/uplodicon.png",
                  width: 32,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text('Upload your Selfie'),
              ],
            ),
          ));
    } else {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /4
                            : MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: InkWell(
              onTap: () async {
                openCamera();
              },
              child: Image.file(imgcameraFile!, height: 160)));
    }
  }

  Widget displayImage() {
    if (imggalleryFile == null) {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
           width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /4
                            : MediaQuery.of(context).size.width / 3,
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
                Image.asset(
                  "assets/uplodicon.png",
                  width: 32,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text('Image should not be more than 2 mb'),
              ],
            ),
          ));
    } else {
      return InkWell(
          onTap: () async {
            openGallery();
          },
          child: Container(
            height: 160,
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /4
                            : MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
                borderRadius: const BorderRadius.all(Radius.circular(3)),
                image: DecorationImage(
                    fit: BoxFit.fill, image: FileImage(imggalleryFile!))),
          ));
      //return Image.file(imgFile!, width: 350, height: 350);
    }
  }
}
