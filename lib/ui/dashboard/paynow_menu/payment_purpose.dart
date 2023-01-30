import 'package:cardit/ui/dashboard/paynow_menu/payment_overview_dashboard.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../auth/auth.dart';

class PaymentPurpose extends StatefulWidget {
  const PaymentPurpose({super.key});

  @override
  State<PaymentPurpose> createState() => _PaymentPurposeState();
}

class _PaymentPurposeState extends State<PaymentPurpose> {
  //var item = ['Goods/or Services', 'Rental'];
  String? dropdownvalue;
  TextEditingController _controller = TextEditingController();
  
  final AuthCon con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bulildbutton(),
      appBar: PreferredSize(
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
      ),
      body: Column(
        children: [selectPurpose()],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget selectPurpose() {
    return Padding(
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
    );
  }

  Widget installment_plan() {
    return Column(children: [
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
                borderSide: BorderSide(width: 1, color: HexColor('#E5E5E5'))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: HexColor('#E5E5E5'))),
            contentPadding: EdgeInsets.fromLTRB(15, 12, 15, 12),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: HexColor('#E5E5E5'))),
          ),
          // underline:Container(),
          //  validator: (value)=>value==null?'field required':null,
          dropdownColor: Colors.white,
          isExpanded: true,
          value: dropdownvalue,
          hint: Text(
            'Select your purpose',
            style: TextStyle( fontSize: 14,
            fontWeight: FontWeight.w400),
          ),
          icon: InkWell(
            child: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black45,
            ),
          ),
          validator: (value) => value == null ? 'field required' : null,
          items: con.paymentpurposelist.map(( item) {
            return DropdownMenuItem(
              value: item["purpose"].toString(),
              child: Text(item["purpose"].toString(),
                  style:
                      const TextStyle(color: Color(0Xff413D4B), fontSize: 14)),
            );
          }).toList(),
          onChanged: ( newValue) {
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
    return Container(
        child: Form(
            // key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Row(
            children: [
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
                    borderSide: BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                hintText: "Add your purpose manually if not listed above",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Color(0xFFE5E5E5))),
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
        ])));
  }

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
       Get.to(OverviewPayment()) ;
        // Navigator.of(context).pushNamed(
        // '/registerloading',
        //  '/bankdetails'
        // );

        // showAlertDialog(context);
      },
      text: "Proceed To Pay",
    );
  }
}