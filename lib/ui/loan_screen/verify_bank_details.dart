import 'dart:io';

import 'package:cardit/ui/loan_screen/payment_overview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../../responsive/responsive.dart';
import '../../themes/styles.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({super.key});

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  final formKey = GlobalKey<FormState>();
  final _holdernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _businessController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _selectbankController = TextEditingController();
  final _accountnumberController = TextEditingController();
  final _swiftcodeController = TextEditingController();
  var item = [
    'Indin Bank',
    'Axis Bank',
    'ICIC Bank',
    'IDBI Bank',
  ];
  String? dropdownvalue;
  File? imggalleryFile;
  final ImagePicker _picker = ImagePicker();
  void openGallery() async {
    var imgGallery = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imggalleryFile = File(imgGallery!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Responsive.isMobile(context) ? bulildbutton() : null,
      appBar: Responsive.isMobile(context)
          ? PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: AppBar(
                  leading: BackButton(
                    color: Colors.black,
                  ),
                  centerTitle: true,
                  title: Text(
                    'Verify Bank Details',
                    style: TextStyle(
                        color: Color(0Xff1B1B1B),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          : null,
      body: Responsive.isMobile(context)? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                " * The Amount Will Be Directly Debited From Your Account",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ),
            _buildField(),
          ],
        ),
      ):Row(
        children: [
          Container(
             width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Image.asset("assets/applogo-02.png",
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: MediaQuery.of(context).size.height / 3)),
          ),
          Container(
             width: MediaQuery.of(context).size.width / 1.5,
            child: SingleChildScrollView(
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
            SizedBox(height: 20,),
                  Text(
                    'Verify Bank Details',
                    style: TextStyle(
                        color: Color(0Xff1B1B1B),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                " * The Amount Will Be Directly Debited From Your Account",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ),
            _buildField(),
          ],
        ),
      ),
          )
        ],
      ),
    ));
  }

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
            //'/registerloading',
            //  '/paymentsdetails'
            //'/4digitpasscode'
            '/paymentoverview');

        // showAlertDialog(context);
      },
      text: "Next",
    );
  }

  Widget _buildField() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return  Responsive.isMobile(context)?Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Select Bank',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: Styles.whitecustomlable))),
                  const SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFE5E5E5), width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3))),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFFE5E5E5))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFFE5E5E5))),
                        contentPadding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFFE5E5E5))),
                      ),
                      // underline:Container(),
                      //  validator: (value)=>value==null?'field required':null,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      value: dropdownvalue,
                      hint: Text(
                        'Select user id',
                        style:
                            TextStyle(color: Color(0Xff413D4B), fontSize: 14),
                      ),
                      icon: InkWell(
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
                  MyCustomInputBox(
                    enabled: true,
                    label: "Account Number",
                    controller: _holdernameController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    obsecureText: false,
                    inputHint: 'Enter your account number',
                    validator: (value) {
                      if (_holdernameController.text.isEmpty) {
                        return "Please Enter The Holder Name";
                      } else {
                        return null;
                      }
                    },
                    inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        hintText: "Enter your account number",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        filled: true,
                        fillColor: Colors.white,
                        // floatingLabelBehavior: FloatingLabelBehavior.never,
                        helperStyle:
                            TextStyle(fontFamily: 'Sora', fontSize: 14),
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(65, 61, 75, 0.6))),
                  ),
                  MyCustomInputBox(
                    enabled: true,
                    label: "Enter Swift Code",
                    controller: _swiftcodeController,
                    obsecureText: false,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    inputHint: 'Enter swift code of your Bank',
                    validator: (value) {
                      if (_swiftcodeController.text.isEmpty) {
                        return "Please Enter Account Number";
                      } else {
                        return null;
                      }
                    },
                    inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        hintText: "Enter swift code of your Bank",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        filled: true,
                        fillColor: Colors.white,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        helperStyle:
                            TextStyle(fontFamily: 'Sora', fontSize: 14),
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(65, 61, 75, 0.6))),
                  ),
                  MyCustomInputBox(
                    enabled: true,
                    label: "Enter Branch Address",
                    controller: _swiftcodeController,
                    obsecureText: false,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    inputHint: 'Enter branch address',
                    validator: (value) {
                      if (_swiftcodeController.text.isEmpty) {
                        return "Please Enter Account Number";
                      } else {
                        return null;
                      }
                    },
                    inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        hintText: "Enter branch address",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        filled: true,
                        fillColor: Colors.white,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        helperStyle:
                            TextStyle(fontFamily: 'Sora', fontSize: 14),
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(65, 61, 75, 0.6))),
                  ),
                  const SizedBox(height: 15),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Upload last 3 month payslip',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: HexColor('#505050')))),
                  const SizedBox(height: 15),
                  displayImage(),
                ]))):Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox( width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width /4.8:
                    MediaQuery.of(context).size.width / 12,),
                        Text("Select Bank")
                    ],
                  ),
                   SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width / 4:
                    MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFE5E5E5), width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3))),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        hoverColor: Colors.transparent,
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFFE5E5E5))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFFE5E5E5))),
                        contentPadding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFFE5E5E5))),
                      ),
                      // underline:Container(),
                      //  validator: (value)=>value==null?'field required':null,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      value: dropdownvalue,
                      hint: Text(
                        'Select user id',
                        style:
                            TextStyle(color: Color(0Xff413D4B), fontSize: 14),
                      ),
                      icon: InkWell(
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox( width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width /4.8:
                    MediaQuery.of(context).size.width / 12,),
                        Text("Account Number")
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width /4:
                    MediaQuery.of(context).size.width / 2,
                    child: TextFormField(
                      enabled: true,
                     // label: "Account Number",
                      controller: _holdernameController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                     // inputHint: 'Enter your account number',
                      validator: (value) {
                        if (_holdernameController.text.isEmpty) {
                          return "Please Enter The Holder Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                          hintText: "Enter your account number",
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                          filled: true,
                          fillColor: Colors.white,
                          // floatingLabelBehavior: FloatingLabelBehavior.never,
                          helperStyle:
                              TextStyle(fontFamily: 'Sora', fontSize: 14),
                          hintStyle: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(65, 61, 75, 0.6))),
                    ),
                  ),
                  
                  
                   SizedBox(height: 20),
                     Row(
                    children: [
                      SizedBox( width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width /4.8:
                    MediaQuery.of(context).size.width / 12,),
                        Text("Enter Swift Code")
                    ],
                  ),
 SizedBox(height:10),
                    Container(
                      width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width /4:
                    MediaQuery.of(context).size.width / 2,
                      child: TextFormField(
                      enabled: true,
                     // label: "Enter Swift Code",
                      controller: _swiftcodeController,
                      obscureText: false,
                     keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                     // inputHint: 'Enter swift code of your Bank',
                      validator: (value) {
                        if (_swiftcodeController.text.isEmpty) {
                          return "Please Enter Account Number";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hoverColor: Colors.transparent,
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                          hintText: "Enter swift code of your Bank",
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                          filled: true,
                          fillColor: Colors.white,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          helperStyle:
                              TextStyle(fontFamily: 'Sora', fontSize: 14),
                          hintStyle: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(65, 61, 75, 0.6))),
                                      ),
                    ),
                 
                  SizedBox(height:20),
                   Row(
                    children: [
                      SizedBox( width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width /4.8:
                    MediaQuery.of(context).size.width / 12,),
                        Text("Enter Branch Address")
                    ],
                  ),
 SizedBox(height:10),
                 Container(
                  width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width /4:
                    MediaQuery.of(context).size.width /2,
                   child: TextFormField(
                      enabled: true,
                     // label: "Enter Branch Address",
                      controller: _swiftcodeController,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      //inputHint: 'Enter branch address',
                      validator: (value) {
                        if (_swiftcodeController.text.isEmpty) {
                          return "Please Enter Account Number";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hoverColor: Colors.transparent,
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                          hintText: "Enter branch address",
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                          filled: true,
                          fillColor: Colors.white,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          helperStyle:
                              TextStyle(fontFamily: 'Sora', fontSize: 14),
                          hintStyle: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(65, 61, 75, 0.6))),
                    ),
                 ),
                  const SizedBox(height: 20),
                  Container(
                      width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width /4:
                    MediaQuery.of(context).size.width /2,
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Upload last 3 month payslip',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: HexColor('#505050')))),
                  const SizedBox(height: 15),
                  displayImage(),
                  SizedBox(height: 30,),
                  GestureDetector(
    onTap: () {
      Get.to(PaymentOverview());
        // Navigator.of(context).pushNamed(
        //     //'/registerloading',
        //     //  '/paymentsdetails'
        //     //'/4digitpasscode'
        //     '/paymentoverview');

        // showAlertDialog(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: 
             Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width / 4.4
                : MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height * 0.07,
       decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
        child: Center(
          child: Text(
           "Next",
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
                ])));
  }

  Widget displayImage() {
    if (imggalleryFile == null) {
      return Responsive.isMobile(context)? Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 1,
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
          )): Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: Responsive.isDesktop(context)?MediaQuery.of(context).size.width / 4:
          MediaQuery.of(context).size.width / 2,
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
      return Responsive.isDesktop(context)?GestureDetector(
          onTap: () async {
            openGallery();
          },
          child: Container(
            height: 160,
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            width: MediaQuery.of(context).size.width / 1,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
                borderRadius: const BorderRadius.all(Radius.circular(3)),
                image: DecorationImage(
                    fit: BoxFit.fill, image: FileImage(imggalleryFile!))),
          )):
          GestureDetector(
          onTap: () async {
            openGallery();
          },
          child: Container(
            height: 160,
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            width: Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4:MediaQuery.of(context).size.width/2,
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
