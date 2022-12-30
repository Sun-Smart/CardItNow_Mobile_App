import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/auth_button.dart';

class LoanAmount extends StatefulWidget {
  const LoanAmount({super.key});

  @override
  State<LoanAmount> createState() => _LoanAmountState();
}

class _LoanAmountState extends State<LoanAmount> {
   var item = [
    'Pay now',
    'Schedule '
    
  ];
  String? dropdownvalue;
  TextEditingController _controller=TextEditingController();
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
                color:Colors.black,
              ),
              centerTitle: true,
              title: Text(
                'Enter Loan Amount',
                style: TextStyle(
                    color: 
                         Color(0Xff1B1B1B),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              
            ),
            
            ),
            
      ),
      body: Column(
        children: [
user_mid()
        ],
      ),
    );
  }
  // ignore: non_constant_identifier_names
  Widget user_mid(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10,left: 10,top: 10),
          child: Row(
            children: [
              ClipOval(
            child: Image.asset("assets/user-img.png",
            fit: BoxFit.cover,
            width: 50.0,
            height: 50.0,
            )
            ),
            SizedBox(width: 10,),
             Column(
             // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Paying Angelo",
                 style: TextStyle(
                   fontSize: 14,
                   color: Colors.black,
                   fontWeight: FontWeight.w500,
                   fontFamily: "Sora"
                 ),),
                 SizedBox(height: 10,),
                 Text("MID-23344565",
                  style: TextStyle(
                   fontSize: 14,
                   color: Colors.black,
                   fontWeight: FontWeight.w500,
                   fontFamily: "Sora"
                 ),)
               ],
             )
            ],
          ),
        ),
   installment_plan()
       
      ],
    );
  }

  Widget installment_plan(){
    return    Column(
      children: [
        SizedBox(height: 20,),
       
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color:Color(0xFFE5E5E5)  , width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3))),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color:Color(0xFFE5E5E5))) ,
                                enabledBorder:  OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color:Color(0xFFE5E5E5))),
                        contentPadding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color:Color(0xFFE5E5E5))),
                      ),
                      // underline:Container(),
                      //  validator: (value)=>value==null?'field required':null,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      value: dropdownvalue,
                      hint: Text(
                        'Choose Installment Plan',
                        style:
                            TextStyle(color: Color(0Xff413D4B), fontSize: 14),
                      ),
                      icon: InkWell(
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black45,
                        ),
                      ),
                      validator: (value) =>
                          value == null ? 'field required' : null,
                      items: item.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item,
                              style: const TextStyle(
                                  color: Color(0Xff413D4B) , fontSize: 14)),
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
    return Container(
        child: Form(
           // key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 50,right: 50,top: 10),
                      padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
                      child:TextFormField(
                        style: TextStyle(
                          fontSize: 30
                        ),
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
                ])));
  }

   Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
        // '/registerloading',
        '/bankdetails'
       );
      
       // showAlertDialog(context);
      },
      text: "Done",
    );
  }

}
