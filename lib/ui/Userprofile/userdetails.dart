import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../widgets/custom_input.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final formKey = GlobalKey<FormState>();
  final formKeys = GlobalKey<FormState>();

  final _holdernameController = TextEditingController();
  final _middleController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _postalController = TextEditingController();
  final _possportController = TextEditingController();

  TextEditingController dateCtl = TextEditingController();
  File? imgFiles;
  File? imgcameraFile;
  File? imggalleryFiles;
  final ImagePicker _picker = ImagePicker();

  void openCamera() async {
    var cameraFile = await _picker.pickImage(source: ImageSource.camera);
    //int sizeInBytes = File(imgcameraFile!.path).lengthSync();
    //double sizeInMb = sizeInBytes / (1024 * 1024);

    setState(() {
      imgcameraFile = File(cameraFile!.path);
    });
  }

  void openGallery() async {
    var imgGallery = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imggalleryFiles = File(imgGallery!.path);
    });
  }

  var item = [
    'UserE890',
    'UserE891',
    'UserE892',
    'UserE893',
    'UserE894',
    'UserE895',
  ];
  String? dropdownvalue;

  var country = [
    'India',
    'America',
    'Usa',
    'Uk',
  ];
  String? dropdowncountry;
  var city = [
    'TamilNadu',
    'Chennai',
    'Salam',
    'Thanipadi',
  ];
  String? dropdowncity;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: Text(
            "User Details",
            style: TextStyle(
                color: Color(0Xff1B1B1B),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            indicatorColor: Color(0XffCEE812),
            indicatorWeight: 2.5,
            tabs: [
              Tab(
                text: "Personal Details",
              ),
              Tab(
                text: "National ID ",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [bulidForm(), bulidImageFileld()]),
      ),
    );
  }

  Widget bulidForm() {
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          _buildImage(),
          SizedBox(
            height: 20,
          ),
          _buildImageEdit(),
          SizedBox(
            height: 40,
          ),
          _buildField()
        ],
      ),
    ));
  }

  Widget _buildImageEdit() {
    return InkWell(
        onTap: () {
          _showPicker(context);
        },
        child: Text(
          'Edit Avatar',
        ));
  }

  Widget _buildImage() {
    if (imgFiles == null) {
      return Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
              color: Color(0Xff004751),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/banner/userprofile.png"),
                  fit: BoxFit.fill)));
    } else {
      return Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 3),
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  fit: BoxFit.fill, image: FileImage(imgFiles!))));
    }
  }

  Widget _buildField() {
    return Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCustomInputBox(
                    label: "First Name*",
                    controller: _holdernameController,
                    //label: 'Email address',
                    obsecureText: false,
                    inputHint: 'Enter your first name',
                    /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                    validator: (value) {
                      if (_holdernameController.text.isEmpty) {
                        return "Please Enter The Holder Name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  MyCustomInputBox(
                    label: "Middle Name ",
                    controller: _middleController,
                    //label: 'Email address',
                    obsecureText: false,
                    inputHint: 'Enter your Middle name',
                    /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                  ),
                  MyCustomInputBox(
                    label: "Last Name*",
                    controller: _lastnameController,
                    //label: 'Email address',
                    obsecureText: false,
                    inputHint: 'Enter your last name',
                    /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                    validator: (value) {
                      if (_lastnameController.text.isEmpty) {
                        return "Please Enter Number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  MyCustomInputBox(
                    label: "Enter Your Email*",
                    controller: _emailController,
                    //label: 'Email address',
                    obsecureText: false,
                    inputHint: 'Enter valid email id',
                    /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
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
                  MyCustomInputBox(
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
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Choose your Interests',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: HexColor('#505050')))),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1)),
                      ),
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
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Date of Birth*',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: HexColor('#505050')))),
                  const SizedBox(
                    height: 15,
                  ),
                  Stack(clipBehavior: Clip.none, children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        alignment: Alignment.bottomCenter,
                        width: MediaQuery.of(context).size.width / 1,
                        height: MediaQuery.of(context).size.width / 7,
                        child: TextFormField(
                          controller: dateCtl,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                  color: HexColor('#B7C5C7'), width: 1.3),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                  color: HexColor('#B7C5C7'), width: 1.3),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              gapPadding: 5,
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 255, 9, 9)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 255, 9, 9)),
                            ),
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
                        icon: Icon(
                          Icons.calendar_today,
                          size: 20,
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
                  const SizedBox(
                    height: 15,
                  ),
                  MyCustomInputBox(
                    label: "Address*",
                    controller: _addressController,
                    //label: 'Email address',
                    obsecureText: false,
                    inputHint: 'Enter your Account Number',
                    suffixIcon: Icon(Icons.calendar_today),
                    /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                    validator: (value) {
                      if (_addressController.text.isEmpty) {
                        return "Please Enter Account Number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Country',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: HexColor('#505050')))),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1)),
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
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('City',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: HexColor('#505050')))),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1)),
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
                  const SizedBox(
                    height: 15,
                  ),
                  MyCustomInputBox(
                    label: "Postal code",
                    controller: _postalController,
                    //label: 'Email address',
                    obsecureText: false,
                    inputHint: 'Enter Postal code',
                    /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                    validator: (value) {
                      if (_postalController.text.isEmpty) {
                        return "Please Enter Account Number";
                      } else {
                        return null;
                      }
                    },
                  ),
                ])));
  }

  void _showPicker(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
                padding: EdgeInsets.only(top: 10),
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pick image from",
                      style: TextStyle(fontSize: 16),
                    ),
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
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Gallery",
                                )
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
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
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

  Widget bulidImageFileld() {
    return SingleChildScrollView(
        child: Form(
      key: formKeys,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          MyCustomInputBox(
            label: "Your Id",
            controller: _possportController,
            //label: 'Email address',
            obsecureText: false,
            inputHint: 'Passport',
            /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
            validator: (value) {
              if (_possportController.text.isEmpty) {
                return "Please Enter Passport";
              } else {
                return null;
              }
            },
          ),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text('Upload your ID',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 14,
                      color: HexColor('#505050')))),
          SizedBox(
            height: 15,
          ),
          displayImage(),
          SizedBox(
            height: 15,
          ),
          MyCustomInputBox(
            label: "Id Number",
            controller: _postalController,
            //label: 'Email address',
            obsecureText: false,
            inputHint: 'Enter Postal code',
            /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
            validator: (value) {
              if (_postalController.text.isEmpty) {
                return "Please Enterid Number";
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text('Upload your Selfie',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 14,
                      color: HexColor('#505050')))),
          SizedBox(
            height: 15,
          ),
          displayImageSelfie(),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    ));
  }

  Widget displayImageSelfie() {
    if (imgcameraFile == null) {
      return Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 1,
          height: 160,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0XffB7C5C7), width: 1.5),
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
                SizedBox(
                  height: 5,
                ),
                Text('Upload your Selfie'),
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
                openCamera();
              },
              child: Image.file(imgcameraFile!, height: 160)));
    }
  }

  Widget displayImage() {
    if (imggalleryFiles == null) {
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
                Image.asset(
                  "assets/uplodicon.png",
                  width: 32,
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Image should not be more than 2 mb'),
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
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            width: MediaQuery.of(context).size.width / 1,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0XffB7C5C7), width: 1.5),
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

}
