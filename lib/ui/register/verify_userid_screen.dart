// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cardit/auth/auth.dart';
import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/themes/styles.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/ui/register/select_avatar_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'pdfView.dart';

class VerifyUserId extends StatefulWidget {
  const VerifyUserId({Key? key}) : super(key: key);

  @override
  State<VerifyUserId> createState() => _VerifyUserIdState();
}

class _VerifyUserIdState extends State<VerifyUserId> {
  final formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();

  List<String> _pictures = [];

  File? imageFile;
  File? imageFile1;
  File? imagedoc2;
  Uint8List? bytes;
  String? img64;
  List<String> images = [];

  //Image to Byte64
  File? _file;
  PlatformFile? _platformFile;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  var indexes;

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

  openFie() {
    // print('pathoffile--pathoffile--$pathoffile');
    return Expanded(
      child: InkWell(
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

  Future<void> openCamera() async {
    var picker = ImagePicker();
    final imageGallery = await picker.pickImage(source: ImageSource.camera);
    if (imageGallery!.path.isEmpty == false) {
      setState(() {
        imageFile1 = File(imageGallery.path);
      });
      List<int> fileInBytes = await imageFile1!.readAsBytes();
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

  //

  //Camera to Byte64
  Future<void> opendoc() async {
    var picker = ImagePicker();
    final imageGallery = await picker.pickImage(source: ImageSource.camera);
    if (imageGallery!.path.isEmpty == false) {
      setState(() {
        imagedoc2 = File(imageGallery.path);
      });
      List<int> fileInBytes = await imagedoc2!.readAsBytes();
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
                  Get.to(const AvatarPageView());
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
                  // Container(
                  //   margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  //   child: Text(
                  //     'Upload your ID',
                  //     style: TextStyle(
                  //         fontFamily: 'Sora',
                  //         fontSize: 14,
                  //         color: Styles.whitecustomlable),
                  //   ),
                  // ),
                  // const SizedBox(height: 20),
                  displayImagedoc(),
                  const SizedBox(height: 20),
                  MyCustomInputBox(
                      enabled: true,
                      label: "Enter ID Number ",
                      controller: phoneNumberController,
                      obsecureText: false,
                      inputDecoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: dropdownvalue == null
                            ? "Select Document"
                            : 'Enter ${dropdownvalue} Number',
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
                        if (dropdownvalue == null) {
                          return "Enter Your Document Type";
                        } else {
                          return "Enter ${dropdownvalue.toString()} Number";
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
              child: Image.file(imageFile1!)));
    }
  }

//photo doc upload
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
            _showPicker(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt_outlined),
              const SizedBox(height: 5),
              const Text('Scan your Document'),
            ],
          ),
        ),
      );
    } else {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: InkWell(
              onTap: () async {
                _showPicker(context);
              },
              child: Image.file(
                imagedoc2!,
                fit: BoxFit.fill,
              )));
    }
  }

  //Upload Your Document
  Widget displayImage() {
    if (_platformFile == null) {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 1,
          height: 160,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: InkWell(
            onTap: () async {
              // openGallery();
              print('kkkk');
              onPressed();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/uplodicon.png", width: 32),
                const SizedBox(height: 5),
                const Text('Image should not be more than 2 mb'),
                for (var picture in _pictures) Image.file(File(picture))
              ],
            ),
          ));
    } else {
      return InkWell(
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
                      const SizedBox(width: 10),
                      openFie(),
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

  //Document Scan
  void onPressed() async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures() ?? [];
      if (!mounted) return;
      setState(() {
        _pictures = pictures;
        imagedoc2 = File(_pictures[0]);
      });
    } catch (exception) {
      print('Image Not Pic');
    }
    List<int> fileInBytes = await imagedoc2!.readAsBytes();
    String fileInBase64 = base64Encode(fileInBytes);
    print('******************* BASE 64 SOURCE *******************');
    log(fileInBase64);
    //  con.uploaddoc = base64.encode(fileInBytes);
    print('******************* BASE 64 SOURCE *******************');
  }

  //Gallery Image
  Future<void> openGalleryImage() async {
    var picker = ImagePicker();
    final imageGallery = await picker.pickImage(source: ImageSource.gallery);
    if (imageGallery!.path.isEmpty == false) {
      setState(() {
        imagedoc2 = File(imageGallery!.path);
      });
      List<int> fileInBytes = await imagedoc2!.readAsBytes();
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

  Widget bulildbutton() {
    return AuthButton(
        decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        onTap: () {
          if (phoneNumberController.text.isEmpty) {
            Fluttertoast.showToast(
              msg: 'Enter ${dropdownvalue} Number',
            );
          } else {
            con.ocrdocument();
            // Fluttertoast.showToast(msg: "Data Saved");

          }
        },
        text: "Next");
  }

  void _showPicker(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
                padding: const EdgeInsets.only(top: 10),
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Pick image from",
                        style: TextStyle(fontSize: 16)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () async {
                                      openGalleryImage();
                                      Get.back();
                                    },
                                    child: Image.asset("assets/gallery.jpg",
                                        height: 50)),
                                const SizedBox(height: 5),
                                const Text("Gallery")
                              ],
                            )),
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () async {
                                      onPressed();
                                      Get.back();
                                    },
                                    child: Image.asset("assets/camera_new.png",
                                        height: 50)),
                                const SizedBox(height: 5),
                                const Text("Scan")
                              ],
                            )),
                      ],
                    ),
                  ],
                )),
          );
        });
  }
}
