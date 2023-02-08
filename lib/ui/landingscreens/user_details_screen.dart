// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cardit/ui/register/select_avatar_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/material_dialogs.dart';

import '../../responsive/responsive.dart';
import '../../widgets/custom_input.dart';
import 'upload_documents_screen.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final formKey = GlobalKey<FormState>();

  final _holdernameController = TextEditingController();
  final _middleController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _postalController = TextEditingController();

  TextEditingController dateCtl = TextEditingController();
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

  var item = [
    'UserE890',
    'UserE891',
    'UserE892',
    'UserE893',
    'UserE894',
    'UserE895'
  ];

  String? dropdownvalue;
  var country = ['India', 'America', 'Usa', 'Uk'];
  String? dropdowncountry;
  var city = ['TamilNadu', 'Chennai', 'Salam', 'Thanipadi'];
  String? dropdowncity;

  @override
  Widget build(BuildContext context) {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          leading: BackButton(
            color: Colors.black,
          ),
          title: Responsive.isMobile(context)
              ? Text(
                  "User Details",
                  style: TextStyle(
                      color: Color(0Xff1B1B1B),
                      fontSize: Responsive.isMobile(context) ? 24 : 18,
                      fontWeight: FontWeight.bold),
                )
              : Center(
                  child: Text(
                    "User Details",
                    style: TextStyle(
                        color: Color(0Xff1B1B1B),
                        fontSize: Responsive.isMobile(context) ? 24 : 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
          bottom: TabBar(
            indicatorColor: Color(0XffCEE812),
            indicatorWeight: 2.5,
            tabs: const [
              Tab(text: "Personal Details"),
              Tab(text: "Upload Document"),
            ],
          ),
        ),
        body: Responsive.isMobile(context)
            ? TabBarView(children: [
                bulidForm(),
                UploadDocuments(),
              ])
            : Responsive.isDesktop(context)
                ? TabBarView(children: [
                    buildformweb(),
                    UploadDocuments(),
                  ])
                : TabBarView(children: [
                    buildformweb(),
                    UploadDocuments(),
                  ]),
      ),
    );
  }

  Widget buildformweb() {
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: [
          const SizedBox(height: 40),
          _buildImage(),
          const SizedBox(height: 20),
          _buildImageEdit(),
          const SizedBox(height: 40),
          _buildFieldweb()
        ],
      ),
    ));
  }

  Widget bulidForm() {
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: [
          const SizedBox(height: 40),
          _buildImage(),
          const SizedBox(height: 20),
          _buildImageEdit(),
          const SizedBox(height: 40),
          _buildField()
        ],
      ),
    ));
  }

  Widget _buildImageEdit() {
    return GestureDetector(
        onTap: () {
          _showPicker(context);
        },
        child: const Text('Edit Avatar'));
  }

  Widget _buildImage() {
    if (imgFiles == null) {
      return SizedBox(
        height: 115,
        width: 115,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.red,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/banner/userprofile.png"),
                backgroundColor: Colors.white,
                radius: 55,
              ),
            ),
            Positioned(
                bottom: 5,
                right: -10,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: MaterialButton(
                      onPressed: () {
                        cameraOptions(context);
                      },
                      child: const Icon(Icons.camera_alt_outlined,
                          color: Colors.white),
                      padding: const EdgeInsets.all(5),
                      shape: const CircleBorder()),
                )),
          ],
        ),
      );

      // Container(
      //   height: 125.0,
      //   width: 125.0,
      //   decoration: const BoxDecoration(
      //       color: Color(0Xff004751),
      //       shape: BoxShape.circle,
      //       image: DecorationImage(
      //           image: AssetImage("assets/banner/userprofile.png"),
      //           fit: BoxFit.fill)));
    } else {
      return Container(
          height: 125.0,
          width: 125.0,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 3),
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  fit: BoxFit.fill, image: FileImage(imgFiles!))));
    }
  }

  Widget _buildFieldweb() {
    return Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 8
                            : MediaQuery.of(context).size.width / 14,
                      ),
                      Text(
                        "First Name *",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Responsive.isDesktop(context)
                        ? MediaQuery.of(context).size.width / 4
                        : MediaQuery.of(context).size.width / 3,
                    child: TextFormField(
                      enabled: true,
                      //label: "First Name*",
                      controller: _holdernameController,
                      obscureText: false,
                      //inputHint: 'Enter your first name',
                      validator: (value) {
                        if (_holdernameController.text.isEmpty) {
                          return "Please Enter First Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hoverColor: Colors.transparent,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter First Name',
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
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(
                        width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 8
                            : MediaQuery.of(context).size.width / 14,
                      
                      ),
                      Text(
                        "Middle Name ",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                  width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4
                            : MediaQuery.of(context).size.width / 3,
                      
                    child: TextFormField(
                      enabled: true,
                      // label: "Middle Name ",
                      controller: _middleController,
                      obscureText: false,
                      // inputHint: 'Enter your Middle name',
                      decoration: InputDecoration(
                        hoverColor: Colors.transparent,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Middle name',
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
                        if (_middleController.text.isEmpty) {
                          return 'Please Enter Middle Name';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(
                        width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 8
                            : MediaQuery.of(context).size.width / 14,
                      
                      ),
                      Text(
                        "Last Name *",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                   width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4
                            : MediaQuery.of(context).size.width / 3,
                      
                    child: TextFormField(
                      enabled: true,
                      // label: "Last Name*",
                      controller: _lastnameController,
                      obscureText: false,
                      // inputHint: 'Enter your last name',
                      validator: (value) {
                        if (_lastnameController.text.isEmpty) {
                          return "Please Enter Last Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hoverColor: Colors.transparent,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Last name',
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
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(
                       width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 8
                            : MediaQuery.of(context).size.width / 14,
                      
                      ),
                      Text(
                        "Enter Your Email *",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                 width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4
                            : MediaQuery.of(context).size.width / 3,
                      
                    child: TextFormField(
                      enabled: true,
                      //label: "Enter Your Email*",
                      controller: _emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hoverColor: Colors.transparent,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Email',
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
                        if (_emailController.text.isEmpty) {
                          return "Please Enter The Email";
                        } else if (!_emailController.text.contains("@") ||
                            !_emailController.text.endsWith('.com')) {
                          return "Please Enter The valid Email";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(
                       width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 8
                            : MediaQuery.of(context).size.width / 14,
                      
                      ),
                      Text(
                        "Phone Number*",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /4
                            : MediaQuery.of(context).size.width / 3,
                      
                    child: TextFormField(
                      enabled: true,
                      // label: "Phone Number*",
                      controller: _phoneController,
                      obscureText: false,
                      // inputHint: 'Enter your Phone number',
                      validator: (value) {
                        if (_phoneController.text.isEmpty) {
                          return "Please Enter Phone number";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hoverColor: Colors.transparent,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Phone Number',
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
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                      width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4
                            : MediaQuery.of(context).size.width / 3,
                      
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Choose your Interests',
                          style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            // color: themeChange.darkTheme
                            //     ? Colors.white
                            //     : HexColor('#505050')
                          ))),
                  const SizedBox(height: 15),
                  Container(
                    // margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /4
                            : MediaQuery.of(context).size.width / 3,
                      
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                          )),
                      // underline:Container(),
                      //  validator: (value)=>value==null?'field required':null,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      value: dropdownvalue,
                      hint: const Text(
                        'Select your interests',
                        style:
                            TextStyle(color: Color(0Xff413D4B), fontSize: 14),
                      ),
                      icon: const InkWell(
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black45,
                        ),
                      ),
                      validator: (value) =>
                          value == null ? 'field required' : null,
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
                  const SizedBox(height: 15),
                  Container(
                       width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /4
                            : MediaQuery.of(context).size.width / 3,
                      alignment: Alignment.centerLeft,
                      // margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Date of Birth*',
                          style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            // color: Styles.whitecustomlable,
                          ))),
                  const SizedBox(height: 10),
                  Stack(clipBehavior: Clip.none, children: <Widget>[
                    // Container(
                    //     width: MediaQuery.of(context).size.width/4,
                    //     alignment: Alignment.centerLeft,
                    //     margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    //     child: Text('Date of Birth*',
                    //         style: TextStyle(
                    //           fontFamily: 'Sora',
                    //           fontSize: 14,
                    //           // color: Styles.whitecustomlable,
                    //         ))),

                    Container(

                        /// padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        alignment: Alignment.bottomCenter,
                         width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /4
                            : MediaQuery.of(context).size.width / 3,
                        // height: MediaQuery.of(context).size.width / 7,
                        child: TextFormField(
                          controller: dateCtl,
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.3)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                gapPadding: 5,
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 255, 9, 9))),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 255, 9, 9))),
                            //labelText: "Date of birth",
                            hintText: "Choose date",
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(65, 61, 75, 0.6),
                            ), // you need this
                          ),
                          onTap: () async {
                            DateTime date = DateTime(1900);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            date = (await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100)))!;
                            dateCtl.text =
                                DateFormat("yyyy-MM-dd").format(date);
                            // dateCtl.text = date.toIso8601String();
                          },
                        )),
                    Positioned(
                      bottom: 0,
                      top: 5,
                      right: 13,
                      child: IconButton(
                        icon: const Icon(
                          Icons.calendar_today,
                          size: 20,
                          color: Colors.grey,
                        ),
                        tooltip: 'start',
                        onPressed: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(new FocusNode());
                          date = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100)))!;
                          dateCtl.text = DateFormat("yyyy-MM-dd").format(date);
                        },
                      ),
                    )
                  ]),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(
                         width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /8
                            : MediaQuery.of(context).size.width / 14,
                      ),
                      Text(
                        "Address *",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /4
                            : MediaQuery.of(context).size.width / 3,
                    child: TextFormField(
                      enabled: true,
                      // label: "Address*",
                      controller: _addressController,
                      obscureText: false,

                      validator: (value) {
                        if (_addressController.text.isEmpty) {
                          return "Please Enter your Address";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hoverColor: Colors.transparent,
                        suffixIcon: const Icon(Icons.calendar_today),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Address',
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
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(
                         width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /8
                            : MediaQuery.of(context).size.width / 14,
                      ),
                      Text(
                        "Country",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    //   margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /4
                            : MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey)),
                      ),
                      // underline:Container(),
                      //  validator: (value)=>value==null?'field required':null,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      value: dropdownvalue,
                      hint: const Text(
                        'Select your country',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.normal,
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
                      items: country.map((String country) {
                        return DropdownMenuItem(
                          value: country,
                          child: Text(country,
                              style: const TextStyle(
                                  color: Color(0Xff413D4B), fontSize: 14)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdowncountry = newValue!;
                        });
                      },

                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(
                         width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /8
                            : MediaQuery.of(context).size.width / 14,
                      ),
                      Text(
                        "City",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                 
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    // margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                     width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /4
                            : MediaQuery.of(context).size.width / 3,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hoverColor: Colors.transparent,
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey)),
                      ),
                      // underline:Container(),
                      //  validator: (value)=>value==null?'field required':null,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      value: dropdownvalue,
                      hint: const Text(
                        'Select your city',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.normal,
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
                      items: city.map((String city) {
                        return DropdownMenuItem(
                          value: city,
                          child: Text(city,
                              style: const TextStyle(
                                  color: Color(0Xff413D4B), fontSize: 13)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdowncity = newValue!;
                        });
                      },
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(
                        width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /8
                            : MediaQuery.of(context).size.width / 14,
                      ),
                      Text(
                        "Postal Code",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width /4
                            : MediaQuery.of(context).size.width / 3,
                    child: TextFormField(
                      enabled: true,
                      // label: "Postal code",
                      controller: _postalController,
                      obscureText: false,
                      validator: (value) {
                        if (_postalController.text.isEmpty) {
                          return "Please Enter Postal Code";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hoverColor: Colors.transparent,
                        fillColor: Colors.white,
                        hintText: 'Enter Postal Code',
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
                    ),
                  ),
                  const SizedBox(height: 30),
                ])));
  }

  Widget _buildField() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCustomInputBox(
                    enabled: true,
                    label: "First Name*",
                    controller: _holdernameController,
                    obsecureText: false,
                    inputHint: 'Enter your first name',
                    validator: (value) {
                      if (_holdernameController.text.isEmpty) {
                        return "Please Enter First Name";
                      } else {
                        return null;
                      }
                    },
                    inputDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter First Name',
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
                  ),
                  const SizedBox(height: 15),
                  MyCustomInputBox(
                    enabled: true,
                    label: "Middle Name ",
                    controller: _middleController,
                    obsecureText: false,
                    inputHint: 'Enter your Middle name',
                    inputDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Middle name',
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
                      if (_middleController.text.isEmpty) {
                        return 'Please Enter Middle Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  MyCustomInputBox(
                    enabled: true,
                    label: "Last Name*",
                    controller: _lastnameController,
                    obsecureText: false,
                    inputHint: 'Enter your last name',
                    validator: (value) {
                      if (_lastnameController.text.isEmpty) {
                        return "Please Enter Last Name";
                      } else {
                        return null;
                      }
                    },
                    inputDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Last name',
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
                  ),
                  const SizedBox(height: 15),
                  MyCustomInputBox(
                    enabled: true,
                    label: "Enter Your Email*",
                    controller: _emailController,
                    obsecureText: false,
                    inputDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Email',
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
                      if (_emailController.text.isEmpty) {
                        return "Please Enter The Email";
                      } else if (!_emailController.text.contains("@") ||
                          !_emailController.text.endsWith('.com')) {
                        return "Please Enter The valid Email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  MyCustomInputBox(
                    enabled: true,
                    label: "Phone Number*",
                    controller: _phoneController,
                    obsecureText: false,
                    inputHint: 'Enter your Phone number',
                    validator: (value) {
                      if (_phoneController.text.isEmpty) {
                        return "Please Enter Phone number";
                      } else {
                        return null;
                      }
                    },
                    inputDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Phone Number',
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
                  ),
                  const SizedBox(height: 15),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Choose your Interests',
                          style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            // color: themeChange.darkTheme
                            //     ? Colors.white
                            //     : HexColor('#505050')
                          ))),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                      // underline:Container(),
                      //  validator: (value)=>value==null?'field required':null,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      value: dropdownvalue,
                      hint: const Text(
                        'Select your interests',
                        style:
                            TextStyle(color: Color(0Xff413D4B), fontSize: 14),
                      ),
                      icon: const InkWell(
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black45,
                        ),
                      ),
                      validator: (value) =>
                          value == null ? 'field required' : null,
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
                  const SizedBox(height: 15),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Date of Birth*',
                          style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            // color: Styles.whitecustomlable,
                          ))),
                  const SizedBox(height: 15),
                  Stack(clipBehavior: Clip.none, children: <Widget>[
                    Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        alignment: Alignment.bottomCenter,
                        width: MediaQuery.of(context).size.width / 1,
                        height: MediaQuery.of(context).size.width / 7,
                        child: TextFormField(
                          controller: dateCtl,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.3)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.3)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                gapPadding: 5,
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 255, 9, 9))),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 255, 9, 9))),
                            //labelText: "Date of birth",
                            hintText: "Choose date",
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(65, 61, 75, 0.6),
                            ), // you need this
                          ),
                          onTap: () async {
                            DateTime date = DateTime(1900);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            date = (await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100)))!;
                            dateCtl.text =
                                DateFormat("yyyy-MM-dd").format(date);
                            // dateCtl.text = date.toIso8601String();
                          },
                        )),
                    Positioned(
                      bottom: 0,
                      top: 2,
                      right: 13,
                      child: IconButton(
                        icon: const Icon(
                          Icons.calendar_today,
                          size: 20,
                          color: Colors.grey,
                        ),
                        tooltip: 'start',
                        onPressed: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(new FocusNode());
                          date = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100)))!;
                          dateCtl.text = DateFormat("yyyy-MM-dd").format(date);
                        },
                      ),
                    )
                  ]),
                  const SizedBox(height: 15),
                  MyCustomInputBox(
                    enabled: true,
                    label: "Address*",
                    controller: _addressController,
                    obsecureText: false,
                    suffixIcon: const Icon(Icons.calendar_today),
                    validator: (value) {
                      if (_addressController.text.isEmpty) {
                        return "Please Enter Account Number";
                      } else {
                        return null;
                      }
                    },
                    inputDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Address',
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
                  ),
                  const SizedBox(height: 15),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Country',
                          style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            // color: Styles.whitecustomlable,
                          ))),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1)),
                      ),
                      // underline:Container(),
                      //  validator: (value)=>value==null?'field required':null,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      value: dropdownvalue,
                      hint: const Text(
                        'Select your country',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.normal,
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
                      items: country.map((String country) {
                        return DropdownMenuItem(
                          value: country,
                          child: Text(country,
                              style: const TextStyle(
                                  color: Color(0Xff413D4B), fontSize: 14)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdowncountry = newValue!;
                        });
                      },

                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('City',
                          style: TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 14,
                            // color: Styles.whitecustomlable,
                          ))),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1)),
                      ),
                      // underline:Container(),
                      //  validator: (value)=>value==null?'field required':null,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      value: dropdownvalue,
                      hint: const Text(
                        'Select your city',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.normal,
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
                      items: city.map((String city) {
                        return DropdownMenuItem(
                          value: city,
                          child: Text(city,
                              style: const TextStyle(
                                  color: Color(0Xff413D4B), fontSize: 13)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdowncity = newValue!;
                        });
                      },
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  MyCustomInputBox(
                    enabled: true,
                    label: "Postal code",
                    controller: _postalController,
                    obsecureText: false,
                    validator: (value) {
                      if (_postalController.text.isEmpty) {
                        return "Please Enter Postal Code";
                      } else {
                        return null;
                      }
                    },
                    inputDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Postal Code',
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
                  ),
                  const SizedBox(height: 30),
                ])));
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
                                      var camerasFile = await ImagePicker()
                                          .pickImage(
                                              source: ImageSource.gallery,
                                              imageQuality: 70);
                                      setState(() {
                                        imgFiles = File(camerasFile!.path);
                                      });
                                      Navigator.of(context).pop();
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
                                      XFile? cameraFile = await ImagePicker()
                                          .pickImage(
                                              source: ImageSource.camera,
                                              imageQuality: 70);
                                      setState(() {
                                        imgFiles = File(cameraFile!.path);
                                      });

                                      Navigator.of(context).pop();
                                    },
                                    child: Image.asset("assets/camera_new.png",
                                        height: 50)),
                                const SizedBox(height: 5),
                                const Text(
                                  "Camera",
                                )
                              ],
                            )),
                      ],
                    ),
                  ],
                )),
          );
        });
  }

  cameraOptions(BuildContext context) {
    return Dialogs.materialDialog(
        color: Colors.white,
        msg: 'Select your mode to upload profile',
        title: 'Upload Images',
        dialogWidth: kIsWeb ? 0.3 : null,
        context: context,
        actions: [
          Column(
            children: [
              SizedBox(
                height: 48.0,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 2.0),
                            blurRadius: 8.0,
                            spreadRadius: 2.0)
                      ]),
                  child: Stack(
                    children: <Widget>[
                      Container(
                          width: 48.0,
                          height: 48.0,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: HexColor('#CEE812'),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: const Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.person, color: Colors.black))),
                      Align(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                            minWidth: 220,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AvatarPageView()));
                            },
                            child: Center(
                              child: Text(
                                'Choose Default Avator',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 48.0,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 2.0),
                            blurRadius: 8.0,
                            spreadRadius: 2.0)
                      ]),
                  child: Stack(
                    children: <Widget>[
                      Container(
                          width: 48.0,
                          height: 48.0,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: HexColor('#CEE812'),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: const Align(
                              alignment: Alignment.center,
                              child:
                                  Icon(Icons.camera_alt, color: Colors.black))),
                      Align(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                            minWidth: 220,
                            onPressed: () {
                              openCamera();
                            },
                            child: Center(
                              child: Text(
                                'Take Selfi',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          )
        ]);
  }
}
