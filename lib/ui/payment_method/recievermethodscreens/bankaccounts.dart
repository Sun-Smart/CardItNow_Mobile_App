// ignore_for_file: prefer_const_constructors
import 'package:cardit/const/responsive.dart';
import 'package:cardit/ui/payment_method/recievermethodscreens/addbankaccount.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../api/bank_api.dart';
import '../../../api/regster_api.dart';
import '../../../themes/styles.dart';

class Bankaccounts extends StatefulWidget {
  const Bankaccounts({Key? key}) : super(key: key);

  @override
  State<Bankaccounts> createState() => _BankaccountsState();
}

class _BankaccountsState extends State<Bankaccounts> {
  final BankAPI bank = Get.put(BankAPI());
  final RegisterAPI auth = Get.put(RegisterAPI());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth.banklistget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              leading: BackButton(
                onPressed: () {
                  Get.back();
                },
              ),
              foregroundColor: Colors.black,
              backgroundColor: Colors.transparent)
          : null,
      body: Responsive.isMobile(context)
          ? SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Business Details',
                        style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold,
                            color: HexColor('#004751'))),
                    SizedBox(height: 30),
                    MyCustomInputBox(
                      enabled: true,
                      label: "Business Name *",
                      controller: bank.businessNameCnl,
                      obsecureText: false,
                      textInputAction: TextInputAction.next,
                      inputHint: "Your Required Number",
                      validator: (value) {
                        // if (requiredNoController.text.isEmpty) {
                        //   return "";
                        // } else {
                        //   return null;
                        // }
                      },
                      inputDecoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Business Name',
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        margin: Responsive.isMobile(context)
                            ? EdgeInsets.fromLTRB(15, 0, 15, 0)
                            : EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 7.5,
                              ),
                        child: Text('Enter Your Business type *',
                            style: TextStyle(fontFamily: 'Sora', fontSize: 16,fontWeight: FontWeight.bold))),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: Responsive.isMobile(context)
                          ? EdgeInsets.fromLTRB(15, 0, 15, 0)
                          : EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 7.5,
                            ),
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
                          focusColor: Colors.transparent,
                          underline: const SizedBox(),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: bank.businessType,
                          hint: Text('Select Your Business type',
                              style: TextStyle(
                                  color: Styles.whitecustomlable,
                                  fontSize: 14)),
                          icon: GestureDetector(
                              child: Icon(
                            Icons.keyboard_arrow_down,
                          )),
                          items: bank.businessTypeList.map((String item) {
                            return DropdownMenuItem(
                                value: item,
                                child: Text(item,
                                    style: const TextStyle(
                                        color: Color(0Xff413D4B),
                                        fontSize: 14)));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              bank.businessType = newValue!;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyCustomInputBox(
                      enabled: true,
                      label: "Business Reg. Number *",
                      controller: bank.businessRegNoCnl,
                      obsecureText: false,
                      textInputAction: TextInputAction.next,
                      inputHint: "Enter Your Verification Number",
                      validator: (value) {
                        // if (requiredNoController.text.isEmpty) {
                        //   return "";
                        // } else {
                        //   return null;
                        // }
                      },
                      inputDecoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Business Reg No',
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
                    Container(
                        //alignment: Alignment.bottomLeft,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Color(0xff004751)),
                            child: Checkbox(
                              activeColor: Color(0xff004751),
                              value: bank.isVisibleToAll,
                              onChanged: (value) {
                                setState(() {
                                  bank.isVisibleToAll = value!;
                                });
                              },
                            ),
                          ),
                          Text(
                            ' Visible all',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ])),
                  ],
                ),
              ),
            )
          : Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 3,
                    //height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Image.asset("assets/applogo-02.png",
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 3))),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          BackButton(
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                      Text('Business Details',
                          style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,
                              color: HexColor('#004751'))),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          SizedBox(
                            width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4.8
                            : MediaQuery.of(context).size.width / 12,
                          ),
                          Text("Business Name"),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4
                            : MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          enabled: true,
                          //label: "Business Name *",
                          controller: bank.businessNameCnl,
                          obscureText: false,
                          textInputAction: TextInputAction.next,
                          //  inputHint: "Your Required Number",
                          validator: (value) {
                            // if (requiredNoController.text.isEmpty) {
                            //   return "";
                            // } else {
                            //   return null;
                            // }
                          },
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Business Name',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle: const TextStyle(
                                fontFamily: 'Sora', fontSize: 14),
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
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            errorStyle: const TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                           width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4.8
                            : MediaQuery.of(context).size.width / 12,
                          ),
                          Text('Enter Your Business type *',
                              style: TextStyle(fontFamily: 'Sora', fontSize: 16,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                       width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4
                            : MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 13,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0XffB7C5C7), width: 1.5),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButton(
                            focusColor: Colors.transparent,
                            underline: const SizedBox(),
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            value: bank.businessType,
                            hint: Text('Select Your Business type',
                                style: TextStyle(
                                    color: Styles.whitecustomlable,
                                    fontSize: 14)),
                            icon: GestureDetector(
                                child: Icon(
                              Icons.keyboard_arrow_down,
                              // color: themeChange.darkTheme
                              //     ? Colors.white
                              //     : Colors.black45
                            )),
                            items: bank.businessTypeList.map((String item) {
                              return DropdownMenuItem(
                                  value: item,
                                  child: Text(item,
                                      style: const TextStyle(
                                          color: Color(0Xff413D4B),
                                          fontSize: 14)));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                bank.businessType = newValue!;
                              });
                            },
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                           width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4.8
                            : MediaQuery.of(context).size.width / 12,
                          ),
                          Text("Business Reg. Number *")
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                         width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4
                            : MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          enabled: true,
                          //label: "Business Reg. Number *",
                          controller: bank.businessRegNoCnl,
                          obscureText: false,
                          textInputAction: TextInputAction.next,
                          //inputHint: "Enter Your Verification Number",
                          validator: (value) {
                            // if (requiredNoController.text.isEmpty) {
                            //   return "";
                            // } else {
                            //   return null;
                            // }
                          },
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Business Reg No',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle: const TextStyle(
                                fontFamily: 'Sora', fontSize: 14),
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
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            errorStyle: const TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                       width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4
                            : MediaQuery.of(context).size.width / 2, //alignment: Alignment.bottomLeft,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: Color(0xff004751)),
                                  child: Checkbox(
                                    activeColor: Color(0xff004751),
                                    value: bank.isVisibleToAll,
                                    onChanged: (value) {
                                      setState(() {
                                        bank.isVisibleToAll = value!;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  ' Visible all',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ])),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => Addbankaccount());
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                         width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4
                            : MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              color: HexColor('#CEE812'),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "Verify and Proceed",
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
                    ],
                  ),
                )
              ],
            ),
      bottomNavigationBar: Responsive.isMobile(context) ? bulildbutton() : null,
    );
  }

  Widget bulildbutton() {
    return AuthButton(
        decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        onTap: () {
          if (bank.businessNameCnl.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter your business Name");
          } else if (bank.businessType == null) {
            Fluttertoast.showToast(msg: "Enter your Business type");
          } else if (bank.businessRegNoCnl.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter your Business Reg No");
          } else {
            Get.off(() => Addbankaccount());
          }
        },
        text: "Verify and Proceed");
  }
}
