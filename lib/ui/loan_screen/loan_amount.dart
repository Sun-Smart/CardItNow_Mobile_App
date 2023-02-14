import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/ui/loan_screen/verify_bank_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/auth_button.dart';

class LoanAmount extends StatefulWidget {
  const LoanAmount({super.key});

  @override
  State<LoanAmount> createState() => _LoanAmountState();
}

class _LoanAmountState extends State<LoanAmount> {
  var item = ['Pay now', 'Schedule '];
  String? dropdownvalue;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Responsive.isMobile(context) ? bottombutton() : null,
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
                    'Enter Loan Amount',
                    style: TextStyle(
                        color: Color(0Xff1B1B1B),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          : null,
      body: Responsive.isMobile(context)
          ? Column(
              children: [user_mid()],
            )
          : Row(
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
                        'Enter Loan Amount',
                        style: TextStyle(
                            color: Color(0Xff1B1B1B),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 20,),
                      user_mid()
                    ],
                  ),
                )
              ],
            ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget user_mid() {
    return Responsive.isMobile(context)
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                child: Row(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      "assets/user-img.png",
                      fit: BoxFit.cover,
                      width: 50.0,
                      height: 50.0,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Paying Angelo",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sora"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "MID-23344565",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sora"),
                        )
                      ],
                    )
                  ],
                ),
              ),
              installment_plan()
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                child: Row(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      "assets/user-img.png",
                      fit: BoxFit.cover,
                      width: 50.0,
                      height: 50.0,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Paying Angelo",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sora"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "MID-23344565",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sora"),
                        )
                      ],
                    )
                  ],
                ),
              ),
              installment_plan()
            ],
          );
  }

  Widget installment_plan() {
    return Responsive.isMobile(context)
        ? Column(children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xFFE5E5E5), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(3))),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                  contentPadding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFFE5E5E5))),
                ),
                // underline:Container(),
                //  validator: (value)=>value==null?'field required':null,
                dropdownColor: Colors.white,
                isExpanded: true,
                value: dropdownvalue,
                hint: Text(
                  'Choose Installment Plan',
                  style: TextStyle(color: Color(0Xff413D4B), fontSize: 14),
                ),
                icon: InkWell(
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black45,
                  ),
                ),
                validator: (value) => value == null ? 'field required' : null,
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
            bulidForm()
          ])
        : Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width / 4
                  : MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xFFE5E5E5), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(3))),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  hoverColor: Colors.transparent,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                  contentPadding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFFE5E5E5))),
                ),
                // underline:Container(),
                //  validator: (value)=>value==null?'field required':null,
                dropdownColor: Colors.white,
                isExpanded: true,
                value: dropdownvalue,
                hint: Text(
                  'Choose Installment Plan',
                  style: TextStyle(color: Color(0Xff413D4B), fontSize: 14),
                ),
                icon: GestureDetector(
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black45,
                  ),
                ),
                validator: (value) => value == null ? 'field required' : null,
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
            bulidForm()
          ]);
  }

  Widget bulidForm() {
    //final themeChange = Provider.of<DarkThemeProvider>(context);
    return Responsive.isMobile(context)
        ? Container(
            child: Form(
                // key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                Container(
                    margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                    padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
                    child: TextFormField(
                      style: TextStyle(fontSize: 30),
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                      ),
                      //  OtpTextField(
                      //   //fieldWidth: 50,
                      //  // borderWidth: 1,
                      //   //numberOfFields: 4,
                      //  // borderColor: Color(0xFF512DA8),
                      //   textStyle: TextStyle(
                      //       fontSize: 35,
                      //       color:
                      //            HexColor('#1B1B1B')),
                      //   //set to true to show as box or false to show as dash
                      //  // showFieldAsBox: true,
                      //   //runs when a code is typed in
                      //   onCodeChanged: (String code) {
                      //     //handle validation or checks here
                      //   },
                      // )
                    )),
              ])))
        : Container(
            width: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width / 4
                : MediaQuery.of(context).size.width / 2,
            child: Form(
                // key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                      padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
                      child: TextFormField(
                        style: TextStyle(fontSize: 30),
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                        ),
                        //  OtpTextField(
                        //   //fieldWidth: 50,
                        //  // borderWidth: 1,
                        //   //numberOfFields: 4,
                        //  // borderColor: Color(0xFF512DA8),
                        //   textStyle: TextStyle(
                        //       fontSize: 35,
                        //       color:
                        //            HexColor('#1B1B1B')),
                        //   //set to true to show as box or false to show as dash
                        //  // showFieldAsBox: true,
                        //   //runs when a code is typed in
                        //   onCodeChanged: (String code) {
                        //     //handle validation or checks here
                        //   },
                        // )
                      )),
                      SizedBox(height: 70,),
                      GestureDetector(
      onTap: (){
        Get.to(BankDetails());
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
           "Done",
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

  Widget bottombutton() {
    return AuthButton(
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
            // '/registerloading',
            '/bankdetails');

        // showAlertDialog(context);
      },
      text: "Done",
    );
  }
}
