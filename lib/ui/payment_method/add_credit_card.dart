import 'package:cardit/auth/auth.dart';
import 'package:cardit/auth/cardapi.dart';
import 'package:cardit/const/common/fourDigitsplit.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../responsive/responsive.dart';
import 'card_input_formatter_class.dart';

class AddCreditCardPage extends StatefulWidget {
  const AddCreditCardPage({Key? key}) : super(key: key);

  @override
  State<AddCreditCardPage> createState() => _AddCreditCardPageState();
}

class _AddCreditCardPageState extends State<AddCreditCardPage> {
  final creditCardController = new TextEditingController();
  final validityController = new TextEditingController();
  var controller = new MaskedTextController(mask: '0 0 0 0');
  final cvvController = new TextEditingController();
  final nameOnCardController = new TextEditingController();
  final bankNameController = new TextEditingController();
  final addNickController = new TextEditingController();

  final AuthCon con = Get.find();
  final cardsapi cardcons = Get.put(cardsapi());
  final formKey = GlobalKey<FormState>();

  late FocusNode _focusNode;
  String cardNumber = '';
  bool showBack = false;

  var changeNumber = '';

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
                  Image.asset('assets/card/scan.png', width: 18, height: 18),
                  TextButton(
                      onPressed: () {
                        scanCard();
                      },
                      child: Text('Scan Card',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: Colors.black)))
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
                SizedBox(height: 20),
                Text('Card Number',
                    style: TextStyle(
                        color: HexColor('#041316'),
                        fontFamily: 'Sora',
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
                            changeNumber = v;
                            print(changeNumber);
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CustomInputFormatter()
                          ],
                          decoration: InputDecoration(
                              labelText: '4XXX 5XXX 7XXX 3XXX',
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
                                  fontWeight: FontWeight.bold))),
                      // Positioned(
                      //     child: Image.asset('assets/visa.png',
                      //         width: 40, height: 35),
                      //     right: 10,
                      //     top: 5)
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Validity',
                            style: TextStyle(
                                color: HexColor('#041316'),
                                fontFamily: 'Sora',
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
                        // Text('CVV',
                        //     style: TextStyle(
                        //         color: HexColor('#041316'),
                        //         fontFamily: 'Sora',
                        //         fontSize: 16)),
                        // SizedBox(height: 10),
                        SizedBox(
                          width: 150,
                          // child: TextFormField(
                          //   obscuringCharacter: '*',
                          //   obscureText: true,
                          //   keyboardType: TextInputType.number,
                          //   controller: cvvController,
                          //   validator: (value) {
                          //     if (cvvController.text.isEmpty) {
                          //       return 'Enter CVV';
                          //     } else {}
                          //   },
                          //   inputFormatters: [
                          //     FilteringTextInputFormatter.digitsOnly,
                          //     LengthLimitingTextInputFormatter(3)
                          //   ],
                          //   decoration: InputDecoration(
                          //       labelText: 'XXX',
                          //       filled: true,
                          //       fillColor: Colors.white,
                          //       floatingLabelBehavior:
                          //           FloatingLabelBehavior.never,
                          //       helperStyle: const TextStyle(
                          //           fontFamily: 'Sora', fontSize: 14),
                          //       hintStyle: const TextStyle(
                          //           fontSize: 12,
                          //           fontFamily: 'Sora',
                          //           fontWeight: FontWeight.normal),
                          //       contentPadding: const EdgeInsets.symmetric(
                          //           vertical: 15, horizontal: 15),
                          //       focusColor: Colors.grey.shade300,
                          //       border: const OutlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.grey)),
                          //       focusedBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(4),
                          //           borderSide: const BorderSide(
                          //               color: Colors.grey, width: 1.0)),
                          //       enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(4),
                          //           borderSide: const BorderSide(
                          //               color: Colors.grey, width: 1.0)),
                          //       focusedErrorBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(4),
                          //           gapPadding: 7,
                          //           borderSide:
                          //               const BorderSide(color: Colors.grey)),
                          //       errorBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(4),
                          //           borderSide:
                          //               const BorderSide(color: Colors.grey)),
                          //       errorStyle: const TextStyle(
                          //           fontFamily: 'Sora',
                          //           fontSize: 13,
                          //           fontWeight: FontWeight.bold)),
                          // ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text('Name On Card',
                    style: TextStyle(
                        color: HexColor('#041316'),
                        fontFamily: 'Sora',
                        fontSize: 16)),
                SizedBox(height: 10),
                TextFormField(
                    controller: nameOnCardController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (nameOnCardController.text.isEmpty) {
                        return 'Enter Card Holder Name';
                      } else {}
                    },
                    decoration: InputDecoration(
                        labelText: 'Enter your name',
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
                SizedBox(height: 10),
                Text('Bank Name',
                    style: TextStyle(
                        color: HexColor('#041316'),
                        fontFamily: 'Sora',
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
                SizedBox(height: 10),
                Text('Add Nick Name',
                    style: TextStyle(
                        color: HexColor('#041316'),
                        fontFamily: 'Sora',
                        fontSize: 16)),
                SizedBox(height: 10),
                TextFormField(
                    keyboardType: TextInputType.name,
                    controller: addNickController,
                    validator: (value) {
                      if (addNickController.text.isEmpty) {
                        return 'Enter Nick Name';
                      } else {}
                    },
                    decoration: InputDecoration(
                        labelText: 'Add nickname for your card',
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
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ):Responsive.isDesktop(context)
              ? Row(
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
                          child: Column(
                            children: [
                              appbarweb(),
                              cardtextfieldweb(),
                            ],
                          ),
                        )),
                  ],
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
                          child: Column(
                            children: [
                              appbarweb(),
                              cardtextfieldweb(),
                            ],
                          ),
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
                      nameOnCardController.text.toString(),
                      bankNameController.text.toString(),
                      addNickController.text.toString());
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
                      changeNumber = v;
                      print(changeNumber);
                    },
                   inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CustomInputFormatter()
                          ],
                    decoration: InputDecoration(
                      hoverColor: Colors.transparent,
                        labelText: '4XXX 5XXX 7XXX 3XXX',
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
                // Positioned(
                //     child: Image.asset('assets/visa.png', width: 40, height: 35),
                //     right: 10,
                //     top: 5)
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
              Text('Name On Card',
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
                controller: nameOnCardController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (nameOnCardController.text.isEmpty) {
                    return 'Enter Card Holder Name';
                  } else {}
                },
                decoration: InputDecoration(
                    hoverColor: Colors.transparent,
                    labelText: 'Enter your name',
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
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                  width: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 4.8
                      : MediaQuery.of(context).size.width / 7.7),
              Text('Add Nick Name',
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
                keyboardType: TextInputType.name,
                controller: addNickController,
                validator: (value) {
                  if (addNickController.text.isEmpty) {
                    return 'Enter Nick Name';
                  } else {}
                },
                decoration: InputDecoration(
                    hoverColor: Colors.transparent,
                    labelText: 'Add nickname for your card',
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
                    nameOnCardController.text.toString(),
                    bankNameController.text.toString(),
                    addNickController.text.toString());
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
      Row(
        children: [
          Image.asset('assets/card/scan.png', width: 18, height: 18),
          TextButton(
              onPressed: () {
                scanCard();
              },
              child: Text('Scan Card',
                  style: TextStyle(
                      fontFamily: 'Sora', fontSize: 14, color: Colors.black)))
        ],
      ),
    ]);
  }
}
