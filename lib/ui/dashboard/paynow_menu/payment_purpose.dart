import 'package:cardit/const/responsive.dart';
import 'package:cardit/ui/dashboard/paynow_menu/payment_overview_dashboard.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../api/regster_api.dart';

class PaymentPurpose extends StatefulWidget {
  const PaymentPurpose({super.key});

  @override
  State<PaymentPurpose> createState() => _PaymentPurposeState();
}

class _PaymentPurposeState extends State<PaymentPurpose> {
  String? dropdownvalue;
  TextEditingController _controller = TextEditingController();

  final RegisterAPI con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Purpose of Payment',
                    style: TextStyle(
                        color: HexColor('#413D4B'),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          : null,
      body: Responsive.isMobile(context)
          ? Column(
              children: [selectPurpose()],
            )
          : Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  //height: MediaQuery.of(context).size.height / 1,
                  color: Color(0XFF004751),
                  child: Center(
                      child: Image.asset("assets/applogo-02.png",
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height / 3)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
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
                      Text(
                        'Purpose of Payment',
                        style: TextStyle(
                            color: HexColor('#413D4B'),
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      selectPurpose()
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget selectPurpose() {
    return Responsive.isMobile(context)
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Select your Purpose",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Sora"),
                    ),
                  ],
                ),
                installment_plan()
              ],
            ),
          )
        : Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: Responsive.isDesktop(context)
                        ? MediaQuery.of(context).size.width / 4.8
                        : MediaQuery.of(context).size.width / 10,
                  ),
                  Text(
                    "Select your Purpose",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Sora"),
                  ),
                ],
              ),
              installment_plan()
            ],
          );
  }

  Widget installment_plan() {
    return Responsive.isMobile(context)
        ? Column(children: [
            SizedBox(
              height: 10,
            ),
            Container(
              // margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: HexColor('#E5E5E5'), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(3))),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: HexColor('#E5E5E5'))),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: HexColor('#E5E5E5'))),
                  contentPadding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: HexColor('#E5E5E5'))),
                ),
                dropdownColor: Colors.white,
                isExpanded: true,
                value: dropdownvalue,
                hint: Text(
                  'Select your purpose',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                icon: InkWell(
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black45,
                  ),
                ),
                validator: (value) => value == null ? 'field required' : null,
                items: con.paymentpurposelist.map((item) {
                  return DropdownMenuItem(
                    value: item["purpose"].toString(),
                    child: Text(item["purpose"].toString(),
                        style: const TextStyle(
                            color: Color(0Xff413D4B), fontSize: 14)),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },

                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 15),
            bulidForm()
          ])
        : Column(children: [
            SizedBox(
              height: 10,
            ),
            Container(
              // margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width / 4
                  : MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: HexColor('#E5E5E5'), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(3))),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: HexColor('#E5E5E5'))),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: HexColor('#E5E5E5'))),
                  contentPadding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: HexColor('#E5E5E5'))),
                ),
                dropdownColor: Colors.white,
                isExpanded: true,
                value: dropdownvalue,
                hint: Text(
                  'Select your purpose',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                icon: InkWell(
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black45,
                  ),
                ),
                validator: (value) => value == null ? 'field required' : null,
                items: con.paymentpurposelist.map((item) {
                  return DropdownMenuItem(
                    value: item["purpose"].toString(),
                    child: Text(item["purpose"].toString(),
                        style: const TextStyle(
                            color: Color(0Xff413D4B), fontSize: 14)),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },

                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 15),
            bulidForm()
          ]);
  }

  Widget bulidForm() {
    return Responsive.isMobile(context)
        ? Container(
            child: Form(
                // key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4.8,
                    ),
                    Text(
                      "Add Comment",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Sora"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  maxLines: 5,
                  controller: _controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      hintText: "Add your purpose manually if not listed above",
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                      filled: true,
                      fillColor: Colors.white,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      helperStyle: TextStyle(fontFamily: 'Sora', fontSize: 14),
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(65, 61, 75, 0.6))),
                ),
              ])))
        : Container(
            child: Form(
                // key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                Row(
                  children: [
                    SizedBox(
                        width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 4.8
                            : MediaQuery.of(context).size.width / 10),
                    Text(
                      "Add Comment",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Sora"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 4
                      : MediaQuery.of(context).size.width / 2,
                  child: TextFormField(
                    maxLines: 5,
                    controller: _controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                        hintText:
                            "Add your purpose manually if not listed above",
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
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(OverviewPayment());
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
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Proceed To Pay",
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
        Get.to(OverviewPayment());
      },
      text: "Proceed To Pay",
    );
  }
}
