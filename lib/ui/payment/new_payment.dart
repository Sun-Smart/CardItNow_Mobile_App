import 'package:cardit/ui/payment/purpose_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../api/payment_api.dart';
import '../../const/responsive.dart';
import '../../themes/styles.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';
import '../payment_method/card_input_formatter_class.dart';

// ignore: must_be_immutable
class NewPayment extends StatefulWidget {
  var paymentType;
  var payee;
  NewPayment({Key? key, this.paymentType,this.payee}) : super(key: key);

  @override
  State<NewPayment> createState() => _NewPaymentState();
}

class _NewPaymentState extends State<NewPayment> {
  final PaymentAPI pay = Get.put(PaymentAPI());
  bool isVerify = false;

  titleText(){
    return Text(
      widget.paymentType == "LGU" ? "LGU" :
      widget.payee != null ? '${widget.payee["name"]}' : 'New Payee',
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
          bottomNavigationBar: Responsive.isMobile(context) ? firstButtonNext() : null,
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
              height: MediaQuery.of(context).size.height / 1,
              color: Color(0XFF004751),
              child: Center(
                  child: Image.asset("assets/applogo-02.png",
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 3)),
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
                    firstFormWidget(),
                  ],
                ),
              ),
            )
          ])
              : Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                color: Color(0XFF004751),
                child: Center(
                    child: Image.asset("assets/applogo-02.png",
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 3)),
              ),
              SizedBox(
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
        ? filedWidget()
        : Responsive.isDesktop(context)
        ? SizedBox(
        width:MediaQuery.of(context).size.width / 4,
      child: filedWidget(),
    )
        : SizedBox(
        width:
        MediaQuery.of(context).size.width / 11,
      child: filedWidget(),

    );
  }

  filedWidget(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: const Text('Select Purpose *',
                    style: TextStyle(fontFamily: 'Sora', fontSize: 14,fontWeight: FontWeight.bold),)),
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
                                color: Color(0Xff413D4B),
                                fontSize: 14)),
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
                  child: const Text('Select Sub Purpose *',
                    style: TextStyle(fontFamily: 'Sora', fontSize: 14,fontWeight: FontWeight.bold),)),
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
                                color: Color(0Xff413D4B),
                                fontSize: 14)),
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
            inputDecoration: Styles.textFiledDecoration(hint: "Property Owner Name"),
            enabled: true,
          ),
          const SizedBox(height: 10),
          MyCustomInputBox(
            label: "House/Apt/Office No *",
            controller: pay.addressNoCnl,
            obsecureText: false,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            inputDecoration: Styles.textFiledDecoration(hint: "House/Apt/Office No"),
            enabled: true,
          ),
          const SizedBox(height: 10),
          MyCustomInputBox(
            label: "Street Name *",
            controller: pay.streetNameCnl,
            obsecureText: false,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            inputDecoration: Styles.textFiledDecoration(hint: "Street Name"),
            enabled: true,
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: const Text('Select Province *',
                    style: TextStyle(fontFamily: 'Sora', fontSize: 14,fontWeight: FontWeight.bold),)),
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
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: const Text('Select City *',
                    style: TextStyle(fontFamily: 'Sora', fontSize: 14,fontWeight: FontWeight.bold),)),
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
            inputFormatters:  <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            inputDecoration: Styles.textFiledDecoration(hint: "Postal Code"),
            enabled: true,
          ),
          const SizedBox(height: 10),
          MyCustomInputBox(
            label: "Start Date *",
            controller: pay.startDate,
            obsecureText: false,
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            inputFormatters:  [
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
            inputFormatters:  [
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
          if(!Responsive.isMobile(context))
          firstButtonNext()
        ]);
  }


  Widget filePickWidget() {
    return isVerify ? Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text('Upload Contract/Invoice *',
                style: TextStyle(fontFamily: 'Sora', fontSize: 14,fontWeight: FontWeight.bold))),
        const SizedBox(height: 5),
        Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width / 1
                : Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width / 4.5
                : MediaQuery.of(context).size.width / 2.5,
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0XffB7C5C7), width: 1.5),
                borderRadius: const BorderRadius.all(Radius.circular(3))),
            child: InkWell(
              onTap: () async {
                // getImage(
                //     ImageSource
                //         .gallery);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.arrow_upward_sharp),
                   SizedBox(height: 5),
                   Text('Upload Document'),
                ],
              ),
            ),
          ),
        const Text('Specify file format (jpg, png, pdf and max file size of 2 MB).', style: TextStyle(fontSize: 10),),
      ],
    ) : Container();
    }

  Widget firstButtonNext() {
    return AuthButton(
      onTap: () {
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
          }  else if (pay.postalCode.text.isEmpty) {
            Fluttertoast.showToast(msg: "Please Enter Postal Code");
          }else {
            if(!isVerify) {
              pay.newPaymentVerificationAPI().then((value) {
                if (value == "Success") {
                  setState(() {
                    isVerify = true;
                  });
                }
              });
            } else{
              pay.newPaymentDocumentAPI();
            }
          }
      },
      text: "Next",
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
