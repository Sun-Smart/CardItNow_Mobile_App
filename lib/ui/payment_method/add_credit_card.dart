
import 'package:cardit/const/common/fourDigitsplit.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/stepper.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../api/card_api.dart';
import '../../api/regster_api.dart';
import '../../const/common/card_type_finder.dart';
import '../../const/responsive.dart';
import 'card_input_formatter_class.dart';

class AddCreditCardPage extends StatefulWidget {
  final cardflow;
  var pages;
   AddCreditCardPage({Key? key, this.cardflow,this.pages}) : super(key: key);

  @override
  State<AddCreditCardPage> createState() => _AddCreditCardPageState();
}

class _AddCreditCardPageState extends State<AddCreditCardPage> {
  final creditCardController = new TextEditingController();
  final validityController = new TextEditingController();
  final cvvController = new TextEditingController();
  final nameOnCardController = new TextEditingController();
  final bankNameController = new TextEditingController();
  final addNickController = new TextEditingController();

  final RegisterAPI con = Get.find();
  final CardAPI cardcons = Get.put(CardAPI());
  final formKey = GlobalKey<FormState>();

  late FocusNode _focusNode;
  String cardNumber = '';
  bool showBack = false;

  var changeNumber = '';
  var cardType = '';

  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  //Scan Card Query
  CardDetails? _cardDetails;
  CardScanOptions scanOptions = CardScanOptions(
      scanExpiryDate: true,
      scanCardHolderName: true,
      considerPastDatesInExpiryDateScan: true,
      cardScannerTimeOut: 5);

