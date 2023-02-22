import 'package:cardit/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../themes/styles.dart';
import '../../themes/theme_notifier.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';
import 'onboard-seller-load_screen.dart';

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
      bottomNavigationBar: Responsive.isMobile(context)?bulildbutton():null,
      appBar: Responsive.isMobile(context)?PreferredSize(
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
      ):null,
      body:Responsive.isMobile(context)? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            child:  SingleChildScrollView(
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
              Text(
                'Payment',
                style: TextStyle(
                    color: themeChange.darkTheme
                        ? Colors.white
                        : Color(0Xff1B1B1B),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),SizedBox(height: 30,),
            _buildField(),
          ],
        ),
      )
            )
        ],
      ),
    ));
  }

  Widget _buildField() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Responsive.isMobile(context)? Container(
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
                ]))):
                
                Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(width:Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4.8:
                  MediaQuery.of(context).size.width/12 ,),
                      Text("Account Holder Name"),
                    ],
                  ),
                  SizedBox(height: 10,),
                 Container(
                  width: Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4:
                  MediaQuery.of(context).size.width/2,
                   child: TextFormField(
                      enabled: true,
                      //label: "Account Holder Name",
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
                        hoverColor: Colors.transparent,
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
                 ),
                 
                   SizedBox(height: 20,),
                 Row(
                    children: [
                      SizedBox(width:Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4.8:
                  MediaQuery.of(context).size.width/12 ,),
                      Text("Seller’s Email "),
                    ],
                  ),
                  SizedBox(height: 10,),
                 Container(
                     width: Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4:
                  MediaQuery.of(context).size.width/2,
                   child: TextFormField(
                      enabled: true,
                      //label: "Seller’s Email ",
                      controller: _emailController,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      //inputHint: 'Enter your email',
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
                      decoration: const InputDecoration(
                        hoverColor: Colors.transparent,
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
                 ),
                 SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width:Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4.8:
                  MediaQuery.of(context).size.width/12 ,),
                      Text("Business Reg Number "),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                      width: Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4:
                  MediaQuery.of(context).size.width/2,
                    child: TextFormField(
                      enabled: true,
                     // label: "Business Reg Number",
                      controller: _businessController,
                      obscureText: false,
                     keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                     // inputHint: 'Enter your account Number',
                      validator: (value) {
                        if (_businessController.text.isEmpty) {
                          return "Please Enter Number";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hoverColor: Colors.transparent,
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
                  ),
                  SizedBox(height: 20,),
                   Row(
                    children: [
                      SizedBox(width:Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4.8:
                  MediaQuery.of(context).size.width/12 ,),
                      Text("Phone Number "),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                      width: Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4:
                  MediaQuery.of(context).size.width/2,
                    child: TextFormField(
                      enabled: true,
                      //label: "Phone Number",
                      controller: _phonenumberController,
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                     // inputHint: 'Enter your Phone number',
                      validator: (value) {
                        if (_phonenumberController.text.isEmpty) {
                          return "Please Enter Phone number";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hoverColor: Colors.transparent,
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
                  ),
                 
                 SizedBox(height: 20,),
                   Row(
                    children: [
                      SizedBox(width:Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4.8:
                  MediaQuery.of(context).size.width/12,),
                      Text("Select Bank "),
                    ],
                  ),
                
                  const SizedBox(height: 10),
                  Container(
                  //  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                     width: Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4:
                  MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                      //  color:Color(0xFFE5E5E5) ,
                        border: Border.all(color: Color(0XffB7C5C7)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3))),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        hoverColor: Colors.transparent,
                        contentPadding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color:Color(0xFFE5E5E5) )),
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
                      icon: GestureDetector(
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
                      SizedBox(width:Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4.8:
                  MediaQuery.of(context).size.width/12 ,),
                      Text("Account Number "),
                    ],
                  ),SizedBox(height: 10,),
                
                 
                  Container(
                    width:Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4:
                  MediaQuery.of(context).size.width/2,
                    child: TextFormField(
                      enabled: true,
                     // label: "Account Number",
                      controller: _accountnumberController,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                     // inputHint: 'Enter your Account Number',
                      validator: (value) {
                        if (_accountnumberController.text.isEmpty) {
                          return "Please Enter Account Number";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hoverColor: Colors.transparent,
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
                  ),
                  SizedBox(height: 20,),
                   Row(
                    children: [
                      SizedBox(width:Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4.8:
                  MediaQuery.of(context).size.width/12,),
                      Text("Enter Swift Code "),
                    ],
                  ),SizedBox(height: 10,),
                  Container(
                    width:Responsive.isDesktop(context)?MediaQuery.of(context).size.width/4:
                  MediaQuery.of(context).size.width/2 ,
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
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
    onTap: () {
       Get.to(OnboardSellerLoad());
        if (formKey.currentState!.validate()) {}
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
          "Add and Proceed",
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

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        Get.to(OnboardSellerLoad());
        if (formKey.currentState!.validate()) {}
      },
      text: "Add and Proceed",
    );
  }
}
