import 'package:cardit/ui/dashboard/paynow_menu/payment_overview_dashboard.dart';
import 'package:cardit/ui/payment/payee_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../api/payment_api.dart';
import '../../api/regster_api.dart';
import '../../const/responsive.dart';
import '../../themes/styles.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';

class PurposeDetails extends StatefulWidget {
  var paymentType;
  var payee;
  var purpose;
   PurposeDetails({Key? key, this.paymentType,this.payee, this.purpose}) : super(key: key);

  @override
  State<PurposeDetails> createState() => _PurposeDetailsState();
}

class _PurposeDetailsState extends State<PurposeDetails> {
  final PaymentAPI pay = Get.put(PaymentAPI());
  final RegisterAPI con = Get.put(RegisterAPI());
  String billAmount = "0.0";

  String amountCalculation(var start, var end){
    double value = 0.0;
    pay.startYearList.forEach((element) {
      if((int.parse(start["PERIOD"]) <= int.parse(element["PERIOD"])) && (int.parse(end["PERIOD"]) >= int.parse(element["PERIOD"]))){
        value += double.parse(element["TOTAL"]);
      }
    });
    return value.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.paymentType == "LGU") {
      billAmount = widget.purpose["KEYVALUE"]["BILL AMOUNT"].replaceAll(
          RegExp(r'[^0-9.]'), '');
    }
    }
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text(widget.paymentType == "House"
              ? 'Payment Details for ${widget.purpose ?? 'purpose'}'
              :'Your ${widget.purpose["purpose"] ?? "Payment"} Details',
              style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Sora',
                  color: Colors.black,
                  fontWeight: FontWeight.bold)))
          : null,
      body: Responsive.isMobile(context)
          ? SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: widget.paymentType == "LGU" ? lguPayeeWidget() :widget.paymentType == "House" ? housePayeeWidget() : newPayeeWidget(),
        ),
      )
          : Row(
        children: [
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
                          '"Make your life simple"',
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
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(20),
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
                    widget.paymentType == "LGU" ? lguPayeeWidget() : widget.paymentType == "House" ? housePayeeWidget() : newPayeeWidget(),
                   ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Responsive.isMobile(context)
          ? confirmationButton()
          : null,
    );
  }

  newPayeeWidget() {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Property Owner',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text(widget.purpose["owner"] ?? '',
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Text('Property Address',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text(
                  '${widget.purpose["addressno"] ?? ''} ${widget.purpose["streetname"] ?? ''} ${widget.purpose["city"] ?? ''} ${widget.purpose["province"] ?? ''}',
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Text('Contract Term',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text("Contract Term value",
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Text('Payment Period',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text("2 month",
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ignore: unnecessary_brace_in_string_interps
                    Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Text(' Select Payee Type *',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontSize: 14,
                                    color: HexColor('#505050')))),
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
                              value: pay.payeeType,
                              hint: const Text('Select Payee Type ',
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
                              items: pay.payeeTypeList.map((item) {
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
                                  pay.payeeType = newValue;
                                });
                              },
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (pay.payeeType == "Property Management Company")
                      MyCustomInputBox(
                        label: "Payee’s Name *",
                        controller: pay.payeeNameCnl,
                        obsecureText: false,
                        inputHint: 'Enter Name',
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                        ],
                        inputDecoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFFE5E5E5))),
                            hintText: "Enter Payee's Name",
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
                                color: Color.fromRGBO(65, 61, 75, 0.6))),
                        enabled: true,
                      ),
                    MyCustomInputBox(
                        enabled: true,
                        label: "Payee’s Email *",
                        controller: pay.payeeEmailCnl,
                        obsecureText: false,
                        inputHint: 'Enter your account number',
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
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
                      label: "Mobile Number *",
                      enabled: true,
                      textInputType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      controller: pay.payeeMobileCnl,
                      obsecureText: false,
                      inputHint: 'Enter your Mobile number',
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      inputDecoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFE5E5E5))),
                          hintText: "Enter your Mobile number",
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
                              color: Color.fromRGBO(65, 61, 75, 0.6))),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text('Select Bank *',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                color: HexColor('#505050')))),
                    const SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFE5E5E5)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFE5E5E5)),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFFE5E5E5))),
                          ),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.bankDetails,
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
                              pay.bankDetails = newValue!;
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
                      label: "Account Number *",
                      controller: pay.accountNoCnl,
                      obsecureText: false,
                      inputHint: 'Enter your Account Number',
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      inputDecoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFE5E5E5))),
                          hintText: "Enter your  Account  number",
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
                              color: Color.fromRGBO(65, 61, 75, 0.6))),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text('Account Type *',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                color: HexColor('#505050')))),
                    const SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFE5E5E5)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFE5E5E5)),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFFE5E5E5))),
                          ),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.accountType,
                          hint: const Text('Account Type',
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
                          items: pay.accountTypeList.map((item) {
                            return DropdownMenuItem(
                              value: item.toString(),
                              child: Text(item.toString(),
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              pay.accountType = newValue!;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ]),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: TextFormField(
                            controller: pay.paymentController,
                            decoration: InputDecoration(
                                hintText: 'Enter How Much you want to pay',
                                hintStyle: TextStyle(
                                    fontFamily: 'Sora', fontSize: 14)))),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context)) confirmationButton()
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  const Text('Property Owner',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ],
              ),
              SizedBox(height: 10),
              Text("",
                  //widget.purpose["owner"] ?? '',
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  Text('Property Address',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  Text("",
                      //'${widget.purpose["addressno"] ?? ''} ${widget.purpose["streetname"] ?? ''} ${widget.purpose["city"] ?? ''} ${widget.purpose["province"] ?? ''}',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.grey,
                          fontSize: 16)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  Text(
                    'Contract Term',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  Text("Contract Term value",
                      style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.grey,
                          fontSize: 16)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  Text(
                    'Payment Period',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  Text("2 month",
                      style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.grey,
                          fontSize: 16)),
                ],
              ),
              SizedBox(height: 20),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ignore: unnecessary_brace_in_string_interps
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                width: Responsive.isDesktop(context)
                                    ? MediaQuery.of(context).size.width / 5.2
                                    : MediaQuery.of(context).size.width / 14),
                            Text(
                              ' Select Payee Type *',
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
                              value: pay.payeeType,
                              hint: const Text('Select Payee Type ',
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
                              items: pay.payeeTypeList.map((item) {
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
                                  pay.payeeType = newValue;
                                });
                              },
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (pay.payeeType == "Property Management Company")
                    Row(children: [
                        SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 5.2
                                : MediaQuery.of(context).size.width / 14),
                        Text('Payee’s Name *',
                             style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),),
                    ],),
                    SizedBox(height: 5,),
                      Container(
                        width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2.5,
                        child: TextFormField(
                          //label: "Payee’s Name *",
                          controller: pay.payeeNameCnl,
                          obscureText: false,
                         // inputHint: 'Enter Name',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                          ],
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Color(0xFFE5E5E5))),
                              hintText: "Enter Payee's Name",
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
                                  color: Color.fromRGBO(65, 61, 75, 0.6))),
                          enabled: true,
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
  SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 5.2
                                : MediaQuery.of(context).size.width / 14),
                        Text('Payee’s Email *',
                             style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),),
                    ],),
                    SizedBox(height: 5,),
                    Container(
                        width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2.5,
                      child: TextFormField(
                          enabled: true,
                         // label: "Payee’s Email *",
                          controller: pay.payeeEmailCnl,
                          obscureText: false,
                         // inputHint: 'Enter your account number',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
  SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 5.2
                                : MediaQuery.of(context).size.width / 14),
                        Text('Mobile Number *',
                             style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),),
                      ],
                    ),
