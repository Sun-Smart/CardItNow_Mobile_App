import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../themes/styles.dart';
import '../../themes/theme_notifier.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';

class OnboardSeller extends StatefulWidget {
  const OnboardSeller({Key? key}) : super(key: key);

  @override
  State<OnboardSeller> createState() => _OnboardSellerState();
}

class _OnboardSellerState extends State<OnboardSeller> {
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: bulildbutton(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: AppBar(
              leading: BackButton(
                color: themeChange.darkTheme ? Colors.white : Colors.black,
              ),
              centerTitle: true,
              title: Text(
                'Payment',
                style: TextStyle(
                    color: themeChange.darkTheme
                        ? Colors.white
                        : Color(0Xff1B1B1B),
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
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCustomInputBox(
                    enabled: true,
                    label: "Account Holder Name",
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
                    enabled: true,
                    label: "Seller’s Email ",
                    controller: _emailController,
                    obsecureText: false,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    inputHint: 'Enter your email',
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
                      hintText: "Enter your email",
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
                    enabled: true,
                    label: "Business Reg Number",
                    controller: _businessController,
                    obsecureText: false,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
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
                      hintText: "Enter your account Number",
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
                    enabled: true,
                    label: "Phone Number",
                    controller: _phonenumberController,
                    obsecureText: false,
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
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
                              color: Styles.whitecustomlable))),
                  const SizedBox(height: 15),
                  Container(
                  //  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0XffB7C5C7), width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3))),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Colors.black)),
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
                    controller: _accountnumberController,
                    obsecureText: false,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
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
                      hintText: "Enter your Account Number",
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
                                borderSide: BorderSide(width: 2,   color:Color(0xFFE5E5E5) )),
                      hintText: "Enter swift code of your Bank",
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
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/onboardsellerlode',
        );
        if (formKey.currentState!.validate()) {}
      },
      text: "Add and Proceed",
    );
  }
}
