// ignore_for_file: prefer_const_constructors

import 'package:cardit/api/bank_api.dart';
import 'package:cardit/api/regster_api.dart';
import 'package:cardit/const/responsive.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';


import '../../../main.dart';
import '../../../themes/styles.dart';

class PayeeDetails extends StatefulWidget {
  const PayeeDetails({Key? key}) : super(key: key);

  @override
  State<PayeeDetails> createState() => _PayeeDetailsState();
}

class _PayeeDetailsState extends State<PayeeDetails> {
  final BankAPI bank = Get.put(BankAPI());
  final RegisterAPI auth = Get.put(RegisterAPI());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth.banklistget();
    // assignFunction();
  }

  assignFunction(){
    bank.firstNameCnl.text = MyApp.logindetails["firstname"] ?? "";
    bank.lastNameCnl.text = MyApp.logindetails["lastname"] ?? "";
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
                    Text('Payee Details',
                        style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold,
                            color: HexColor('#004751'))),
                    SizedBox(height: 30),
                    Container(
                        margin: Responsive.isMobile(context)
                            ? EdgeInsets.fromLTRB(15, 0, 15, 0)
                            : EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 7.5,
                        ),
                        child: Text('Payee Type *',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
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
                          value: bank.payeeType,
                          hint: Text('Select payee type',
                              style: TextStyle(
                                  color: Styles.whitecustomlable,
                                  fontSize: 14)),
                          icon: GestureDetector(
                              child: Icon(
                                Icons.keyboard_arrow_down,
                              )),
                          items: bank.payeeTypeList.map((String item) {
                            return DropdownMenuItem(
                                value: item,
                                child: Text(item,
                                    style: const TextStyle(
                                        color: Color(0Xff413D4B),
                                        fontSize: 14)));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              bank.payeeType = newValue!;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    bank.payeeType == "Individual"
                   ? Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        MyCustomInputBox(
                          enabled: true,
                          label: "First Name *",
                          controller: bank.firstNameCnl,
                          obsecureText: false,
                          textInputAction: TextInputAction.next,
                          inputDecoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'First Name',
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
                        MyCustomInputBox(
                          enabled: true,
                          label: "Middle Name",
                          controller: bank.middleNameCnl,
                          obsecureText: false,
                          textInputAction: TextInputAction.next,
                          inputDecoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Middle Name',
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
                        MyCustomInputBox(
                          enabled: true,
                          label: "Last Name *",
                          controller: bank.lastNameCnl,
                          obsecureText: false,
                          textInputAction: TextInputAction.next,
                          inputDecoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Last Name',
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
                      ],
                    ) : Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        MyCustomInputBox(
                          enabled: true,
                          label: "Company Name *",
                          controller: bank.payeeCompanyNameCnl,
                          obsecureText: false,
                          textInputAction: TextInputAction.next,
                          inputDecoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Company Name',
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
                        MyCustomInputBox(
                          enabled: true,
                          label: "Company Registration Number *",
                          controller: bank.businessRegNoCnl,
                          obsecureText: false,
                          textInputAction: TextInputAction.next,
                          inputDecoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Company Registration Number',
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
                      ],
                    ),
                    SizedBox(
                      height: 20,
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
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        margin: Responsive.isMobile(context)
                            ? EdgeInsets.fromLTRB(15, 0, 15, 0)
                            : EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 7.5,
                        ),
                        child: Text('Select Bank *',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
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
                          value: bank.selectedBank,
                          hint: Text('Select Your Bank',
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
                          items: auth.banklist.map((var item) {
                            return DropdownMenuItem(
                                value: item,
                                child: Text(item["bankname"],
                                    style: const TextStyle(
                                        color: Color(0Xff413D4B),
                                        fontSize: 14)));
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              bank.selectedBank = newValue!;
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
                      label: "Account Number *",
                      controller: bank.accountNumberCnl,
                      obsecureText: false,
                      textInputAction: TextInputAction.next,
                      inputDecoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Account No',
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
                      height: 30,
                    ),
                    Container(
                        margin: Responsive.isMobile(context)
                            ? EdgeInsets.fromLTRB(15, 0, 15, 0)
                            : EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 7.5,
                        ),
                        child: Text('Account Type *',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
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
                          value: bank.accountType,
                          hint: Text('Select account type',
                              style: TextStyle(
                                  color: Styles.whitecustomlable,
                                  fontSize: 14)),
                          icon: GestureDetector(
                              child: Icon(
                                Icons.keyboard_arrow_down,
                              )),
                          items: bank.accountTypeList.map((String item) {
                            return DropdownMenuItem(
                                value: item,
                                child: Text(item,
                                    style: const TextStyle(
                                        color: Color(0Xff413D4B),
                                        fontSize: 14)));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              bank.accountType = newValue!;
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
                      label: "Enter Branch Address *",
                      controller: bank.branchAddressCnl,
                      obsecureText: false,
                      textInputAction: TextInputAction.next,
                      inputHint: "Enter Your Bank Branch Address",
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
                        hintText: 'Enter Branch Address',
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
                  ],
                ),
              ),
            )
          : Row(
              children: [
                 Container(
                    width: MediaQuery.of(context).size.width / 3,
                 //   height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/logoweb.png",
                                width: 140, height: 75),
                                SizedBox(height: 15),
                                  Text('"Make your life simple"',
                  style: TextStyle(
                    letterSpacing: 1,
                  fontSize: 16, color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'sora'
                  ),
                ),
                          ],
                        )),
                  ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: SingleChildScrollView(
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
                        Text('Payee Details',
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
                            Text('Payee Type *',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
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
                              value: bank.payeeType,
                              hint: Text('Select Payee Type',
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
                              items: bank.payeeTypeList.map((String item) {
                                return DropdownMenuItem(
                                    value: item,
                                    child: Text(item,
                                        style: const TextStyle(
                                            color: Color(0Xff413D4B),
                                            fontSize: 14)));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  bank.payeeType = newValue!;
                                });
                              },
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        bank.payeeType == "Individual"
                       ?  Column(
                          children: [
                  
                            Row(
                              children: [
                                SizedBox(
                                  width: Responsive.isDesktop(context)
                                      ? MediaQuery.of(context).size.width / 4.8
                                      : MediaQuery.of(context).size.width / 12,
                                ),
                                Text("First Name *",
                                    style: TextStyle(
                                        fontFamily: 'Sora',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: Responsive.isDesktop(context)
                                  ? MediaQuery.of(context).size.width / 4
                                  : MediaQuery.of(context).size.width / 2,
                              child: TextFormField(
                                enabled: true,
                                controller: bank.firstNameCnl,
                                obscureText: false,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hoverColor: Colors.transparent,
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'First Name',
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
                                Text("Middle Name *",
                                    style: TextStyle(
                                        fontFamily: 'Sora',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: Responsive.isDesktop(context)
                                  ? MediaQuery.of(context).size.width / 4
                                  : MediaQuery.of(context).size.width / 2,
                              child: TextFormField(
                                enabled: true,
                                controller: bank.middleNameCnl,
                                obscureText: false,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hoverColor: Colors.transparent,
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Middle Name',
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
                                Text("Last Name *",
                                    style: TextStyle(
                                        fontFamily: 'Sora',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: Responsive.isDesktop(context)
                                  ? MediaQuery.of(context).size.width / 4
                                  : MediaQuery.of(context).size.width / 2,
                              child: TextFormField(
                                enabled: true,
                                controller: bank.lastNameCnl,
                                obscureText: false,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hoverColor: Colors.transparent,
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Last Name',
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
                          ],
                        )
                        : Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: Responsive.isDesktop(context)
                                      ? MediaQuery.of(context).size.width / 4.8
                                      : MediaQuery.of(context).size.width / 12,
                                ),
                                Text("Company Name *",
                                    style: TextStyle(
                                        fontFamily: 'Sora',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: Responsive.isDesktop(context)
                                  ? MediaQuery.of(context).size.width / 4
                                  : MediaQuery.of(context).size.width / 2,
                              child: TextFormField(
                                enabled: true,
                                controller: bank.payeeCompanyNameCnl,
                                obscureText: false,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hoverColor: Colors.transparent,
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Company Name',
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
                                Text("Company Registration Number *",
                                    style: TextStyle(
                                        fontFamily: 'Sora',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: Responsive.isDesktop(context)
                                  ? MediaQuery.of(context).size.width / 4
                                  : MediaQuery.of(context).size.width / 2,
                              child: TextFormField(
                                enabled: true,
                                controller: bank.businessRegNoCnl,
                                obscureText: false,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hoverColor: Colors.transparent,
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Company Registration Number',
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
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4
                                : MediaQuery.of(context).size.width /
                                    2, //alignment: Alignment.bottomLeft,
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
                        Row(
                          children: [
                            SizedBox(
                              width: Responsive.isDesktop(context)
                                  ? MediaQuery.of(context).size.width / 4.8
                                  : MediaQuery.of(context).size.width / 12,
                            ),
                            Text('Select Bank *',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
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
                              value: bank.selectedBank,
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
                              items: auth.banklist.map((var item) {
                                return DropdownMenuItem(
                                    value: item,
                                    child: Text(item["bankname"],
                                        style: const TextStyle(
                                            color: Color(0Xff413D4B),
                                            fontSize: 14)));
                              }).toList(),
                              onChanged: (var newValue) {
                                setState(() {
                                  bank.selectedBank = newValue!;
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
                            Text('Account Number *',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: Responsive.isDesktop(context)
                              ? MediaQuery.of(context).size.width / 4
                              : MediaQuery.of(context).size.width / 2,
                          child: TextFormField(
                            enabled: true,
                            //label: "Account Number *",
                            controller: bank.accountNumberCnl,
                            obscureText: false,
                            textInputAction: TextInputAction.next,
                            // inputHint: "Enter Your Account Number",
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
                              hintText: 'Enter Account No',
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
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: Responsive.isDesktop(context)
                                  ? MediaQuery.of(context).size.width / 4.8
                                  : MediaQuery.of(context).size.width / 12,
                            ),
                            Text('Account Type *',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
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
                              value: bank.accountType,
                              hint: Text('Select account type',
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
                              items: bank.accountTypeList.map((String item) {
                                return DropdownMenuItem(
                                    value: item,
                                    child: Text(item,
                                        style: const TextStyle(
                                            color: Color(0Xff413D4B),
                                            fontSize: 14)));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  bank.accountType = newValue!;
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
                            Text('Enter Branch Address *',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: Responsive.isDesktop(context)
                              ? MediaQuery.of(context).size.width / 4
                              : MediaQuery.of(context).size.width / 2,
                          child: TextFormField(
                            enabled: true,
                            //label: "Enter Branch Address *",
                            controller: bank.branchAddressCnl,
                            obscureText: false,
                            textInputAction: TextInputAction.next,
                            //inputHint: "Enter Your Bank Branch Address",
                            validator: (value) {
                              // if (requiredNoController.text.isEmpty) {
                              //   return "";
                              // } else {
                              //   return null;
                              // }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter Branch Address',
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
                        GestureDetector(
                          onTap: () {
                            validationFunction();
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
                                "Confirm",
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
          validationFunction();
        },
        text: "Confirm");
  }


  validationFunction(){
    if (bank.payeeType == null) {
      Fluttertoast.showToast(msg: "Enter your Payee type");
    }
    else if (bank.payeeType == "Individual" && bank.firstNameCnl.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter your First Name");
    }
    else if(bank.payeeType == "Individual" && bank.lastNameCnl.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter your Last Name");
    } else if (bank.payeeType == "Company" && bank.payeeCompanyNameCnl.text.isEmpty) {
        Fluttertoast.showToast(msg: "Enter your Company Name");
    }  else if(bank.payeeType == "Company" && bank.businessRegNoCnl.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter your Register No");
    }
    else if (bank.selectedBank == null) {
      Fluttertoast.showToast(msg: "Enter your Bank");
    } else if (bank.accountNumberCnl.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter your Account No");
    } else if (bank.accountType == null) {
      Fluttertoast.showToast(msg: "Select your Account Type");
    } else if (bank.branchAddressCnl.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter your Branch Address");
    } else {
      bank.addBankAPI();
    }
  }
}
