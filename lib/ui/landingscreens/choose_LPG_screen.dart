import 'dart:io';

import 'package:cardit/const/responsive.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/auth_button.dart';

class ChooseLGU extends StatefulWidget {
  const ChooseLGU({super.key});

  @override
  State<ChooseLGU> createState() => _ChooseLGUState();
}

class _ChooseLGUState extends State<ChooseLGU> {
  var documents = [
    'Choose from Gallery',
    'Downloads',
  ];
  String? dropdowndocx;
  File? imggalleryFiles;
  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  void openGallery() async {
    var imgGallery = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imggalleryFiles = File(imgGallery!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Responsive.isMobile(context) ? buildbutton() : null,
      appBar: Responsive.isMobile(context)
          ? AppBar(
              elevation: 0,
              leading: const BackButton(
                color: Colors.black,
              ),
              centerTitle: true,
              title: const Text("Choose LGU",
                  style: TextStyle(
                    color: Color(0xFF413D4B),
                    fontSize: 16,
                    fontFamily: "Sora",
                    fontWeight: FontWeight.w600,
                  )),
            )
          : null,
      body: Responsive.isMobile(context)
          ? Column(
              children: [
                selectdocuments(),
                const SizedBox(
                  height: 20,
                ),
                uploaddocuments()
              ],
            )
          : Responsive.isDesktop(context)
              ? Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Image.asset("assets/applogo-02.png",
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: MediaQuery.of(context).size.height / 3)),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                BackButton(
                color: Colors.black,
              ),
                              ],
                            ),
                            Text("Choose LGU",
                  style: TextStyle(
                    color: Color(0xFF413D4B),
                    fontSize: 16,
                    fontFamily: "Sora",
                    fontWeight: FontWeight.w600,
                  )),
                  SizedBox(height: 50,),
                            selectdocuments(),
                            const SizedBox(
                              height: 20,
                            ),
                            uploaddocuments()
                          ],
                        ))
                  ],
                )
              : Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Image.asset("assets/applogo-02.png",
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: MediaQuery.of(context).size.height / 3)),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                             Row(
                              children: [
                                BackButton(
                color: Colors.black,
              ),
                              ],
                            ),
                            Text("Choose LGU",
                  style: TextStyle(
                    color: Color(0xFF413D4B),
                    fontSize: 16,
                    fontFamily: "Sora",
                    fontWeight: FontWeight.w600,
                  )),
                     SizedBox(height: 50,),
                            selectdocuments(),
                            const SizedBox(
                              height: 20,
                            ),
                            uploaddocuments()
                          ],
                        ))
                  ],
                ),
    );
  }

  Widget selectdocuments() {
    return Responsive.isMobile(context)
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text('Select LGU name',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: HexColor('#000000')))),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                width: MediaQuery.of(context).size.width / 1.1,
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFFE5E5E5))),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFFE5E5E5))),
                  ),
                  // underline:Container(),
                  //  validator: (value)=>value==null?'field required':null,
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  value: dropdowndocx,
                  hint: const Text(
                    'San Nicolas',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(65, 61, 75, 0.6),
                    ),
                  ),
                  icon: const InkWell(
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black45,
                    ),
                  ),
                  validator: (value) => value == null ? 'field required' : null,
                  items: documents.map((String documents) {
                    return DropdownMenuItem(
                      value: documents,
                      child: Text(documents,
                          style: const TextStyle(
                              color: Color(0Xff413D4B), fontSize: 13)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdowndocx = newValue!;
                    });
                  },
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          )
        : Responsive.isDesktop(context)
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4.8,
                        ),
                        Text('Select LGU name',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: HexColor('#000000'))),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: MediaQuery.of(context).size.width / 4,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFE5E5E5))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFE5E5E5))),
                      ),
                      // underline:Container(),
                      //  validator: (value)=>value==null?'field required':null,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      value: dropdowndocx,
                      hint: const Text(
                        'San Nicolas',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(65, 61, 75, 0.6),
                        ),
                      ),
                      icon: const InkWell(
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black45,
                        ),
                      ),
                      validator: (value) =>
                          value == null ? 'field required' : null,
                      items: documents.map((String documents) {
                        return DropdownMenuItem(
                          value: documents,
                          child: Text(documents,
                              style: const TextStyle(
                                  color: Color(0Xff413D4B), fontSize: 13)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdowndocx = newValue!;
                        });
                      },
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 10,
                        ),
                        Text('Select LGU name',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: HexColor('#000000'))),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: MediaQuery.of(context).size.width / 2,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFE5E5E5))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFE5E5E5))),
                      ),
                      // underline:Container(),
                      //  validator: (value)=>value==null?'field required':null,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      value: dropdowndocx,
                      hint: const Text(
                        'San Nicolas',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(65, 61, 75, 0.6),
                        ),
                      ),
                      icon: const InkWell(
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black45,
                        ),
                      ),
                      validator: (value) =>
                          value == null ? 'field required' : null,
                      items: documents.map((String documents) {
                        return DropdownMenuItem(
                          value: documents,
                          child: Text(documents,
                              style: const TextStyle(
                                  color: Color(0Xff413D4B), fontSize: 13)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdowndocx = newValue!;
                        });
                      },
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              );
  }

  Widget uploaddocuments() {
    return Responsive.isMobile(context)
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text('Upload Notice of Assesments',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: HexColor('#000000')))),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                displayImage(),
              ],
            ),
          )
        : Responsive.isDesktop(context)
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4.8,
                        ),
                        Text('Upload Notice of Assesments',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: HexColor('#000000'))),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    displayImage(),
                                SizedBox(height: 50,),
                    GestureDetector(
      onTap: (){
          
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: 
                 MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
        child: Center(
          child: Text(
            "Proceed to Confirm",
            style: TextStyle(
              fontFamily: 'ProductSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: HexColor('#004751'),
            ),
          ),
        ),
      ),
    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 10,
                        ),
                        Text('Upload Notice of Assesments',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: HexColor('#000000'))),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    displayImage(),
                    SizedBox(height: 50,),
                    GestureDetector(
      onTap: (){},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: 
                 MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
        child: Center(
          child: Text(
            "Proceed to Confirm",
            style: TextStyle(
              fontFamily: 'ProductSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: HexColor('#004751'),
            ),
          ),
        ),
      ),
    )
  
                  ],
                ),
              );
  }

  Widget displayImage() {
    if (imggalleryFiles == null) {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width / 1
              : Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width / 4
                  : MediaQuery.of(context).size.width / 2,
          height: 160,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE5E5E5), width: 1.5),
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
                const Text(
                  'Upload Documents',
                  style: TextStyle(
                      color: Color(0xFF036D7A),
                      fontSize: 14,
                      fontFamily: "Sora",
                      fontWeight: FontWeight.w600),
                ),
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
            width: Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width / 1
              : Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width / 4
                  : MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
                borderRadius: const BorderRadius.all(Radius.circular(3)),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: FileImage(
                      imggalleryFiles!,
                    ))),
          ));
      //return Image.file(imgFile!, width: 350, height: 350);
    }
  }

  Widget buildbutton() {
    return AuthButton(
      onTap: () {
        // Navigator.of(context).pushNamed(
        //   '/onboardrecipient',
        // );
        // if (formKey.currentState!.validate()) {}
      },
      text: "Proceed to Confirm",
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
