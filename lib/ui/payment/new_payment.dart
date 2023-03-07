import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cardit/ui/payment/purpose_details.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../../api/payment_api.dart';
import '../../const/common/pin_formate.dart';
import '../../const/responsive.dart';
import '../../themes/styles.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';
import '../payment_method/card_input_formatter_class.dart';
import 'purpose_details.dart';

// ignore: must_be_immutable
class NewPayment extends StatefulWidget {
  var paymentType;
  var payee;
  NewPayment({Key? key, this.paymentType, this.payee}) : super(key: key);

  @override
  State<NewPayment> createState() => _NewPaymentState();
}

class _NewPaymentState extends State<NewPayment> {
  final PaymentAPI pay = Get.put(PaymentAPI());
  bool isVerify = false;
  bool houseTypePurpose = false;
  File? imagedoc2;

  titleText() {
    return Text(
      widget.payee != null
          ? '${widget.payee["name"]}'
          : widget.paymentType == "LGU"
              ? "LGU"
              : widget.paymentType == "House"
                  ? "Payee Details"
                  : 'New Payee',
      style: const TextStyle(
          color: Color(0Xff413D4B),
          fontSize: 14,
          fontFamily: "Sora",
          fontWeight: FontWeight.w600),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          Responsive.isMobile(context) ? firstButtonNext() : null,
      appBar: Responsive.isMobile(context)
          ? PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: AppBar(
                    leading: const BackButton(
                      color: Colors.black,
                    ),
                    centerTitle: true,
                    title: titleText(),
                  )),
            )
          : null,
      body: Responsive.isMobile(context)
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  firstFormWidget(),
                ],
              ),
            )
          : Responsive.isDesktop(context)
              ? Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/logoweb.png",
                            width: 150, height: 90),
                        SizedBox(height: 15),
                        Text(
                          '"Make your life Easy"',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'sora'),
                        ),
                      ],
                    )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 1,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              BackButton(
                                color: Colors.black,
                              ),
                            ],
                          ),
                          titleText(),
                          SizedBox(
                            height: 20,
                          ),
                          firstFormWidget(),
                        ],
                      ),
                    ),
                  )
                ])
              : Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      // height: MediaQuery.of(context).size.width / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/logoweb.png",
                              width: 150, height: 90),
                          SizedBox(height: 15),
                          Text(
                            '"Make your life Easy"',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'sora'),
                          ),
                        ],
                      )),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.7,
                      //height: MediaQuery.of(context).size.height / 1,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: const [
                                BackButton(
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            titleText(),
                            SizedBox(
                              height: 20,
                            ),
                            firstFormWidget(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
    ));
  }

  Widget firstFormWidget() {
    return Responsive.isMobile(context)
        ? widget.paymentType == "LGU"
            ? payeeLGUWidget()
            : widget.paymentType == "House"
                ? payeeHouseWidget()
                : filedWidget()
        : Responsive.isDesktop(context)
            ? widget.paymentType == "LGU"
                ? payeeLGUWidget()
                : widget.paymentType == "House"
                    ? payeeHouseWidget()
                    : filedWidget()
            : widget.paymentType == "LGU"
                ? payeeLGUWidget()
                : widget.paymentType == "House"
                    ? payeeHouseWidget()
                    : filedWidget();
  }

  filedWidget() {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: const Text(
                          'Select Purpose *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: Styles.dropdownDecoration(),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.paymentPurpose,
                          hint: const Text('Select Purpose',
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
                          items: pay.paymentPurposeList.map((item) {
                            return DropdownMenuItem(
                              value: item["name"].toString(),
                              child: Text(item["name"].toString(),
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.paymentPurpose = newValue;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: const Text(
                          'Select Sub Purpose *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: Styles.dropdownDecoration(),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.paymentSubPurpose,
                          hint: const Text('Select Sub Purpose',
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
                          items: pay.paymentSubPurposeList.map((item) {
                            return DropdownMenuItem(
                              value: item["name"].toString(),
                              child: Text(item["name"].toString(),
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.paymentSubPurpose = newValue;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "Property Owner Name *",
                  controller: pay.propertyOwnerNameCnl,
                  obsecureText: false,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  inputDecoration:
                      Styles.textFiledDecoration(hint: "Property Owner Name"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "House/Apt/Office No *",
                  controller: pay.addressNoCnl,
                  obsecureText: false,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  inputDecoration:
                      Styles.textFiledDecoration(hint: "House/Apt/Office No"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "Street Name *",
                  controller: pay.streetNameCnl,
                  obsecureText: false,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  inputDecoration:
                      Styles.textFiledDecoration(hint: "Street Name"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: const Text(
                          'Select Province *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: Styles.dropdownDecoration(),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.province,
                          hint: const Text('Select Province',
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
                          items: pay.provinceList.map((item) {
                            return DropdownMenuItem(
                              value: item["name"].toString(),
                              child: Text(item["name"].toString(),
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.province = newValue;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: const Text(
                          'Select City *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: Styles.dropdownDecoration(),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.city,
                          hint: const Text('Select City',
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
                          items: pay.cityList.map((item) {
                            return DropdownMenuItem(
                              value: item["name"].toString(),
                              child: Text(item["name"].toString(),
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.city = newValue;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "Postal Code *",
                  controller: pay.postalCode,
                  obsecureText: false,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  inputDecoration:
                      Styles.textFiledDecoration(hint: "Postal Code"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "Start Date *",
                  controller: pay.startDate,
                  obsecureText: false,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    CardMonthFormatter()
                  ],
                  inputDecoration: Styles.textFiledDecoration(hint: "MM/YY"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "End Date *",
                  controller: pay.endDate,
                  obsecureText: false,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    CardMonthFormatter()
                  ],
                  inputDecoration: Styles.textFiledDecoration(hint: "MM/YY"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                filePickWidget(),
                const SizedBox(height: 10),
                if (!Responsive.isMobile(context)) firstButtonNext()
              ])
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4.8
                                : MediaQuery.of(context).size.width / 10),
                        const Text(
                          'Select Purpose *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2.5,
                      // margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      // width: MediaQuery.of(context).size.width / 1.1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: Styles.dropdownDecoration(),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.paymentPurpose,
                          hint: const Text('Select Purpose',
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
                          items: pay.paymentPurposeList.map((item) {
                            return DropdownMenuItem(
                              value: item["name"].toString(),
                              child: Text(item["name"].toString(),
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.paymentPurpose = newValue;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4.8
                                : MediaQuery.of(context).size.width / 10),
                        const Text(
                          'Select Sub Purpose *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2.5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: Styles.dropdownDecoration(),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.paymentSubPurpose,
                          hint: const Text('Select Sub Purpose',
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
                          items: pay.paymentSubPurposeList.map((item) {
                            return DropdownMenuItem(
                              value: item["name"].toString(),
                              child: Text(item["name"].toString(),
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.paymentSubPurpose = newValue;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "Property Owner Name *",
                  controller: pay.propertyOwnerNameCnl,
                  obsecureText: false,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  inputDecoration:
                      Styles.textFiledDecoration(hint: "Property Owner Name"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "House/Apt/Office No *",
                  controller: pay.addressNoCnl,
                  obsecureText: false,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  inputDecoration:
                      Styles.textFiledDecoration(hint: "House/Apt/Office No"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "Street Name *",
                  controller: pay.streetNameCnl,
                  obsecureText: false,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  inputDecoration:
                      Styles.textFiledDecoration(hint: "Street Name"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4.8
                                : MediaQuery.of(context).size.width / 10),
                        const Text(
                          'Select Province *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2.5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: Styles.dropdownDecoration(),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.province,
                          hint: const Text('Select Province',
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
                          items: pay.provinceList.map((item) {
                            return DropdownMenuItem(
                              value: item["name"].toString(),
                              child: Text(item["name"].toString(),
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.province = newValue;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4.8
                                : MediaQuery.of(context).size.width / 10),
                        const Text(
                          'Select City *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2.5,
                      // margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      // width: MediaQuery.of(context).size.width / 1.1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: Styles.dropdownDecoration(),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.city,
                          hint: const Text('Select City',
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
                          items: pay.cityList.map((item) {
                            return DropdownMenuItem(
                              value: item["name"].toString(),
                              child: Text(item["name"].toString(),
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.city = newValue;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "Postal Code *",
                  controller: pay.postalCode,
                  obsecureText: false,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  inputDecoration:
                      Styles.textFiledDecoration(hint: "Postal Code"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "Start Date *",
                  controller: pay.startDate,
                  obsecureText: false,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    CardMonthFormatter()
                  ],
                  inputDecoration: Styles.textFiledDecoration(hint: "MM/YY"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "End Date *",
                  controller: pay.endDate,
                  obsecureText: false,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    CardMonthFormatter()
                  ],
                  inputDecoration: Styles.textFiledDecoration(hint: "MM/YY"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                filePickWidget(),
                const SizedBox(height: 10),
                if (!Responsive.isMobile(context)) firstButtonNext()
              ]);
  }

  payeeLGUWidget() {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Obx(() => Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: const Text(
                              'Select Purpose *',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(height: 5),
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: DropdownButtonFormField(
                              decoration: Styles.dropdownDecoration(),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                              value: pay.lguPurpose,
                              hint: const Text('Select Purpose',
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
                              items: pay.lguPurposeList.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                      "${item["masterdatadescription"]}",
                                      style: const TextStyle(
                                          color: Color(0Xff413D4B),
                                          fontSize: 14)),
                                );
                              }).toList(),
                              onChanged: (var newValue) {
                                setState(() {
                                  pay.lguPurpose = newValue;
                                });
                              },
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: const Text(
                          'Select Province *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: Styles.dropdownDecoration(),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.lguProvince,
                          hint: const Text('Select Province',
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
                          items: pay.lguProvinceList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(
                                  "${item["firstname"]} ${item["lastname"] ?? ""}",
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.lguProvince = newValue;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "Property Identification Number *",
                  controller: pay.PINCnl,
                  obsecureText: false,
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(12),
                    PINInputFormatter()
                  ],
                  textInputAction: TextInputAction.next,
                  inputDecoration: Styles.textFiledDecoration(hint: "PIN"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "Start Date *",
                  controller: pay.startDate,
                  obsecureText: false,
                  read: true,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputDecoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            datePickerForDate("Start");
                          },
                          icon: Icon(Icons.date_range)),
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      hintText: "dd-MM-YYY",
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      helperStyle:
                          const TextStyle(fontFamily: 'Sora', fontSize: 14),
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(65, 61, 75, 0.6))),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "End Date *",
                  controller: pay.endDate,
                  obsecureText: false,
                  read: true,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputDecoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            datePickerForDate("End");
                          },
                          icon: Icon(Icons.date_range)),
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      hintText: "dd-MM-YYY",
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      helperStyle:
                          const TextStyle(fontFamily: 'Sora', fontSize: 14),
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(65, 61, 75, 0.6))),
                  enabled: true,
                ),
                MyCustomInputBox(
                  label: "Bill Amount *",
                  controller: pay.billAmountCnl,
                  obsecureText: false,
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textInputAction: TextInputAction.next,
                  inputDecoration:
                      Styles.textFiledDecoration(hint: "Bill Amount"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                filePickWidget(),
                const SizedBox(height: 10),
                if (!Responsive.isMobile(context)) firstButtonNext()
              ])
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Obx(() => Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: Responsive.isDesktop(context)
                                    ? MediaQuery.of(context).size.width / 4.8
                                    : MediaQuery.of(context).size.width / 10),
                            const Text(
                              'Select Purpose *',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Container(
                          // margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          width: Responsive.isDesktop(context)
                              ? MediaQuery.of(context).size.width / 4
                              : MediaQuery.of(context).size.width / 2.5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: DropdownButtonFormField(
                              decoration: Styles.dropdownDecoration(),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                              value: pay.lguPurpose,
                              hint: const Text('Select Purpose',
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
                              items: pay.lguPurposeList.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                      "${item["masterdatadescription"]}",
                                      style: const TextStyle(
                                          color: Color(0Xff413D4B),
                                          fontSize: 14)),
                                );
                              }).toList(),
                              onChanged: (var newValue) {
                                setState(() {
                                  pay.lguPurpose = newValue;
                                });
                              },
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4.8
                                : MediaQuery.of(context).size.width / 10),
                        const Text(
                          'Select Province *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      // margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2.5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: Styles.dropdownDecoration(),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.lguProvince,
                          hint: const Text('Select Province',
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
                          items: pay.lguProvinceList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(
                                  "${item["firstname"]} ${item["lastname"] ?? ""}",
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.lguProvince = newValue;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                        width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4.8
                            : MediaQuery.of(context).size.width / 10),
                    Text(
                      "Property Identification Number *",
                      style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  width: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 4
                      : MediaQuery.of(context).size.width / 2.5,
                  child: TextFormField(
                    // label: "Property Identification Number *",
                    controller: pay.PINCnl,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(12),
                      PINInputFormatter()
                    ],
                    textInputAction: TextInputAction.next,
                    decoration: Styles.textFiledDecoration(hint: "PIN"),
                    enabled: true,
                  ),
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "Start Date *",
                  controller: pay.startDate,
                  obsecureText: false,
                  read: true,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputDecoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            datePickerForDate("Start");
                          },
                          icon: Icon(Icons.date_range)),
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      hintText: "dd-MM-YYY",
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      helperStyle:
                          const TextStyle(fontFamily: 'Sora', fontSize: 14),
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(65, 61, 75, 0.6))),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "End Date *",
                  controller: pay.endDate,
                  obsecureText: false,
                  read: true,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputDecoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            datePickerForDate("End");
                          },
                          icon: Icon(Icons.date_range)),
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      hintText: "dd-MM-YYY",
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      helperStyle:
                          const TextStyle(fontFamily: 'Sora', fontSize: 14),
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(65, 61, 75, 0.6))),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                MyCustomInputBox(
                  label: "Bill Amount *",
                  controller: pay.billAmountCnl,
                  obsecureText: false,
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textInputAction: TextInputAction.next,
                  inputDecoration:
                      Styles.textFiledDecoration(hint: "Bill Amount"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                filePickWidget(),
                const SizedBox(height: 10),
                if (!Responsive.isMobile(context)) firstButtonNext()
              ]);
  }

  payeeHouseWidget() {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                width: Responsive.isDesktop(context)
                                    ? MediaQuery.of(context).size.width / 4.8
                                    : MediaQuery.of(context).size.width / 10),
                            const Text(
                              'Select Payee *',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: Responsive.isDesktop(context)
                              ? MediaQuery.of(context).size.width / 4
                              : MediaQuery.of(context).size.width / 2.5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: DropdownButtonFormField(
                              decoration: Styles.dropdownDecoration(),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                              value: pay.housePayee,
                              hint: const Text('Select Payee',
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
                              items: pay.housePayeeList.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text("${item["name"]}",
                                      style: const TextStyle(
                                          color: Color(0Xff413D4B),
                                          fontSize: 14)),
                                );
                              }).toList(),
                              onChanged: (var newValue) {
                                setState(() {
                                  pay.housePayee = newValue;
                                });
                              },
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4.8
                                : MediaQuery.of(context).size.width / 10),
                        const Text(
                          'Select Purpose *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2.5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: Styles.dropdownDecoration(),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.housePurpose,
                          hint: const Text('Select Purpose',
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
                          items: pay.housePurposeList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text("${item["name"]}",
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.housePurpose = newValue;
                              if (pay.housePurpose["name"] == "Maintenance" ||
                                  pay.housePurpose["name"] == "Renovation") {
                                houseTypePurpose = true;
                              } else {
                                houseTypePurpose = false;
                              }
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                houseTypePurpose
                    ? Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  width: Responsive.isDesktop(context)
                                      ? MediaQuery.of(context).size.width / 4.8
                                      : MediaQuery.of(context).size.width / 10),
                              const Text(
                                'Invoice Date *',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4
                                : MediaQuery.of(context).size.width / 2.5,
                            child: TextFormField(
                              //label: "Invoice Date *",
                              controller: pay.invoiceDateCnl,
                              obscureText: false,
                              readOnly: true,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        datePickerForDate("Date");
                                      },
                                      icon: Icon(Icons.date_range)),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFFE5E5E5))),
                                  hintText: "dd-MM-YYY",
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFFE5E5E5))),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFFE5E5E5))),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  helperStyle: const TextStyle(
                                      fontFamily: 'Sora', fontSize: 14),
                                  hintStyle: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Sora',
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(65, 61, 75, 0.6))),
                              enabled: true,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  width: Responsive.isDesktop(context)
                                      ? MediaQuery.of(context).size.width / 4.8
                                      : MediaQuery.of(context).size.width / 10),
                              const Text(
                                'House/Apt/Office No *',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4
                                : MediaQuery.of(context).size.width / 2.5,
                            child: TextFormField(
                              // label: "House/Apt/Office No *",
                              controller: pay.addressNoCnl,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: Styles.textFiledDecoration(
                                  hint: "House/Apt/Office No"),
                              enabled: true,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(
                                  width: Responsive.isDesktop(context)
                                      ? MediaQuery.of(context).size.width / 4.8
                                      : MediaQuery.of(context).size.width / 10),
                              const Text(
                                'Street Name *',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4
                                : MediaQuery.of(context).size.width / 2.5,
                            child: TextFormField(
                              // label: "Street Name *",
                              controller: pay.streetNameCnl,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: Styles.textFiledDecoration(
                                  hint: "Street Name"),
                              enabled: true,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      width: Responsive.isDesktop(context)
                                          ? MediaQuery.of(context).size.width /
                                              4.8
                                          : MediaQuery.of(context).size.width /
                                              10),
                                  const Text(
                                    'Select Province *',
                                    style: TextStyle(
                                        fontFamily: 'Sora',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: Responsive.isDesktop(context)
                                    ? MediaQuery.of(context).size.width / 4
                                    : MediaQuery.of(context).size.width / 2.5,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: DropdownButtonFormField(
                                    decoration: Styles.dropdownDecoration(),
                                    dropdownColor: Colors.white,
                                    isExpanded: true,
                                    value: pay.province,
                                    hint: const Text('Select Province',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Sora',
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                65, 61, 75, 0.6))),
                                    icon: const InkWell(
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    items: pay.provinceList.map((item) {
                                      return DropdownMenuItem(
                                        value: item["name"].toString(),
                                        child: Text(item["name"].toString(),
                                            style: const TextStyle(
                                                color: Color(0Xff413D4B),
                                                fontSize: 14)),
                                      );
                                    }).toList(),
                                    onChanged: (var newValue) {
                                      setState(() {
                                        pay.province = newValue;
                                      });
                                    },
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      width: Responsive.isDesktop(context)
                                          ? MediaQuery.of(context).size.width /
                                              4.8
                                          : MediaQuery.of(context).size.width /
                                              10),
                                  const Text(
                                    'Select City *',
                                    style: TextStyle(
                                        fontFamily: 'Sora',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: Responsive.isDesktop(context)
                                    ? MediaQuery.of(context).size.width / 4
                                    : MediaQuery.of(context).size.width / 2.5,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: DropdownButtonFormField(
                                    decoration: Styles.dropdownDecoration(),
                                    dropdownColor: Colors.white,
                                    isExpanded: true,
                                    value: pay.city,
                                    hint: const Text('Select City',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Sora',
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                65, 61, 75, 0.6))),
                                    icon: const InkWell(
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    items: pay.cityList.map((item) {
                                      return DropdownMenuItem(
                                        value: item["name"].toString(),
                                        child: Text(item["name"].toString(),
                                            style: const TextStyle(
                                                color: Color(0Xff413D4B),
                                                fontSize: 14)),
                                      );
                                    }).toList(),
                                    onChanged: (var newValue) {
                                      setState(() {
                                        pay.city = newValue;
                                      });
                                    },
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(
                                  width: Responsive.isDesktop(context)
                                      ? MediaQuery.of(context).size.width / 4.8
                                      : MediaQuery.of(context).size.width / 10),
                              const Text(
                                "Postal Code *",
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4
                                : MediaQuery.of(context).size.width / 2.5,
                            child: TextFormField(
                              //label: "Postal Code *",
                              controller: pay.postalCode,
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: Styles.textFiledDecoration(
                                  hint: "Postal Code"),
                              enabled: true,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(
                                  width: Responsive.isDesktop(context)
                                      ? MediaQuery.of(context).size.width / 4.8
                                      : MediaQuery.of(context).size.width / 10),
                              const Text(
                                "Start Date *",
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4
                                : MediaQuery.of(context).size.width / 2.5,
                            child: TextFormField(
                              //  label: "Start Date *",
                              controller: pay.startDate,
                              obscureText: false,
                              readOnly: true,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        datePickerForDate("Start");
                                      },
                                      icon: Icon(Icons.date_range)),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFFE5E5E5))),
                                  hintText: "dd-MM-YYY",
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFFE5E5E5))),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFFE5E5E5))),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  helperStyle: const TextStyle(
                                      fontFamily: 'Sora', fontSize: 14),
                                  hintStyle: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Sora',
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(65, 61, 75, 0.6))),
                              enabled: true,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(
                                  width: Responsive.isDesktop(context)
                                      ? MediaQuery.of(context).size.width / 4.8
                                      : MediaQuery.of(context).size.width / 10),
                              const Text(
                                "End Date *",
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4
                                : MediaQuery.of(context).size.width / 2.5,
                            child: TextFormField(
                              // label: "End Date *",
                              controller: pay.endDate,
                              obscureText: false,
                              readOnly: true,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        datePickerForDate("End");
                                      },
                                      icon: Icon(Icons.date_range)),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFFE5E5E5))),
                                  hintText: "dd-MM-YYY",
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFFE5E5E5))),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Color(0xFFE5E5E5))),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  helperStyle: const TextStyle(
                                      fontFamily: 'Sora', fontSize: 14),
                                  hintStyle: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Sora',
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(65, 61, 75, 0.6))),
                              enabled: true,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                Row(
                  children: [
                    SizedBox(
                        width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4.8
                            : MediaQuery.of(context).size.width / 10),
                    const Text(
                      "Invoice No *",
                      style: TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  width: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 4
                      : MediaQuery.of(context).size.width / 2.5,
                  child: TextFormField(
                    //  label: "Invoice No *",
                    controller: pay.invoiceNoCnl,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    textInputAction: TextInputAction.next,
                    decoration: Styles.textFiledDecoration(hint: "Invoice No"),
                    enabled: true,
                  ),
                ),
                const SizedBox(height: 10),
                filePickWidget(),
                const SizedBox(height: 10),
                if (!Responsive.isMobile(context)) firstButtonNext()
              ])
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Obx(() => Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: const Text(
                              'Select Payee *',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(height: 5),
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: DropdownButtonFormField(
                              decoration: Styles.dropdownDecoration(),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                              value: pay.housePayee,
                              hint: const Text('Select Payee',
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
                              items: pay.housePayeeList.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text("${item["name"]}",
                                      style: const TextStyle(
                                          color: Color(0Xff413D4B),
                                          fontSize: 14)),
                                );
                              }).toList(),
                              onChanged: (var newValue) {
                                setState(() {
                                  pay.housePayee = newValue;
                                });
                              },
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: const Text(
                          'Select Purpose *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: Styles.dropdownDecoration(),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.housePurpose,
                          hint: const Text('Select Purpose',
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
                          items: pay.housePurposeList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text("${item["name"]}",
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.housePurpose = newValue;
                              if (pay.housePurpose["name"] == "Maintenance" ||
                                  pay.housePurpose["name"] == "Renovation") {
                                houseTypePurpose = true;
                              } else {
                                houseTypePurpose = false;
                              }
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                houseTypePurpose
                    ? Column(
                        children: [
                          MyCustomInputBox(
                            label: "Invoice Date *",
                            controller: pay.invoiceDateCnl,
                            obsecureText: false,
                            read: true,
                            textInputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            inputDecoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      datePickerForDate("Date");
                                    },
                                    icon: Icon(Icons.date_range)),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Color(0xFFE5E5E5))),
                                hintText: "dd-MM-YYY",
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Color(0xFFE5E5E5))),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Color(0xFFE5E5E5))),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                helperStyle: const TextStyle(
                                    fontFamily: 'Sora', fontSize: 14),
                                hintStyle: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(65, 61, 75, 0.6))),
                            enabled: true,
                          ),
                          const SizedBox(height: 10),
                        ],
                      )
                    : Column(
                        children: [
                          MyCustomInputBox(
                            label: "House/Apt/Office No *",
                            controller: pay.addressNoCnl,
                            obsecureText: false,
                            textInputType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            inputDecoration: Styles.textFiledDecoration(
                                hint: "House/Apt/Office No"),
                            enabled: true,
                          ),
                          const SizedBox(height: 10),
                          MyCustomInputBox(
                            label: "Street Name *",
                            controller: pay.streetNameCnl,
                            obsecureText: false,
                            textInputType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            inputDecoration:
                                Styles.textFiledDecoration(hint: "Street Name"),
                            enabled: true,
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: const Text(
                                    'Select Province *',
                                    style: TextStyle(
                                        fontFamily: 'Sora',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(height: 5),
                              Container(
                                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                width: MediaQuery.of(context).size.width / 1.1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: DropdownButtonFormField(
                                    decoration: Styles.dropdownDecoration(),
                                    dropdownColor: Colors.white,
                                    isExpanded: true,
                                    value: pay.province,
                                    hint: const Text('Select Province',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Sora',
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                65, 61, 75, 0.6))),
                                    icon: const InkWell(
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    items: pay.provinceList.map((item) {
                                      return DropdownMenuItem(
                                        value: item["name"].toString(),
                                        child: Text(item["name"].toString(),
                                            style: const TextStyle(
                                                color: Color(0Xff413D4B),
                                                fontSize: 14)),
                                      );
                                    }).toList(),
                                    onChanged: (var newValue) {
                                      setState(() {
                                        pay.province = newValue;
                                      });
                                    },
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: const Text(
                                    'Select City *',
                                    style: TextStyle(
                                        fontFamily: 'Sora',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(height: 5),
                              Container(
                                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                width: MediaQuery.of(context).size.width / 1.1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: DropdownButtonFormField(
                                    decoration: Styles.dropdownDecoration(),
                                    dropdownColor: Colors.white,
                                    isExpanded: true,
                                    value: pay.city,
                                    hint: const Text('Select City',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Sora',
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                65, 61, 75, 0.6))),
                                    icon: const InkWell(
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    items: pay.cityList.map((item) {
                                      return DropdownMenuItem(
                                        value: item["name"].toString(),
                                        child: Text(item["name"].toString(),
                                            style: const TextStyle(
                                                color: Color(0Xff413D4B),
                                                fontSize: 14)),
                                      );
                                    }).toList(),
                                    onChanged: (var newValue) {
                                      setState(() {
                                        pay.city = newValue;
                                      });
                                    },
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          MyCustomInputBox(
                            label: "Postal Code *",
                            controller: pay.postalCode,
                            obsecureText: false,
                            textInputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            inputDecoration:
                                Styles.textFiledDecoration(hint: "Postal Code"),
                            enabled: true,
                          ),
                          const SizedBox(height: 10),
                          MyCustomInputBox(
                            label: "Start Date *",
                            controller: pay.startDate,
                            obsecureText: false,
                            read: true,
                            textInputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            inputDecoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      datePickerForDate("Start");
                                    },
                                    icon: Icon(Icons.date_range)),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Color(0xFFE5E5E5))),
                                hintText: "dd-MM-YYY",
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Color(0xFFE5E5E5))),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Color(0xFFE5E5E5))),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                helperStyle: const TextStyle(
                                    fontFamily: 'Sora', fontSize: 14),
                                hintStyle: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(65, 61, 75, 0.6))),
                            enabled: true,
                          ),
                          const SizedBox(height: 10),
                          MyCustomInputBox(
                            label: "End Date *",
                            controller: pay.endDate,
                            obsecureText: false,
                            read: true,
                            textInputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            inputDecoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      datePickerForDate("End");
                                    },
                                    icon: Icon(Icons.date_range)),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Color(0xFFE5E5E5))),
                                hintText: "dd-MM-YYY",
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Color(0xFFE5E5E5))),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Color(0xFFE5E5E5))),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                helperStyle: const TextStyle(
                                    fontFamily: 'Sora', fontSize: 14),
                                hintStyle: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(65, 61, 75, 0.6))),
                            enabled: true,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                MyCustomInputBox(
                  label: "Invoice No *",
                  controller: pay.invoiceNoCnl,
                  obsecureText: false,
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textInputAction: TextInputAction.next,
                  inputDecoration:
                      Styles.textFiledDecoration(hint: "Invoice No"),
                  enabled: true,
                ),
                const SizedBox(height: 10),
                filePickWidget(),
                const SizedBox(height: 10),
                if (!Responsive.isMobile(context)) firstButtonNext()
              ]);
  }

  datePickerForDate(String type) async {
    DateTime? date = DateTime(1900);
    FocusScope.of(context).requestFocus(new FocusNode());
    date = (await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: HexColor('#004751'),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: HexColor('#004751'), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 18),
    ));
    if (date != null) {
      setState(() {
        if (type == "Start") {
          pay.startDate.text = DateFormat("dd-MM-yyyy").format(date!);
        } else if (type == "End") {
          pay.endDate.text = DateFormat("dd-MM-yyyy").format(date!);
        } else {
          pay.invoiceDateCnl.text = DateFormat("dd-MM-yyyy").format(date!);
        }
      });
    }
  }

  Widget filePickWidget() {
    return isVerify
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Responsive.isMobile(context)
                  ? Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text(
                          widget.paymentType == "LGU"
                              ? "Upload Statement of Account *"
                              : 'Upload Contract/Invoice *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.bold)))
                  : Container(
                      width: MediaQuery.of(context).size.width / 4,
                      
                      //  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text(
                          widget.paymentType == "LGU"
                              ? "Upload Statement of Account *"
                              : 'Upload Contract/Invoice *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.bold))),
              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                width: Responsive.isMobile(context)
                    ? MediaQuery.of(context).size.width / 1
                    : Responsive.isDesktop(context)
                        ? MediaQuery.of(context).size.width / 4
                        : MediaQuery.of(context).size.width / 2.5,
                height: 150,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0XffB7C5C7), width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(3))),
                child: InkWell(
                  onTap: () async {
                    filePicker(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      pay.pickedFile == null
                          ? Icon(Icons.arrow_upward_sharp)
                          : Icon(
                              Icons.file_present,
                              size: 50,
                            ),
                      SizedBox(height: 5),
                      Text(pay.pickedFile == null
                          ? 'Upload Document'
                          : 'File Uploaded'),
                    ],
                  ),
                ),
              ),
              const Text(
                'Specify file format (jpg, png, pdf and max file size of 2 MB).',
                style: TextStyle(fontSize: 10),
              ),
            ],
          )
        : Container();
  }

  Widget firstButtonNext() {
    return AuthButton(
      onTap: () {
        if (widget.paymentType == "LGU") {
          lguValidateFunction();
        } else if (widget.paymentType == "House") {
          houseValidateFunction();
        } else {
          newPayeeValidateFunction();
        }
      },
      text: "Next",
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  newPayeeValidateFunction() {
    if (pay.paymentPurpose == null) {
      Fluttertoast.showToast(msg: "Please Select Purpose");
    } else if (pay.paymentSubPurpose == null) {
      Fluttertoast.showToast(msg: "Please Select SubPurpose");
    } else if (pay.province == null) {
      Fluttertoast.showToast(msg: "Please Select Province");
    } else if (pay.city == null) {
      Fluttertoast.showToast(msg: "Please Select City");
    } else if (pay.propertyOwnerNameCnl.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Owner Name");
    } else if (pay.addressNoCnl.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Address");
    } else if (pay.streetNameCnl.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Street");
    } else if (pay.startDate.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Start Date");
    } else if (pay.endDate.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter End Date");
    } else if (pay.postalCode.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Postal Code");
    } else {
      if (!isVerify) {
        pay
            .newPaymentVerificationAPI(widget.paymentType, widget.payee)
            .then((value) {
          if (value == "Success") {
            setState(() {
              isVerify = true;
            });
          }
        });
      } else {
        pay.newPaymentDocumentAPI(widget.paymentType, widget.payee);
      }
    }
  }

  lguValidateFunction() {
    if (pay.lguPurpose == null) {
      Fluttertoast.showToast(msg: "Please Select Purpose");
    } else if (pay.lguProvince == null) {
      Fluttertoast.showToast(msg: "Please Select Province");
    } else if (pay.PINCnl.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter PIN");
    } else if (pay.billAmountCnl.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Bill Amount");
    } else if (pay.startDate.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Start Date");
    } else if (pay.endDate.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter End Date");
    } else {
      if (!isVerify) {
        pay
            .lguPaymentVerificationAPI(widget.paymentType, widget.payee)
            .then((value) {
          if (value == "Success") {
            setState(() {
              isVerify = true;
            });
          }
        });
      } else {
        pay.lguPaymentDocumentAPI(widget.paymentType, widget.payee);
      }
    }
  }

  houseValidateFunction() {
    Get.to(PurposeDetails(
        paymentType: widget.paymentType, payee: widget.payee, purpose: null));
    if (pay.housePayee == null) {
      Fluttertoast.showToast(msg: "Please Select Payee");
    } else if (pay.housePurpose == null) {
      Fluttertoast.showToast(msg: "Please Select Purpose");
    } else if (pay.lguProvince == null) {
      Fluttertoast.showToast(msg: "Please Select Province");
    } else if (pay.invoiceNoCnl.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Invoice");
    } else if (pay.invoiceDateCnl.text.isEmpty && houseTypePurpose) {
      Fluttertoast.showToast(msg: "Please Enter Invoice Date");
    } else if (pay.addressNoCnl.text.isEmpty && !houseTypePurpose) {
      Fluttertoast.showToast(msg: "Please Enter Address");
    } else if (pay.streetNameCnl.text.isEmpty && !houseTypePurpose) {
      Fluttertoast.showToast(msg: "Please Enter Street");
    } else if (pay.startDate.text.isEmpty && !houseTypePurpose) {
      Fluttertoast.showToast(msg: "Please Enter Start Date");
    } else if (pay.endDate.text.isEmpty && !houseTypePurpose) {
      Fluttertoast.showToast(msg: "Please Enter End Date");
    } else if (pay.postalCode.text.isEmpty && !houseTypePurpose) {
      Fluttertoast.showToast(msg: "Please Enter Postal Code");
    } else {
      if (!isVerify) {
        // pay.housePaymentVerificationAPI(widget.paymentType, widget.payee).then((value) {
        //   if (value == "Success") {
        setState(() {
          isVerify = true;
        });
        //   }
        // });
      } else {
        pay.housePaymentDocumentAPI(widget.paymentType, widget.payee);
      }
    }
  }

  void filePicker(context) {
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
                    Text(
                        widget.paymentType == "LGU"
                            ? "Upload Statement of Account"
                            : 'Upload Contract/Invoice',
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
                                      if (Responsive.isDesktop(context)) {
                                        getImage(ImageSource.gallery);
                                        Get.back();
                                      } else {
                                        openGallery();
                                        Get.back();
                                      }
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
                                      getImage(ImageSource.camera);
                                      Get.back();
                                    },
                                    child: Image.asset("assets/camera_new.png",
                                        height: 50)),
                                const SizedBox(height: 5),
                                const Text("Camera")
                              ],
                            )),
                      ],
                    ),
                  ],
                )),
          );
        });
  }

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(
      source: source,
      imageQuality: 100,
      maxHeight: 700,
      maxWidth: 700,
    );
    if (image == null) return;
    if (Responsive.isDesktop(context)) {
      setState(() {
        imagedoc2 = File(image.path.toString());
      });
      List<int> bytes = await image.readAsBytes();
      pay.pickedFile = base64Encode(bytes);
    } else {
      List<int> bytes = await image.readAsBytes();
      setState(() {
        pay.pickedFile = base64Encode(bytes);
        log(pay.pickedFile);
      });
    }
  }

  openGallery() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf', 'jpg', 'png']);
    if (file == null) return;
    var _file = File(file.files.single.path!);
    setState(() {
      List<int> fileBytes = _file.readAsBytesSync();
      pay.pickedFile = base64.encode(fileBytes);
      log(pay.pickedFile);
    });
  }

  fileSizeChecker(String filePath) {
    final f = File(filePath);
    int sizeInBytes = f.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    if (sizeInMb <= 2) {
      return true;
    }
    return false;
  }
}
