
import 'package:cardit/ui/dashboard/paynow_menu/payment_overview_dashboard.dart';
import 'package:cardit/ui/payment/payee_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text('Your ${widget.purpose["purpose"] ?? ""} Details',
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
          child: Column(
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
                      fontFamily: 'Sora',
                      color: Colors.grey,
                      fontSize: 16)),
              SizedBox(height: 20),
              Text('Property Address',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Text('${widget.purpose["addressno"] ?? ''} ${widget.purpose["streetname"] ?? ''} ${widget.purpose["city"] ?? ''} ${widget.purpose["province"] ?? ''}',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.grey,
                      fontSize: 16)),
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
                      fontFamily: 'Sora',
                      color: Colors.grey,
                      fontSize: 16)),
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
                      fontFamily: 'Sora',
                      color: Colors.grey,
                      fontSize: 16)),
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
                    if(pay.payeeType == "Property Management Company")
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
                            floatingLabelBehavior:
                            FloatingLabelBehavior.never,
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
                                      color: Color(0Xff413D4B),
                                      fontSize: 14)),
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
                                      color: Color(0Xff413D4B),
                                      fontSize: 14)),
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
                                hintText:
                                'Enter How Much you want to pay',
                                hintStyle: TextStyle(
                                    fontFamily: 'Sora', fontSize: 14)))),
                  ],
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
            height: MediaQuery.of(context).size.height / 1,
            color: Color(0XFF004751),
            child: Center(
                child: Image.asset("assets/applogo-02.png",
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 3)),
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
                    Text('Your Tax Details',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                        Text('Property Owner',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 10),
                    const Text('Property Owner',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 10),
                    Text(widget.purpose["owner"] ?? '',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Text('Property Address',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 10),
                    Text('${widget.purpose["addressno"] ?? ''} ${widget.purpose["streetname"] ?? ''} ${widget.purpose["city"] ?? ''} ${widget.purpose["province"] ?? ''}',
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
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
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
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
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                        Text('Assesment Period',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("2 Years",
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                        Text('Tax Declaration Number',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("232342545345",
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                        Text('Property Identification Number',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("232342545345",
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                        Text('NA Number',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("34345345345",
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //  SizedBox(width:MediaQuery.of(context).size.width / 4 ,),
                        Text('Assessment Date',
                            style: TextStyle(
                                fontFamily: 'Sora',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("1st January 2022",
                        style: TextStyle(
                            fontFamily: 'Sora',
                            color: Colors.grey,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Container(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 2,
                      height: 60,
                      decoration: BoxDecoration(
                          border:
                          Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: TextFormField(
                                  controller: pay.paymentController,
                                  decoration: InputDecoration(
                                      hintText:
                                      'Enter How Much you want to pay',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Sora',
                                          fontSize: 14)))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => PayeeLoading(payee: widget.payee, purpose: widget.purpose, paymentType: widget.paymentType,));
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
            ),
          ),
        ],
      ),
      bottomNavigationBar: Responsive.isMobile(context)
          ? AuthButton(
          decoration: BoxDecoration(
              color: HexColor('#CEE812'),
              borderRadius: BorderRadius.circular(5)),
          onTap: () {
            var boby ={
              "name" : widget.purpose["owner"],
              "email" : pay.payeeEmailCnl.text,
              "amount": pay.paymentController.text
            };
            Get.to(() => PayeeLoading(payee: boby, purpose: widget.purpose, paymentType: widget.paymentType,));
          },
          text: "Confirm")
          : null,
    );
  }
}