SizedBox(height: 5,),
                    Container(
                       width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2.5,
                      child: TextFormField(
                       // label: "Mobile Number *",
                        enabled: true,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        controller: pay.payeeMobileCnl,
                        obscureText: false,
                       // inputHint: 'Enter your Mobile number',
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFFE5E5E5))),
                            hintText: "Enter your Mobile number",
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
                                color: Color.fromRGBO(65, 61, 75, 0.6))),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 5.2
                                : MediaQuery.of(context).size.width / 14),
                        Text('Select Bank *',
                             style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2.5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFE5E5E5)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFE5E5E5)),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFFE5E5E5))),
                          ),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.bankDetails,
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
                              pay.bankDetails = newValue!;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [
SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 5.2
                                : MediaQuery.of(context).size.width / 14),
                        Text('Account Number *',
                             style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),),
                    ],),
                    SizedBox(height: 5,),
                    Container(
                       width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2.5,
                      child: TextFormField(
                        enabled: true,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        
                       // label: "Account Number *",
                        controller: pay.accountNoCnl,
                        obscureText: false,
                      
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                        
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFFE5E5E5))),
                            hintText: "Enter your  Account  number",
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
                                color: Color.fromRGBO(65, 61, 75, 0.6))),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 5.2
                                : MediaQuery.of(context).size.width / 14),
                        Text('Account Type *',
                             style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2.5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFE5E5E5)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFE5E5E5)),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFFE5E5E5))),
                          ),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: pay.accountType,
                          hint: const Text('Account Type',
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
                          items: pay.accountTypeList.map((item) {
                            return DropdownMenuItem(
                              value: item.toString(),
                              child: Text(item.toString(),
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              pay.accountType = newValue!;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                         Container(
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 4
                    : MediaQuery.of(context).size.width / 2.5,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: TextFormField(
                            controller: pay.paymentController,
                            decoration: InputDecoration(
                                hintText: 'Enter How Much you want to pay',
                                hintStyle: TextStyle(
                                    fontFamily: 'Sora', fontSize: 14)))),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context)) confirmationButton()
                  ]),
             
         
            ],
          );
  }

  lguPayeeWidget() {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Declared Owner',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              const SizedBox(height: 10),
              Text(widget.purpose["KEYVALUE"]["Declared Owner"] ?? '',
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Text('Location',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text(widget.purpose["KEYVALUE"]["Location"] ?? '',
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Text('Bill Amount',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text("$billAmount",
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              Column(children: [
                // ignore: unnecessary_brace_in_string_interps
                Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text('Select Start Year *',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                color: HexColor('#505050')))),
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
                          value: pay.startYear,
                          hint: const Text('Select Start Year ',
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
                          items: pay.startYearList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item["PERIOD"].toString(),
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.startYear = newValue;
                              billAmount =
                                  amountCalculation(pay.startYear, pay.endYear);
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
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text('Select End Year *',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                color: HexColor('#505050')))),
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
                          value: pay.endYear,
                          hint: const Text('Select End Year ',
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
                          items: pay.endYearList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item["PERIOD"].toString(),
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.endYear = newValue;
                              billAmount =
                                  amountCalculation(pay.startYear, pay.endYear);
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
              SizedBox(height: 20),
              Text('Property Identification Number',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text("${widget.purpose["KEYVALUE"]["PIN"]}",
                  style: TextStyle(
                      fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
              SizedBox(height: 20),
              if (!Responsive.isMobile(context)) confirmationButton()
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                     SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  const Text('Declared Owner',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                     SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  Text(widget.purpose["KEYVALUE"]["Declared Owner"] ?? '',
                      style: TextStyle(
                          fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                     SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  Text('Location',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                     SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  Text(widget.purpose["KEYVALUE"]["Location"] ?? '',
                      style: TextStyle(
                          fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                     SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  Text('Bill Amount',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                     SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  Text("$billAmount",
                      style: TextStyle(
                          fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
                ],
              ),
              SizedBox(height: 20),
              Column(children: [
                // ignore: unnecessary_brace_in_string_interps
                Column(
                  children: [
                    Row(
                      children: [
                           SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                        Text('Select Start Year *',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                color: HexColor('#505050'))),
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
                          value: pay.startYear,
                          hint: const Text('Select Start Year ',
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
                          items: pay.startYearList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item["PERIOD"].toString(),
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.startYear = newValue;
                              billAmount =
                                  amountCalculation(pay.startYear, pay.endYear);
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
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                        Text('Select End Year *',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                color: HexColor('#505050'))),
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
                          value: pay.endYear,
                          hint: const Text('Select End Year ',
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
                          items: pay.endYearList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item["PERIOD"].toString(),
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (var newValue) {
                            setState(() {
                              pay.endYear = newValue;
                              billAmount =
                                  amountCalculation(pay.startYear, pay.endYear);
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
              SizedBox(height: 20),
              Row(
                children: [
                     SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  Text('Property Identification Number',
                      style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                     SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                  Text("${widget.purpose["KEYVALUE"]["PIN"]}",
                      style: TextStyle(
                          fontFamily: 'Sora', color: Colors.grey, fontSize: 16)),
                ],
              ),
              SizedBox(height: 20),
              if (!Responsive.isMobile(context)) confirmationButton()
            ],
          );
  }

  housePayeeWidget(){
    return  Responsive.isMobile(context)?
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Payee Name,',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        const SizedBox(height: 10),
        Text(widget.purpose ?? '',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.grey,
                fontSize: 16)),
        SizedBox(height: 20),
        const Text('Bank Name',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        const SizedBox(height: 10),
        Text(widget.purpose ?? '',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.grey,
                fontSize: 16)),
        SizedBox(height: 20),
        const Text('Account No',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        const SizedBox(height: 10),
        Text(widget.purpose ?? '',
            style: TextStyle(
                fontFamily: 'Sora',
                color: Colors.grey,
                fontSize: 16)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text('Invoice Date',
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            SizedBox(height: 10),
            Text(widget.purpose ?? '',
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.grey,
                    fontSize: 16)),
            SizedBox(height: 20),
            Text('Invoice Amount',
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            SizedBox(height: 10),
            Text(widget.purpose ?? '',
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.grey,
                    fontSize: 16)),

          ],
        ),
        Column(
          children: [
            SizedBox(height: 20),
            Text('Property Address',
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            SizedBox(height: 10),
            Text(widget.purpose ?? '',
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.grey,
                    fontSize: 16)),
            SizedBox(height: 20),
            Text('Contract Terms',
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            SizedBox(height: 10),
            Text(widget.purpose ?? '',
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.grey,
                    fontSize: 16)),
          ],
        ),

        SizedBox(height: 20),
        Column(
            children: [
              // ignore: unnecessary_brace_in_string_interps
              Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Select Start Year *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: HexColor('#505050')))),
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
                        value: pay.startYear,
                        hint: const Text('Select Start Year ',
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
                        items: pay.startYearList.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item["PERIOD"].toString(),
                                style: const TextStyle(
                                    color: Color(0Xff413D4B),
                                    fontSize: 14)),
                          );
                        }).toList(),
                        onChanged: (var newValue) {
                          setState(() {
                            pay.startYear = newValue;
                            billAmount = amountCalculation(pay.startYear, pay.endYear);
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
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text('Select End Year *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: HexColor('#505050')))),
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
                        value: pay.endYear,
                        hint: const Text('Select End Year ',
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
                        items: pay.endYearList.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item["PERIOD"].toString(),
                                style: const TextStyle(
                                    color: Color(0Xff413D4B),
                                    fontSize: 14)),
                          );
                        }).toList(),
                        onChanged: (var newValue) {
                          setState(() {
                            pay.endYear = newValue;
                            billAmount = amountCalculation(pay.startYear, pay.endYear);
                          });
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: TextFormField(
                controller: pay.paymentController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                    hintText:
                    'Enter How Much you want to pay',
                    hintStyle: TextStyle(
                        fontFamily: 'Sora', fontSize: 14)))),
        SizedBox(height: 20),
        if(!Responsive.isMobile(context))
          confirmationButton()
      ],
    ):  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),

             Text('Payee Name,',
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
            Text(widget.purpose ?? '',
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.grey,
                    fontSize: 16)),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
            const Text('Bank Name',
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
            Text(widget.purpose ?? '',
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.grey,
                    fontSize: 16)),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
            const Text('Account No',
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
            Text(widget.purpose ?? '',
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.grey,
                    fontSize: 16)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                Text('Invoice Date',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                Text(widget.purpose ?? '',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        color: Colors.grey,
                        fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                Text('Invoice Amount',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                Text(widget.purpose ?? '',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        color: Colors.grey,
                        fontSize: 16)),
              ],
            ),

          ],
        ),
        Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                Text('Property Address',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                Text(widget.purpose ?? '',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        color: Colors.grey,
                        fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                Text('Contract Terms',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                Text(widget.purpose ?? '',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        color: Colors.grey,
                        fontSize: 16)),
              ],
            ),
          ],
        ),

        SizedBox(height: 20),
        Column(
            children: [
              // ignore: unnecessary_brace_in_string_interps
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                      Text('Select Start Year *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: HexColor('#505050'))),
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
                        value: pay.startYear,
                        hint: const Text('Select Start Year ',
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
                        items: pay.startYearList.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item["PERIOD"].toString(),
                                style: const TextStyle(
                                    color: Color(0Xff413D4B),
                                    fontSize: 14)),
                          );
                        }).toList(),
                        onChanged: (var newValue) {
                          setState(() {
                            pay.startYear = newValue;
                            billAmount = amountCalculation(pay.startYear, pay.endYear);
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
                      SizedBox( width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 14),
                      Text('Select End Year *',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: HexColor('#505050'))),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                   width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width /4
                          : MediaQuery.of(context).size.width / 2.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: DropdownButtonFormField(
                        decoration: Styles.dropdownDecoration(),
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        value: pay.endYear,
                        hint: const Text('Select End Year ',
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
                        items: pay.endYearList.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item["PERIOD"].toString(),
                                style: const TextStyle(
                                    color: Color(0Xff413D4B),
                                    fontSize: 14)),
                          );
                        }).toList(),
                        onChanged: (var newValue) {
                          setState(() {
                            pay.endYear = newValue;
                            billAmount = amountCalculation(pay.startYear, pay.endYear);
                          });
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
        SizedBox(height: 20),
        Container(
          width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2.5,
          child: TextFormField(
              controller: pay.paymentController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                  hintText:
                  'Enter How Much you want to pay',
                  hintStyle: TextStyle(
                      fontFamily: 'Sora', fontSize: 14))),
        ),
        SizedBox(height: 20),
        if(!Responsive.isMobile(context))
          confirmationButton()
      ],
    );
 ;
  }

  confirmationButton(){
    return  AuthButton(
        decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        onTap: () {
          if (widget.paymentType == "LGU") {
            lguValidation();
          }  else if (widget.paymentType == "House"){
            houseValidation();
        } else{
            var boby ={
              "name" : widget.purpose["owner"],
              "email" : pay.payeeEmailCnl.text,
              "amount": pay.paymentController.text
            };
            Get.to(() => PayeeLoading(
                  payee: boby,
                  purpose: widget.purpose,
                  paymentType: widget.paymentType,
                ));
          }
        },
        text: "Confirm");
  }

  lguValidation() {
    if (pay.startYear == null) {
      Fluttertoast.showToast(msg: "Please Enter Start Year");
    } else if (pay.endYear == null) {
      Fluttertoast.showToast(msg: "Please Enter End Year");
    } else {
      pay.lguPaymentDetailsAPI(
          widget.paymentType, widget.payee, widget.purpose, billAmount);
    }
  }

  houseValidation(){
    if(pay.startYear == null){
      Fluttertoast.showToast(msg: "Please Enter Start Year");
    } else if (pay.endYear == null) {
      Fluttertoast.showToast(msg: "Please Enter End Year");
    } else if (pay.paymentController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please Enter Amount");
    } else{
      pay.housePaymentDetailsAPI(widget.paymentType, widget.payee, widget.purpose, billAmount);
    }
  }

}