  Future<void> scanCard() async {
    final CardDetails? cardDetails =
        await CardScanner.scanCard(scanOptions: scanOptions);
    if (!mounted || cardDetails == null) return;
    setState(() {
      _cardDetails = cardDetails;
    });

    print(
        ' %%%%%%%%%%%%%%%%%%%%%%%%    ${_cardDetails?.cardNumber == creditCardController.text}     %%%%%%%%%%%%%%%%%%%%%%%% ');
    print(
        ' %%%%%%%%%%%%%%%%%%%%%%%%    ${_cardDetails?.cardHolderName == nameOnCardController.text}     %%%%%%%%%%%%%%%%%%%%%%%% ');
    print(
        ' %%%%%%%%%%%%%%%%%%%%%%%%    ${_cardDetails?.expiryDate == validityController.text}     %%%%%%%%%%%%%%%%%%%%%%%% ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: Responsive.isMobile(context)
          ? AppBar(
              foregroundColor: Colors.black,
              backgroundColor: Colors.transparent,
              actions: [
                Row(children: [
                ])
              ],
            )
          : null,
      body: Responsive.isMobile(context)
          ?SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add Credit Card',
                    style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.bold,
                        color: HexColor('#004751'))),
                SizedBox(height: 30),
                Text('Card Number',
                    style: TextStyle(
                        color: HexColor('#041316'),
                        fontFamily: 'Sora',fontWeight: FontWeight.bold,
                        fontSize: 16)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0),
                      borderRadius: BorderRadius.circular(5)),
                  child: Stack(
                    children: [
                      TextFormField(
                          keyboardType: TextInputType.number,
                          controller: creditCardController,
                          validator: (value) {
                            if (creditCardController.text.isEmpty) {
                              return 'Enter Card Number';
                            } else {}
                          },
                          onChanged: (v) {
                            setState(() {
                              changeNumber = v;
                              cardType = cardTypeFunction(v);
                              print(cardType);
                            });
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CustomInputFormatter()
                          ],
                          decoration: InputDecoration(
                              labelText: '4XXX 5XXX 7XXX 3XXX',
                              filled: true,
                              suffix: Text(cardType),
                              fillColor: Colors.white,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
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
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Validity',
                            style: TextStyle(
                                color: HexColor('#041316'),
                                fontFamily: 'Sora',fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                              CardMonthFormatter()
                            ],
                            validator: (value) {
                              if (validityController.text.isEmpty) {
                                return 'Enter Validity';
                              } else {}
                            },
                            controller: validityController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'mm/yy',
                                filled: true,
                                fillColor: Colors.white,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
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
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,

                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text('Bank Name',
                    style: TextStyle(
                        color: HexColor('#041316'),
                        fontFamily: 'Sora',fontWeight: FontWeight.bold,
                        fontSize: 16)),
                SizedBox(height: 10),
                TextFormField(
                    controller: bankNameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (bankNameController.text.isEmpty) {
                        return 'Enter Bank Name';
                      } else {}
                    },
                    decoration: InputDecoration(
                        labelText: 'Enter your bank name',
                        filled: true,
                        fillColor: Colors.white,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        helperStyle:
                            const TextStyle(fontFamily: 'Sora', fontSize: 14),
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
                            borderSide: const BorderSide(color: Colors.grey)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: Colors.grey)),
                        errorStyle: const TextStyle(
                            fontFamily: 'Sora',
                            fontSize: 13,
                            fontWeight: FontWeight.bold))),

              ],
            ),
          ),
        ),
      ):Responsive.isDesktop(context)
              ? Row(
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
                        child: Column(
                          children: [
                            appbarweb(),
                            cardtextfieldweb(),
                          ],
                        )),
                  ],
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
                        child: Column(
                          children: [
                           appbarweb(),
                            cardtextfieldweb(),
                          ],
                        )),
                  ],
                ),
      bottomNavigationBar: Responsive.isMobile(context)
          ? AuthButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  cardcons.creditCardPostAPI(
                      creditCardController.text.toString(),
                      validityController.text.toString(),
                      cvvController.text.toString(),
                      cardType,
                      bankNameController.text.toString(),
                      addNickController.text.toString(),
                      widget.cardflow);
                }
              },
              text: 'Verify and Proceed',
              decoration: BoxDecoration(color: HexColor('#CEE812')))
          : null,
    );
  }
  
  //for web.......(text field- add card)
  Widget cardtextfieldweb() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Text('Add Credit Card',
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
                      : MediaQuery.of(context).size.width / 7.7),
              Text('Card Number',
                  style: TextStyle(
                      color: HexColor('#041316'),
                      fontFamily: 'Sora',
                      fontSize: 16)),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width / 4
                : MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0),
                borderRadius: BorderRadius.circular(5)),
            child: Stack(
                    children: [
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: creditCardController,
                          validator: (value) {
                            if (creditCardController.text.isEmpty) {
                              return 'Enter Card Number';
                            } else {}
                          },
                          onChanged: (v) {
                            setState(() {
                              changeNumber = v;
                              cardType = cardTypeFunction(v);
                              print(cardType);
                            });
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CustomInputFormatter()
                          ],
                          decoration: InputDecoration(
                              labelText: '4XXX 5XXX 7XXX 3XXX',
                              filled: true,
                              suffix: Text(cardType),
                              fillColor: Colors.white,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
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
                ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 4.8
                          : MediaQuery.of(context).size.width / 7.7),
                  Text('Validity',
                      style: TextStyle(
                          color: HexColor('#041316'),
                          fontFamily: 'Sora',
                          fontSize: 16)),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 4
                    : MediaQuery.of(context).size.width / 2.5,
                child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                              CardMonthFormatter()
                            ],
                            validator: (value) {
                              if (validityController.text.isEmpty) {
                                return 'Enter Validity';
                              } else {}
                            },
                            controller: validityController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hoverColor: Colors.transparent,
                                labelText: 'mm/yy',
                                filled: true,
                                fillColor: Colors.white,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
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
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                  width: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 4.8
                      : MediaQuery.of(context).size.width / 7.7),
              Text('Bank Name',
                  style: TextStyle(
                      color: HexColor('#041316'),
                      fontFamily: 'Sora',
                      fontSize: 16)),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width / 4
                : MediaQuery.of(context).size.width / 2.5,
            child: TextFormField(
                controller: bankNameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (bankNameController.text.isEmpty) {
                    return 'Enter Bank Name';
                  } else {}
                },
                decoration: InputDecoration(
                    hoverColor: Colors.transparent,
                    labelText: 'Enter your bank name',
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
           SizedBox(height: 30),
          GestureDetector(
             onTap: () {
                if (formKey.currentState!.validate()) {
                  cardcons.creditCardPostAPI(
                      creditCardController.text.toString(),
                      validityController.text.toString(),
                      cvvController.text.toString(),
                      cardType,
                      bankNameController.text.toString(),
                      addNickController.text.toString(),
                      widget.cardflow);
                }
              },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width / 4.4
                  : MediaQuery.of(context).size.width / 2.8,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(color: HexColor('#CEE812')),
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
    );
  }

  Widget appbarweb() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      // Row(
      //   children: [
      //     Image.asset('assets/card/scan.png', width: 18, height: 18),
      //     TextButton(
      //         onPressed: () {
      //           scanCard();
      //         },
      //         child: Text('Scan Card',
      //             style: TextStyle(
      //                 fontFamily: 'Sora', fontSize: 14, color: Colors.black)))
      //   ],
      // ),
    ]);
  }
}
