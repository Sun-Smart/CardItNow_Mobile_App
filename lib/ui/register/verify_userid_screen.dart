// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cardit/const/responsive.dart';
import 'package:cardit/themes/styles.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/ui/register/select_avatar_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../api/regster_api.dart';
import '../../utils/shuftipro.dart';
import 'pdfView.dart';

class VerifyUserId extends StatefulWidget {
  const VerifyUserId({Key? key}) : super(key: key);

  @override
  State<VerifyUserId> createState() => _VerifyUserIdState();
}

class _VerifyUserIdState extends State<VerifyUserId> {

  @override
  void initState() {

    super.initState();
  }


  final formKey = GlobalKey<FormState>();
  RegisterAPI reg = Get.put(RegisterAPI());
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

  //cropimage functions

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(
      source: source,
      imageQuality: 100,
      maxHeight: 700,
      maxWidth: 700,
    );
    if (image == null) return;
    if(kIsWeb){
      setState(() {
        imagedoc2 = File(image.path.toString());
      });
        List<int> bytes = await image.readAsBytes();
        con.scandocs = base64Encode(bytes);
    } else {
      await _cropImage(image.path);
    }
  }


  CroppedFile? _croppedFile;

  File? _image;
  Future<Null> _cropImage(String? imagespath) async {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        compressQuality: 100,
        sourcePath: imagespath.toString(),
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop Your Image',
              toolbarColor: Colors.transparent,
              toolbarWidgetColor: Colors.black,
              initAspectRatio: CropAspectRatioPreset.ratio4x3,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: CroppieBoundary(
              width: 350,
              height: 250,
            ),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      setState(() {
      imagedoc2 = File(croppedFile!.path.toString());
      });
      List<int> fileInBytes = await imagedoc2!.readAsBytes();
      con.scandocs = base64.encode(fileInBytes);
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

  final RegisterAPI con = Get.find();
  String? dropdownvalue;
  var philipineData = ['Passport', 'Driving Licence', 'National ID', 'UMID'];
  var uaeData = ['UAE'];


  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
          return Scaffold(

              bottomSheet:
              Responsive.isMobile(context) ? bulildbutton() : null,
              appBar: Responsive.isMobile(context)
                  ? AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                // leading: BackButton(
                //   color: themeChange.darkTheme ? Colors.white : Colors.black,
                // ),
                actions: [

                  const SizedBox(width: 20),
                ],
              )
                  : null,
              body: Responsive.isMobile(context)
                  ? SingleChildScrollView(
                child: Container(
                  //color: Color(0XFFffffff),
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildtitle(),
                              bulidForm(),
                            ]))),
              )
              //
                  : Responsive.isDesktop(context)
                  ? Row(
                children: [
                  // Container(
                  //   width: MediaQuery.of(context).size.width / 3,
                  //   height: MediaQuery.of(context).size.width / 1,
                  //   color: Color(0XFF004751),
                  //   child: Center(
                  //       child: Image.asset("assets/applogo-02.png",
                  //           width: MediaQuery.of(context).size.width / 1.5, height:  MediaQuery.of(context).size.height / 3
                  //         )),
                  // ),
                  Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      //color: Color(0XFFffffff),
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  BackButton(
                                    color:  Colors.black,
                                  ),
                                ],
                              ),
                              // buildToptitle(),
                              buildtitle(),
                              bulidForm(),
                              bulildbutton()
                            ]),
                      ))
                ],
              )
                  : Row(
                children: [
                  // Container(
                  //   width: MediaQuery.of(context).size.width / 3,
                  //   color: Color(0XFF004751),
                  //   child: Center(
                  //       child: Image.asset("assets/applogo-02.png",
                  //           width: MediaQuery.of(context).size.width / 1.5, height:  MediaQuery.of(context).size.height / 3
                  //         )),
                  // ),
                  Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                BackButton(
                                  color:  Colors.black,
                                ),
                              ],
                            ),
                            // buildToptitle(),
                            buildtitle(),
                            bulidForm(),
                            bulildbutton()
                          ]))
                ],
              ));
  }

  Widget buildToptitle() {
    return Row(
        mainAxisAlignment: Responsive.isMobile(context)
            ? MainAxisAlignment.start
            : Responsive.isDesktop(context)
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.spaceBetween,
      
        children: [
          IconButton(
            hoverColor: Colors.transparent,
            icon: Icon(Icons.close, size: 30),
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
                      color: HexColor('#004751'), fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {
              Get.to(const AvatarPageView());
            },
          ),
        ]);
  }

  Widget buildtitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(
        'Let Us Verify You',
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
                  Row(
                    children: [
                      SizedBox(
                        width: Responsive.isMobile(context)
                            ? 0
                            :  Responsive.isDesktop(context)?MediaQuery.of(context).size.width / 5:
                            MediaQuery.of(context).size.width / 9,
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text('Select ID',
                               style: TextStyle(fontFamily: 'Sora', fontSize: 16,fontWeight: FontWeight.bold),)),
                    ],
                  ),
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
                        value: con.countrywisedoc,
                        hint: Text('Choose Your Document',
                            style: TextStyle(
                                color: Styles.whitecustomlable, fontSize: 14)),
                        icon: InkWell(
                            child: Icon(
                              Icons.keyboard_arrow_down,

                            )),
                        items: con.pickdoc.map((dynamic item) {
                          return DropdownMenuItem(
                              value: item,
                              child: Text(item["value"],
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)));
                        }).toList(),
                        onChanged: (dynamic newValue) {
                          setState(() {
                            con.countrywisedoc = newValue!;
                          });
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        width: Responsive.isMobile(context)
                            ? 0
                            :  Responsive.isDesktop(context)?MediaQuery.of(context).size.width / 5:
                            MediaQuery.of(context).size.width / 9,
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text('Scan your ID',
                               style: TextStyle(fontFamily: 'Sora', fontSize: 16,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  SizedBox(height: 10,),
                  displayImagedoc(),
                  const SizedBox(height: 20),
                 Responsive.isMobile(context)? MyCustomInputBox(
                      enabled: true,
                      label: "Enter ID Number ",
                      controller: reg.documentIDController.obs.value,
                      obsecureText: false,
                      inputDecoration: InputDecoration(
                        labelStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: con.countrywisedoc == null
                            ? "Enter Document No"
                            : 'Enter ${con.countrywisedoc["value"]} Number',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        helperStyle:
                            const TextStyle(fontFamily: 'Sora', fontSize: 14),
                        hintStyle: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold),
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
                        // if (dropdownvalue == null) {
                        //   return "Enter Your Document Type";
                        // } else {
                        //   return "Enter ${dropdownvalue.toString()} Number";
                        // }
                      }):Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width:
                                   Responsive.isDesktop(context)? MediaQuery.of(context).size.width / 4.8:
                                 MediaQuery.of(context).size.width / 8  ),
                                    Text(
                          "Enter ID Numbers ",
                         style: TextStyle(fontFamily: 'Sora', fontSize: 16,fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                              
                              Container(
                            width: Responsive.isDesktop(context)
            ? MediaQuery.of(context).size.width / 4.5
            : MediaQuery.of(context).size.width / 2.5,
                          child: TextFormField(
                            enabled: true,
                                             // label: "Enter ID Number ",
                          controller: reg.documentIDController.obs.value,
                          obscureText: false,
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
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
                                            
                          validator: (value) {
                            // if (dropdownvalue == null) {
                            //   return "Enter Your Document Type";
                            // } else {
                            //   return "Enter ${dropdownvalue.toString()} Number";
                            // }
                            }
                          ),
                              ),
                        ],
                      ),
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
            if(con.countrywisedoc != null) {
            if(kIsWeb){
              // Shuftipro web=  Shuftipro();
              // web.loadreference();
              getImage(
                  ImageSource
                      .gallery);
            } else {

                Shuftipro pro = Shuftipro();
                pro.continueFun();


            }}
            else{
              Fluttertoast.showToast(
                msg: 'Choose your document',
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

             ShuftiProValues==null?

              Icon(Icons.camera_alt_outlined):Icon(Icons.done, color: Colors.green,size: 40,),

              const SizedBox(height: 5),
       ShuftiProValues==null? Text('Scan your Document'): Text('Successfully Verified')

            ],
          ),
        ),
      );
    } else {
      return Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width:Responsive.isDesktop(context) ? MediaQuery.of(context).size.width / 4 : MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: InkWell(
              onTap: () async {
                if(con.countrywisedoc != null) {
                  if (kIsWeb) {
              //         Shuftipro web=  Shuftipro();
              // web.loadreference();
                    getImage(
                        ImageSource
                            .gallery);
                  } else {
                    Shuftipro pro = Shuftipro();
                    pro.continueFun();
                  }
                }
                else{
                  Fluttertoast.showToast(
                    msg: 'Choose your document',
                  );
                }
              },
              child: kIsWeb
            ?Image.network(imagedoc2!.path, fit: BoxFit.fill, height: 150)
             : Image.file(
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
              // onPressed();
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
          if (reg.documentIDController.text.isEmpty) {
            Fluttertoast.showToast(
              msg: 'Enter ${dropdownvalue.toString()} Number',
            );
          }
          if(kIsWeb){
          con.uploadDocx(con.emailController.text, reg.documentIDController.text);
          }
          else if(
          ShuftiProValues==null
          ){
            Fluttertoast.showToast(msg: "Your Verification Process is Unsuccessful Please Verify");
          }
          else if(con.countrywisedoc == null){
           Fluttertoast.showToast(msg: "Select Document type");
          }
            else{
               con.uploadDocx(con.emailController.text, reg.documentIDController.text);
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
                                      getImage(
                                          ImageSource
                                              .gallery);
                                      // openGalleryImage();
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
                                      getImage(
                                          ImageSource
                                              .camera);
                                      // onPressed();
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
