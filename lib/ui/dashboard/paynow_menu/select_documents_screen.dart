import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cardit/ui/register/pdfView.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../auth/auth.dart';
import '../../../responsive/responsive.dart';
import '../../../themes/styles.dart';
import 'onboard_recipient_screen.dart';

class SelectDocuments extends StatefulWidget {
  const SelectDocuments({super.key});

  @override
  State<SelectDocuments> createState() => _SelectDocumentsState();
}

class _SelectDocumentsState extends State<SelectDocuments> {
  String? dropdowndocx;

  File? _file;
  File? imagedoc2;
  PlatformFile? _platformFile;
  List<String> _pictures = [];
  void onPressed() async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures() ?? [];
      if (!mounted) return;
      setState(() {
        _pictures = pictures;
        imagedoc2 = File(_pictures[0]);
         print("---ssss----$imagedoc2");
        List<int> fileBytes = imagedoc2!.readAsBytesSync();
        con.doc64 = base64.encode(fileBytes);
        print("-----64-----${con.doc64}");
      });
    } catch (exception) {
      print('Image Not Pic');
    }
  }

  Widget open_document() {
    if (_platformFile == null) {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 1,
          height: 160,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XffB7C5C7), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: GestureDetector(
            onTap: () async {
              ///showAlertDialog(context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/uplodicon.png", width: 32),
                const SizedBox(height: 5),
                Text('Upload Documents',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: HexColor('#036D7A'))),
              ],
            ),
          ));
    } else {
      return GestureDetector(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.5)),
            child: Stack(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 60,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(children: [
                      const SizedBox(
                        width: 10,
                      ),
                      openpdf_file(),
                    ]),
                  ),
                ),
              ),
            ]),
          ),
        ),
      );
    }
  }

  openGallery() async {
    final file = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;

        List<int> fileBytes = _file!.readAsBytesSync();
        con.regDoc = base64.encode(fileBytes);
        print("-----64-----${con.regDoc}");
      });
    }
  }

  openpdf_file() {
    // print('pathoffile--pathoffile--$pathoffile');
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Get.to(() => PdfView(fileUrl: _file!.path));
        },
        child: Text(
          _platformFile!.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: true,
          style: const TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.w700),
        ),
        // SfPdfViewer.file(
        //       File('/data/user/0/com.example.cardit/cache/file_picker/dummy.pdf',

        //       ),
        //       key: _pdfViewerKey,
        //       )
      ),
    );
  }

  final AuthCon con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildbutton(),
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text("Select Documents",
            style: TextStyle(
              color: Color(0xFF413D4B),
              fontSize: 14,
              fontFamily: "Sora",
              fontWeight: FontWeight.w600,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            selectdocuments(),
            const SizedBox(
              height: 20,
            ),
           
             uploaddocuments()
          ],
        ),
      ),
    );
  }

  Widget selectdocuments() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text('Choose Documents',
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
            focusColor: Colors.transparent,
            decoration: const InputDecoration(
              hoverColor: Colors.transparent,
              contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFE5E5E5))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFE5E5E5))),
            ),
            // underline:Container(),
            //  validator: (value)=>value==null?'field required':null,
            dropdownColor: Colors.white,
            isExpanded: true,
            value: dropdowndocx,
            hint: const Text(
              'Select Documents',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Sora',
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(65, 61, 75, 0.6),
              ),
            ),
            icon: GestureDetector(
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black45,
              ),
            ),
            validator: (value) => value == null ? 'field required' : null,
            items: con.documenttypelist.map((item) {
              return DropdownMenuItem(
                value: item["documnettype"].toString(),
                child: Text(item["documnettype"].toString(),
                    style: const TextStyle(
                        color: Color(0Xff413D4B), fontSize: 13)),
              );
            }).toList(),
            onChanged: (newValue) {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text('Upload Documents',
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
           displayImagedoc(),
          //  showAlertDialog(context),
          //open_document(),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Stack(
        children: [
          Positioned(
            right: -15,
            top: -15,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
              color: Styles.whitecolortext,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload Invoice "),
              SizedBox(
                height: 2,
              ),
              Text(" Choose from options",
                  style: TextStyle(
                      color: Styles.whitecolortext,
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
      content: Container(
        height: 180,
        child: Column(children: [
          Container(
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: Color(0XFFB7C5C7), width: 1.5),
                color: Color(0XFFffffff),
              ),
              margin: EdgeInsets.all(15),
              child: InkWell(
                highlightColor: Color(0XFFffffff),
                focusColor: Color(0XFFffffff),
                splashColor: Colors.green, // splash color
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                    openGallery();
                  });
                }, // button pressed
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0XFFCEE812),
                            ),
                            padding: EdgeInsets.all(5),
                            child: Image.asset(
                              "assets/document-icon.png",
                              width: 24,
                              height: 24,
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "Choose a document",
                          style:
                              TextStyle(color: Color(0XFF413D4B), fontSize: 14),
                        ),
                        // text
                      ],
                    )),
              )),
          Container(
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: Color(0XFFB7C5C7), width: 1.5),
                color: Color(0XFFffffff),
              ),
              margin: EdgeInsets.all(15),
              child: InkWell(
                highlightColor: Color(0XFFffffff),
                focusColor: Color(0XFFffffff),
                splashColor: Colors.green, // splash color
                onTap: () {
                  setState(() {
                    onPressed();
                    // displayImagedoc();
                  });
                }, // button pressed
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0XFFCEE812),
                            ),
                            padding: EdgeInsets.all(5),
                            child: Image.asset(
                              "assets/icon-pdf.png",
                              width: 24,
                              height: 24,
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "Take a Picture",
                          style:
                              TextStyle(color: Color(0XFF413D4B), fontSize: 14),
                        ),
                        // text
                      ],
                    )),
              )),
        ]),
      ),
      actions: [
        //okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget displayImagedoc() {
    if (imagedoc2 == null) {
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
                onPressed();
              },
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt_outlined),
                    // Image.asset("assets/uplodicon.png", width: 32),
                     SizedBox(height: 5),
                     Text('Scan your Document'),
                  ])));
    } else {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: InkWell(
            onTap: () async {
              onPressed();
            },
            child: Image.file(
              imagedoc2!,
              fit: BoxFit.fill,
            ),
          ));
    }
  }

  Widget buildbutton() {
    return AuthButton(
      onTap: () {
        if(dropdowndocx==null){
          Fluttertoast.showToast(msg: "Enter Your Document Type");
        }
        else if(imagedoc2==null){
           Fluttertoast.showToast(msg: "Choose Your Document");
        }
        else{
           Get.to(onboardRecipient(
          documenttype: dropdowndocx.toString(),
          uploadoc: con.doc64,
        ));
        }
       
        // Navigator.of(context).pushNamed(
        //   '/onboardrecipient',
        // );
        // // if (formKey.currentState.validate()) {}
      },
      text: "Add and Proceed",
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
