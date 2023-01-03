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
                    obsecureText: false,
                    inputHint: 'Enter Name',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (_holdernameController.text.isEmpty) {
                        return "Please Enter The Holder Name";
                      } else {
                        return null;
                      }
                    },
                    inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2,   color:Color(0xFFE5E5E5) )),
                      hintText: "Enter The Holder Name",
                       focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(width: 2,   color:Color(0xFFE5E5E5) )),
                          enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color:Color(0xFFE5E5E5)   )),
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
                    enabled: false,
                  ),
                  MyCustomInputBox(
                    enabled: false,
                    label: "Recipient’s Email ",
                    controller: _emailController,
                    obsecureText: false,
                    inputHint: 'Enter your account number',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
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
                    inputDecoration: const InputDecoration(
                       border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2,   color:Color(0xFFE5E5E5) )),
                      hintText: " Enter The Email",
                       focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(width: 2,   color:Color(0xFFE5E5E5) )),
                          enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color:Color(0xFFE5E5E5)   )),
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
                    enabled: false,
                    label: "Business Reg Number",
                    controller: _businessController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    obsecureText: false,
                    inputHint: 'Enter your account Number',
                    validator: (value) {
                      if (_businessController.text.isEmpty) {
                        return "Please Enter Number";
                      } else {
                        return null;
                      }
                    },
                    inputDecoration: const InputDecoration(
                       border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2,   color:Color(0xFFE5E5E5) )),
                      hintText: "Enter your account number",
                       focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(width: 2,   color:Color(0xFFE5E5E5) )),
                          enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color:Color(0xFFE5E5E5)   )),
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
                    label: "Phone Number",
                    enabled: false,
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    controller: _phonenumberController,
                    obsecureText: false,
                    inputHint: 'Enter your Phone number',
                    validator: (value) {
                      if (_phonenumberController.text.isEmpty) {
                        return "Please Enter Phone number";
                      } else {
                        return null;
                      }
                    },
                    inputDecoration: const InputDecoration(
                       border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2,   color:Color(0xFFE5E5E5) )),
                      hintText: "Enter your Phone number",
                       focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(width: 2,   color:Color(0xFFE5E5E5) )),
                          enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color:Color(0xFFE5E5E5)   )),
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
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Select Bank',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: HexColor('#505050')))),
                  const SizedBox(height: 15),
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
                  const SizedBox(height: 15),
                  MyCustomInputBox(
                    enabled: false,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    label: "Account Number",
                    controller: _accountnumberController,
                    obsecureText: false,
                    inputHint: 'Enter your Account Number',
                    validator: (value) {
                      if (_accountnumberController.text.isEmpty) {
                        return "Please Enter Account Number";
                      } else {
                        return null;
                      }
                    },
                    inputDecoration: const InputDecoration(
                       border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2,   color:Color(0xFFE5E5E5) )),
                      hintText: "Enter your  Account  number",
                       focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(width: 2,   color:Color(0xFFE5E5E5) )),
                          enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color:Color(0xFFE5E5E5)   )),
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
                    enabled: false,
                    label: "Enter Swift Code",
                    controller: _swiftcodeController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obsecureText: false,
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
                                borderSide: BorderSide(width: 2,   color:Color(0xFFE5E5E5) )),
                      hintText: "Enter your  Account  number",
                       focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(width: 2,   color:Color(0xFFE5E5E5) )),
                          enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color:Color(0xFFE5E5E5)   )),
                        
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
