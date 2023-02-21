// ignore_for_file: prefer_const_constructors

import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/themes/styles.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OnBoardPayeePage extends StatefulWidget {
  const OnBoardPayeePage({Key? key}) : super(key: key);

  @override
  State<OnBoardPayeePage> createState() => _OnBoardPayeePageState();
}

class _OnBoardPayeePageState extends State<OnBoardPayeePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final registrationController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final selectBankController = TextEditingController();
  final accountNumberController = TextEditingController();
  final swiftCodeController = TextEditingController();
  final Branchcontroller = TextEditingController();
  bool isBusiness = false;

  final List<String> dropdownData = [
    'State Bank',
    'Indian Bank',
    'Canara Bank'
  ];

  String? dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              foregroundColor: Colors.black,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text('Onboard Payee',
                  style: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 14,
                      fontWeight: FontWeight.bold)))
          : null,
      body: Responsive.isMobile(context)
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Payee’s Name',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Sora',
                            color: Colors.black)),
                    SizedBox(height: 10),
                    TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Enter your Name',
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle: const TextStyle(
                                fontFamily: 'Sora', fontSize: 14),
                            hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.normal),
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
                                fontWeight: FontWeight.bold))),
                    SizedBox(height: 10),
                    Text('Payee’s Email',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Sora',
                            color: Colors.black)),
                    SizedBox(height: 10),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: 'Enter your Email Address',
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle: const TextStyle(
                                fontFamily: 'Sora', fontSize: 14),
                            hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.normal),
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
                                fontWeight: FontWeight.bold))),
                    if(isBusiness)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text('Business Reg Number',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Sora',
                                color: Colors.black)),
                        SizedBox(height: 10),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            controller: registrationController,
                            decoration: InputDecoration(
                                labelText: 'Enter your Registration Number',
                                filled: true,
                                fillColor: Colors.white,
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                helperStyle: const TextStyle(
                                    fontFamily: 'Sora', fontSize: 14),
                                hintStyle: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.normal),
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
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('Mobile Number',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Sora',
                            color: Colors.black)),
                    SizedBox(height: 10),
                    TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Enter your Mobile Number',
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle: const TextStyle(
                                fontFamily: 'Sora', fontSize: 14),
                            hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.normal),
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
                                fontWeight: FontWeight.bold))),
                    SizedBox(height: 10),
                    Text('Select Bank',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Sora',
                            color: Colors.black)),
                    SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                          underline: const SizedBox(),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: dropdownvalue,
                          hint: Text('Select your Bank',
                              style: TextStyle(
                                  color: Styles.whitecustomlable,
                                  fontSize: 14)),
                          icon: InkWell(
                              child: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.black45)),
                          items: dropdownData.map((String item) {
                            return DropdownMenuItem(
                                value: item,
                                child: Text(item,
                                    style: const TextStyle(
                                        color: Color(0Xff413D4B),
                                        fontSize: 14)));
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
                    SizedBox(height: 10),
                    Text('Branch Name',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Sora',
                            color: Colors.black)),
                    SizedBox(height: 10),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        controller: Branchcontroller,
                        decoration: InputDecoration(
                            labelText: 'Enter your Branch Name',
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle: const TextStyle(
                                fontFamily: 'Sora', fontSize: 14),
                            hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.normal),
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
                                fontWeight: FontWeight.bold))),
                    SizedBox(height: 10),
                    Text('IBAN Number',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Sora',
                            color: Colors.black)),
                    SizedBox(height: 10),
                    TextFormField(
                        controller: accountNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Enter your IBAN Number',
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle: const TextStyle(
                                fontFamily: 'Sora', fontSize: 14),
                            hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.normal),
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
                                fontWeight: FontWeight.bold))),
                    SizedBox(height: 10),
                    Text('Enter SWIFT Code',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Sora',
                            color: Colors.black)),
                    SizedBox(height: 10),
                    TextFormField(
                        controller: swiftCodeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Enter Swift code of your Bank',
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle: const TextStyle(
                                fontFamily: 'Sora', fontSize: 14),
                            hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.normal),
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
                                fontWeight: FontWeight.bold))),
                    SizedBox(height: 10),
                    CheckboxListTile(
                      title: const Text('Is your payee a business licensed in the Philippines?'),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      autofocus: false,
                      activeColor: HexColor('#004751'),
                      checkColor: Colors.white,
                      selected: isBusiness,
                      value: isBusiness,
                      onChanged: (bool? value) {
                        setState(() {
                          isBusiness = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          : Responsive.isDesktop(context)
              ? Row(children: [
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
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Row(
                            
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back,
                                    color: Colors.black, size: 30),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width / 4 ,),
                              Text('Onboard Payee',
                                  style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Sora',
                                              fontWeight: FontWeight.bold,
                                              color: HexColor('#004751'))),
                            ],
                          ),
                           SizedBox(height: 30,),
                          Column(
                            children: [onboardweb()],
                          ),
                        ],
                      ),
                    ),
                  )
                ])
              :Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                   // height: MediaQuery.of(context).size.height / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Image.asset("assets/applogo-02.png",
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 3)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Row(
                            
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back,
                                    color: Colors.black, size: 30),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width / 6,),
                              Text('Onboard Payee',
                                  style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Sora',
                                              fontWeight: FontWeight.bold,
                                              color: HexColor('#004751'))),
                            ],
                          ),
                           SizedBox(height: 30,),
                          Column(
                            children: [onboardweb()],
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
      bottomNavigationBar: Responsive.isMobile(context)
          ? AuthButton(
              onTap: () {},
              text: 'Add and Proceed',
              decoration: BoxDecoration(color: HexColor('#CEE812')))
          : null,
    );
  }

  Widget onboardweb() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(width:Responsive.isDesktop(context) ?MediaQuery.of(context).size.width/4.8:
            MediaQuery.of(context).size.width/8,),
            Text('Payee’s Name',
                style: TextStyle(
                    fontSize: 16, fontFamily: 'Sora', color: Colors.black)),
          ],
        ),
        SizedBox(height: 10),
        Container(
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 4
              : MediaQuery.of(context).size.width / 2.5,
          child: TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hoverColor: Colors.transparent,
                  labelText: 'Enter your Name',
                  filled: true,
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  helperStyle:
                      const TextStyle(fontFamily: 'Sora', fontSize: 14),
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.normal),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  focusColor: Colors.grey.shade300,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0)),
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
                      fontWeight: FontWeight.bold))),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            SizedBox(width:Responsive.isDesktop(context) ?MediaQuery.of(context).size.width/4.8:
            MediaQuery.of(context).size.width/8,),
            Text('Payee’s Email',
                style: TextStyle(
                    fontSize: 16, fontFamily: 'Sora', color: Colors.black)),
          ],
        ),
        SizedBox(height: 10),
        Container(
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 4
              : MediaQuery.of(context).size.width / 2.5,
          child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                 hoverColor: Colors.transparent,
                  labelText: 'Enter your Email Address',
                  filled: true,
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  helperStyle:
                      const TextStyle(fontFamily: 'Sora', fontSize: 14),
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.normal),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  focusColor: Colors.grey.shade300,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0)),
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
                      fontWeight: FontWeight.bold))),
        ),
        if(isBusiness)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                    SizedBox(width:Responsive.isDesktop(context) ?MediaQuery.of(context).size.width/4.8:
            MediaQuery.of(context).size.width/8,),
                  Text('Business Reg Number',
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'Sora', color: Colors.black)),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 4
                    : MediaQuery.of(context).size.width / 2.5,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: registrationController,
                    decoration: InputDecoration(
                        hoverColor: Colors.transparent,
                        labelText: 'Enter your Registration Number',
                        filled: true,
                        fillColor: Colors.white,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        helperStyle:
                        const TextStyle(fontFamily: 'Sora', fontSize: 14),
                        hintStyle: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.normal),
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        focusColor: Colors.grey.shade300,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0)),
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
                            fontWeight: FontWeight.bold))),
              ),
            ],
          ),
        SizedBox(height: 10),
        Row(
          children: [
              SizedBox(width:Responsive.isDesktop(context) ?MediaQuery.of(context).size.width/4.8:
            MediaQuery.of(context).size.width/8,),
            Text('Mobile Number',
                style: TextStyle(
                    fontSize: 16, fontFamily: 'Sora', color: Colors.black)),
          ],
        ),
        SizedBox(height: 10),
        Container(
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 4
              : MediaQuery.of(context).size.width / 2.5,
          child: TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                 hoverColor: Colors.transparent,
                  labelText: 'Enter your Mobile Number',
                  filled: true,
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  helperStyle:
                      const TextStyle(fontFamily: 'Sora', fontSize: 14),
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.normal),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  focusColor: Colors.grey.shade300,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0)),
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
                      fontWeight: FontWeight.bold))),
        ),
        SizedBox(height: 10),
        Row(
          children: [
              SizedBox(width:Responsive.isDesktop(context) ?MediaQuery.of(context).size.width/4.8:
            MediaQuery.of(context).size.width/8,),
            Text('Select Bank',
                style: TextStyle(
                    fontSize: 16, fontFamily: 'Sora', color: Colors.black)),
          ],
        ),
        SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 4
              : MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 15,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButton(
              underline: const SizedBox(),
              dropdownColor: Colors.white,
              isExpanded: true,
              value: dropdownvalue,
              hint: Text('Select your Bank',
                  style:
                      TextStyle(color: Styles.whitecustomlable, fontSize: 14)),
              icon: InkWell(
                  child:
                      Icon(Icons.keyboard_arrow_down, color: Colors.black45)),
              items: dropdownData.map((String item) {
                return DropdownMenuItem(
                    value: item,
                    child: Text(item,
                        style: const TextStyle(
                            color: Color(0Xff413D4B), fontSize: 14)));
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
        SizedBox(height: 10),
        Row(
          children: [
              SizedBox(width:Responsive.isDesktop(context) ?MediaQuery.of(context).size.width/4.8:
            MediaQuery.of(context).size.width/8,),
            Text('Branch Name',
                style: TextStyle(
                    fontSize: 16, fontFamily: 'Sora', color: Colors.black)),
          ],
        ),
         SizedBox(height: 10),
        Container(
            width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 4
              : MediaQuery.of(context).size.width / 2.5,
          child: TextFormField(
              keyboardType: TextInputType.number,
              controller: Branchcontroller,
              decoration: InputDecoration(
                  labelText: 'Enter your Branch Name',
                  filled: true,
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  helperStyle: const TextStyle(
                      fontFamily: 'Sora', fontSize: 14),
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.normal),
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
                      fontWeight: FontWeight.bold))),
        ),
        SizedBox(height: 10),
        Row(
          children: [
               SizedBox(width:Responsive.isDesktop(context) ?MediaQuery.of(context).size.width/4.8:
            MediaQuery.of(context).size.width/8,),
            Text('IBAN Number',
                style: TextStyle(
                    fontSize: 16, fontFamily: 'Sora', color: Colors.black)),
          ],
        ),
        SizedBox(height: 10),
        Container(
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 4
              : MediaQuery.of(context).size.width / 2.5,
          child: TextFormField(
            //accno==ibanno
              controller: accountNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                 hoverColor: Colors.transparent,
                  labelText: 'Enter your IBAN Number',
                  filled: true,
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  helperStyle:
                      const TextStyle(fontFamily: 'Sora', fontSize: 14),
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.normal),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  focusColor: Colors.grey.shade300,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0)),
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
                      fontWeight: FontWeight.bold))),
        ),
        SizedBox(height: 10),
        Row(
          children: [
               SizedBox(width:Responsive.isDesktop(context) ?MediaQuery.of(context).size.width/4.8:
            MediaQuery.of(context).size.width/8,),
            Text('Enter SWIFT Code',
                style: TextStyle(
                    fontSize: 16, fontFamily: 'Sora', color: Colors.black)),
          ],
        ),
        SizedBox(height: 10),
        Container(
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 4
              : MediaQuery.of(context).size.width / 2.5,
          child: TextFormField(
              controller: swiftCodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                 hoverColor: Colors.transparent,
                  labelText: 'Enter Swift code of your Bank',
                  filled: true,
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  helperStyle:
                      const TextStyle(fontFamily: 'Sora', fontSize: 14),
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.normal),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  focusColor: Colors.grey.shade300,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0)),
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
                      fontWeight: FontWeight.bold))),
        ),
        SizedBox(height: 10),
          // SizedBox(width:Responsive.isDesktop(context) ?MediaQuery.of(context).size.width/4.8:
          //   MediaQuery.of(context).size.width/8,),
        Container(
          width:Responsive.isDesktop(context) ?MediaQuery.of(context).size.width/3.8:
            MediaQuery.of(context).size.width/2.2,
          child: CheckboxListTile(
            title: const Text('Is your payee a business licensed in the Philippines?'),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            autofocus: false,
            activeColor: HexColor('#004751'),
            checkColor: Colors.white,
            selected: isBusiness,
            value: isBusiness,
            onChanged: (bool? value) {
              setState(() {
                isBusiness = value!;
              });
            },
          ),
        ),
        Container(
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 4
              : MediaQuery.of(context).size.width / 2.5,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              width: Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width / 1
                  : Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 4.4
                      : MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(color: HexColor('#CEE812')),
              child: Center(
                child: Text(
                  "Add And Proceed",
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#004751'),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
