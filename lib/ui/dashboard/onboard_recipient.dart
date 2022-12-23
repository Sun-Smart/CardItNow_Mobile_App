import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';

class onboardRecipient extends StatefulWidget {
  const onboardRecipient({Key? key}) : super(key: key);

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
  var item = ['Indin Bank', 'Axis Bank', 'ICIC Bank', 'IDBI Bank'];
  String? dropdownvalue;
  @override
  void initState() {
    super.initState();
  }

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
                'Payment',
                style: TextStyle(
                    color: Color(0Xff1B1B1B),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
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
                  MyCustomInputBox(
                    label: "Recipient’s Name",
                    controller: _holdernameController,
                    //label: 'Email address',
                    obsecureText: false,
                    inputHint: 'Enter Name',
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
                    enabled: false,
                  ),
                  MyCustomInputBox(
                    enabled: false,
                    label: "Recipient’s Email ",
                    controller: _emailController,
                    //label: 'Email address',
                    obsecureText: false,
                    inputHint: 'Enter your account number',
                    /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                    //   validator: (value) {
                    //     if (_emailController.text.isEmpty) {
                    //       return "Please Enter The Email";
                    //     } else if (!_emailController.text.contains("@") ||
                    //         !_emailController.text.endsWith('.com')) {
                    //       return "Please Enter The valid Email";
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                  ),
                  MyCustomInputBox(
                    enabled: false,
                    label: "Business Reg Number",
                    controller: _businessController,
                    //label: 'Email address',
                    obsecureText: false,
                    inputHint: 'Enter your account Number',
                    /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                    validator: (value) {
                      if (_businessController.text.isEmpty) {
                        return "Please Enter Number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  MyCustomInputBox(
                    label: "Phone Number",
                    enabled: false,
                    controller: _phonenumberController,
                    //label: 'Email address',
                    obsecureText: false,
                    inputHint: 'Enter your Phone number',
                    /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                    validator: (value) {
                      if (_phonenumberController.text.isEmpty) {
                        return "Please Enter Phone number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Select Bank',
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

                        // underline:Container(),
                        //  validator: (value)=>value==null?'field required':null,
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        value: dropdownvalue,
                        hint: const Text(
                          'Select user id',
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
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyCustomInputBox(
                    enabled: false,

                    label: "Account Number",
                    controller: _accountnumberController,
                    //label: 'Email address',
                    obsecureText: false,
                    inputHint: 'Enter your Account Number',
                    /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                    validator: (value) {
                      if (_accountnumberController.text.isEmpty) {
                        return "Please Enter Account Number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  MyCustomInputBox(
                    enabled: false,
                    label: "Enter Swift Code",
                    controller: _swiftcodeController,
                    //label: 'Email address',
                    obsecureText: false,
                    inputHint: 'Enter swift code of your Bank',
                    /*prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.grey[400],
                    ),*/
                    validator: (value) {
                      if (_swiftcodeController.text.isEmpty) {
                        return "Please Enter Account Number";
                      } else {
                        return null;
                      }
                    },
                  ),
                ])));
  }

  Widget bulildbutton() {
    return AuthButton(
      onTap: () {
        Navigator.of(context).pushNamed('/chooseLPG');
        if (formKey.currentState!.validate()) {}
      },
      text: "Add and Proceed",
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
