import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cardit/themes/styles.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  final ImagePicker imagePicker = ImagePicker();
  String imagePath = "";
  String base64String = "";
  File? imageFile;

  void openCamera() async {
    final imageCamera = await imagePicker.pickImage(source: ImageSource.camera);
  }

  void openGallery() async {
    final imageGallery =
        await imagePicker.pickImage(source: ImageSource.gallery);
    Uint8List imageByte = await imageFile!.readAsBytes();
    setState(() {
      if (imageGallery != null) {
        imagePath = imageGallery.path;
        imageFile = File(imagePath);
        base64String = base64.encode(imageByte);
        print('Base Url *************** Base Url');
        print(base64String);
        print('Base Url *************** Base Url');
      } else {
        print('No Image Selected');
      }
    });
  }

  var item = ['Passport', 'Driving License', 'National ID', 'UMID'];

  String? dropdownvalue;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        bottomNavigationBar: bulildbutton(),
        appBar: AppBar(
          leading: BackButton(
            color: themeChange.darkTheme ? Colors.white : Colors.black,
          ),
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
      padding: EdgeInsets.all(15),
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
        padding: EdgeInsets.all(15),
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Select ID',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: Styles.whitecustomlable))),
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 15,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0XffB7C5C7), width: 1.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton(
                        underline: const SizedBox(),
                        // underline:Container(),
                        //  validator: (value)=>value==null?'field required':null,
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        value: dropdownvalue,
                        hint: Text(
                          'Select Document',
                          style: TextStyle(
                              color: Styles.whitecustomlable, fontSize: 14),
                        ),
                        icon: InkWell(
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: themeChange.darkTheme
                                ? Colors.white
                                : Colors.black45,
                          ),
                        ),
                        items: item.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item,
                                style: const TextStyle(
                                    color: Color(0Xff413D4B), fontSize: 14)),
                          );
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
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                      label: "Enter ID Number ",
                      controller: phoneNumberController,
                      obsecureText: false,
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
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
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

  Widget displayImageSelfie() {
    if (imageFile == null) {
      return Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 1,
          height: 160,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0XffB7C5C7), width: 1.5),
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
                const Text('Upload your Selfie'),
              ],
            ),
          ));
    } else {
      return Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0XffB7C5C7), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: InkWell(
              onTap: () async {
                openGallery();
              },
              child: Image.file(imageFile!, height: 160)));
    }
  }

  Widget displayImage() {
    if (imageFile == null) {
      return Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 1,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: MemoryImage(base64Decode(base64String))),
              border: Border.all(color: Color(0XffB7C5C7), width: 1.5),
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
                SizedBox(height: 5),
                Text('Image should not be more than 2 mb'),
              ],
            ),
          ));
    } else {
      return Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0XffB7C5C7), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: InkWell(
            onTap: () async {
              openGallery();
            },
            child: Image.file(imageFile!, fit: BoxFit.fill),
          ));
    }
  }

  Widget bulildbutton() {
    return AuthButton(
        onTap: () {
          if (formKey.currentState!.validate()) {}
        },
        text: "Next");
  }
}
