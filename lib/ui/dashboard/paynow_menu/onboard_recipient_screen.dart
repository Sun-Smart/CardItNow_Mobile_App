import 'package:cardit/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../widgets/auth_button.dart';
import '../../../widgets/custom_input.dart';

import 'payment_loading.dart';

class onboardRecipient extends StatefulWidget {
  String documenttype;
  String uploadoc;
   onboardRecipient({Key? key,required this.documenttype,required this.uploadoc}) : super(key: key);

  @override
  State<onboardRecipient> createState() => _onboardRecipientState();
}

class _onboardRecipientState extends State<onboardRecipient> {
  final formKey = GlobalKey<FormState>();
  final _holdernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _businessController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _selectbankController = TextEditingController();
  final _accountnumberController = TextEditingController();
  final _swiftcodeController = TextEditingController();
     final 
     nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
     static final RegExp numberRegExp = RegExp(r'\d');
  // var item = ['Indin Bank', 'Axis Bank', 'ICIC Bank', 'IDBI Bank'];
  String? dropdownvalue;
  @override
  void initState() {
    super.initState();
  }

  final AuthCon con = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: bulildbutton(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: AppBar(
              leading: const BackButton(
                color: Colors.black,
              ),
              centerTitle: true,
              title: const Text(
                'Onboard Payee',
                style: TextStyle(
                    color: Color(0Xff413D4B),
                    fontSize: 14,
                    fontFamily: "Sora",
                    fontWeight: FontWeight.w600),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildField(),
          ],
        ),
      ),
    ));
  }

  Widget _buildField() {
    return Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: unnecessary_brace_in_string_interps
                  MyCustomInputBox(
                    label: "Payee’s Name",
                    controller: _holdernameController,
                    obsecureText: false,
                    inputHint: 'Enter Name',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
            
                    validator: (value) {
                      if (_holdernameController.text.isEmpty) {
                        return " Enter The Payee's Name";
                      } else {
                        return null;
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                     FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                   ],
                    inputDecoration: const InputDecoration(

                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        hintText: "Enter Payee's Name",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        // filled: true,
                        // fillColor: Colors.white,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        helperStyle:
                            TextStyle(fontFamily: 'Sora', fontSize: 14),
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(65, 61, 75, 0.6))),
                    enabled: true,
                  ),
                  MyCustomInputBox(
                      enabled: true,
                      label: "Payee’s Email ",
                      controller: _emailController,
                      obsecureText: false,
                      inputHint: 'Enter your account number',
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (_emailController.text.isEmpty) {
                          return " Enter The Email";
                        } else if (!_emailController.text.contains("@") ||
                            !_emailController.text.endsWith('.com')) {
                          return " Enter The valid Email";
                        } else {
                          return null;
                        }
                      },
                      inputDecoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFE5E5E5))),
                          hintText: " Enter The Email",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFE5E5E5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFE5E5E5))),
                          // filled: true,
                          // fillColor: Colors.white,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          helperStyle:
                              TextStyle(fontFamily: 'Sora', fontSize: 14),
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(65, 61, 75, 0.6)))),
                  MyCustomInputBox(
                   // keyboardType: TextInputType.number,
                    enabled: true,
                    label: "Business Reg Number",
                    controller: _businessController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    obsecureText: false,
                    inputHint: 'Enter your Business Reg Number',
                   validator: (value) {
                      if (_businessController.text.isEmpty) {
                        return " Enter The Reg Number";
                      } else {
                        return null;
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                     FilteringTextInputFormatter.digitsOnly
                   ],
                    inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        hintText: "Enter your Business Reg Number",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        // filled: true,
                        // fillColor: Colors.white,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        helperStyle:
                            TextStyle(fontFamily: 'Sora', fontSize: 14),
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(65, 61, 75, 0.6))),
                  ),
                  //command
                  MyCustomInputBox(
                    label: "Phone Number",
                    enabled: true,
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    controller: _phonenumberController,
                    obsecureText: false,
                    inputHint: 'Enter your Phone number',
                   validator: (value) {
                      if (_phonenumberController.text.isEmpty) {
                        return " Enter The Phone number";
                      } else {
                        return null;
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                     FilteringTextInputFormatter.digitsOnly
                   ],
                    inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        hintText: "Enter your Phone number",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        // filled: true,
                        // fillColor: Colors.white,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        helperStyle:
                            TextStyle(fontFamily: 'Sora', fontSize: 14),
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(65, 61, 75, 0.6))),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Select Bank',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: HexColor('#505050')))),
                  const SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: MediaQuery.of(context).size.width / 1.1,

                    /*  decoration: BoxDecoration(
                        border: Border.all(color: Color(0XffB7C5C7), width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3))),*/
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5)),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFE5E5E5))),
                        ),
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        value: dropdownvalue,
                        hint: const Text('Select User Id',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(65, 61, 75, 0.6))),
                        icon: const InkWell(
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black45,
                          ),
                        ),
                         validator: (value) {
                      if (dropdownvalue==null) {
                        return " Enter your Bank name";
                      } else {
                        return null;
                      }
                    },
                        items: con.banklist.map((item) {
                          return DropdownMenuItem(
                            value: item["bankname"].toString(),
                            child: Text(item["bankname"].toString(),
                                style: const TextStyle(
                                    color: Color(0Xff413D4B), fontSize: 14)),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            print("----dropdown------$dropdownvalue");
                          });
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyCustomInputBox(
                    enabled: true,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    label: "Account Number",
                    controller: _accountnumberController,
                    obsecureText: false,
                    inputHint: 'Enter your Account Number',
                 
                     validator: (value) {
                      if (_accountnumberController.text.isEmpty) {
                        return " Enter your account number";
                      } else {
                        return null;
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                     FilteringTextInputFormatter.digitsOnly
                   ],
                    inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        hintText: "Enter your  Account  number",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        // filled: true,
                        // fillColor: Colors.white,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        helperStyle:
                            TextStyle(fontFamily: 'Sora', fontSize: 14),
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(65, 61, 75, 0.6))),
                  ),
                  MyCustomInputBox(
                    enabled: true,
                    label: "Enter Swift Code",
                    controller: _swiftcodeController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obsecureText: false,
                    inputHint: 'Enter swift code of your Bank',
                    validator: (value) {
                      if (_swiftcodeController.text.isEmpty) {
                        return " Enter swift code of your bank";
                      } else {
                        return null;
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                     FilteringTextInputFormatter.digitsOnly
                   ],
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
                            fontSize: 14,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(65, 61, 75, 0.6))),
                  ),
                ])));
  }

  Widget bulildbutton() {
    return AuthButton(
      onTap: () {
        if (formKey.currentState!.validate()) {
          if (_holdernameController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter the  Payee's Name");
          } else if (_emailController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter the  Email");
          } else if (_phonenumberController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter the  Phone Number");
          } else if (dropdownvalue!.isEmpty) {
            Fluttertoast.showToast(msg: "Select the bank");
          } else if (_accountnumberController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter the  account number");
          } else if (_swiftcodeController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter the  Swift code");
          } else {
            con.onboardPayee(
              // "4",
              _holdernameController.text.trim(),
              _emailController.text.trim(),
              _businessController.text.trim(),
              _phonenumberController.text.trim(),
              dropdownvalue,
              _accountnumberController.text.trim(),
              _swiftcodeController.text.trim(),
              widget.documenttype,
              widget.uploadoc

            );
            // Get.to(() => isChecked1 == true ? Twofactor() : AvatarPageView());
          }
        }
      //   Get.to(PaymentLoading());
        // // Navigator.of(context).pushNamed('/chooseLPG');
        // if (formKey.currentState!.validate()) {}
      },
      text: "Add and Proceed",
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
