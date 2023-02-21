
import 'package:flutter/material.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({Key? key}) : super(key: key);

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  final formKey = GlobalKey<FormState>();

  final _holdernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Form(
                key: formKey,
                child: Column(

                    children: [
                      Row(
                        children: [

                          Text(
                            "Business Name",
                            style: TextStyle(
                              fontSize: 16,fontFamily: "Sora",fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(

                        child: TextFormField(
                          enabled: false,
                          //label: "First Name*",
                          controller: _holdernameController,
                          obscureText: false,
                          //inputHint: 'Enter your first name',
                          validator: (value) {
                          },
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter First Name',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle:
                            const TextStyle(fontFamily: 'Sora', fontSize: 15),
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            focusColor: Colors.black,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                gapPadding: 7,
                                borderSide: const BorderSide(color: Colors.black)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(color: Colors.black)),
                            errorStyle: const TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [

                          Text(
                            "Business Type ",
                            style: TextStyle(
                              fontSize: 16,fontWeight: FontWeight.bold,
                              fontFamily: "Sora"
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(

                        child: TextFormField(
                          enabled: false,
                          //label: "First Name*",
                          controller: _holdernameController,
                          obscureText: false,
                          //inputHint: 'Enter your first name',
                          validator: (value) {
                          },
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Business Type',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle:
                            const TextStyle(fontFamily: 'Sora', fontSize: 15),
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            focusColor: Colors.black,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                gapPadding: 7,
                                borderSide: const BorderSide(color: Colors.black)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(color: Colors.black)),
                            errorStyle: const TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      Row(
                        children: [

                          Text(
                            "Business Reg Number ",
                            style: TextStyle(
                                fontSize: 16,fontWeight: FontWeight.bold,
                                fontFamily: "Sora"
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(

                        child: TextFormField(
                          enabled: false,
                          //label: "First Name*",
                          controller: _holdernameController,
                          obscureText: false,
                          //inputHint: 'Enter your first name',
                          validator: (value) {
                          },
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Business Reg Number',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle:
                            const TextStyle(fontFamily: 'Sora', fontSize: 15),
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            focusColor: Colors.black,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                gapPadding: 7,
                                borderSide: const BorderSide(color: Colors.black)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(color: Colors.black)),
                            errorStyle: const TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [

                          Text(
                            "Your Bank ",
                            style: TextStyle(
                                fontSize: 16,fontWeight: FontWeight.bold,
                                fontFamily: "Sora"
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(

                        child: TextFormField(
                          enabled: false,
                          //label: "First Name*",
                          controller: _holdernameController,
                          obscureText: false,
                          //inputHint: 'Enter your first name',
                          validator: (value) {
                          },
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Your Bank Name',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle:
                            const TextStyle(fontFamily: 'Sora', fontSize: 15),
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            focusColor: Colors.black,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                gapPadding: 7,
                                borderSide: const BorderSide(color: Colors.black)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(color: Colors.black)),
                            errorStyle: const TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [

                          Text(
                            "Account Number ",
                            style: TextStyle(
                                fontSize: 16,fontWeight: FontWeight.bold,
                                fontFamily: "Sora"
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(

                        child: TextFormField(
                          enabled: false,
                          //label: "First Name*",
                          controller: _holdernameController,
                          obscureText: false,
                          //inputHint: 'Enter your first name',
                          validator: (value) {
                          },
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Account Number',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle:
                            const TextStyle(fontFamily: 'Sora', fontSize: 15),
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            focusColor: Colors.black,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                gapPadding: 7,
                                borderSide: const BorderSide(color: Colors.black)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(color: Colors.black)),
                            errorStyle: const TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),
                      Row(
                        children: [

                          Text(
                            "Swift Code ",
                            style: TextStyle(
                                fontSize: 16,fontWeight: FontWeight.bold,
                                fontFamily: "Sora"
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(

                        child: TextFormField(
                          enabled: false,
                          //label: "First Name*",
                          controller: _holdernameController,
                          obscureText: false,
                          //inputHint: 'Enter your first name',
                          validator: (value) {
                          },
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Your Swift Code',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle:
                            const TextStyle(fontFamily: 'Sora', fontSize: 15),
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            focusColor: Colors.black,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                gapPadding: 7,
                                borderSide: const BorderSide(color: Colors.black)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(color: Colors.black)),
                            errorStyle: const TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),
                      Row(
                        children: [

                          Text(
                            "Branch Address ",
                            style: TextStyle(
                                fontSize: 16,fontWeight: FontWeight.bold,
                                fontFamily: "Sora"
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(

                        child: TextFormField(
                          enabled: false,
                          //label: "First Name*",
                          controller: _holdernameController,
                          obscureText: false,
                          //inputHint: 'Enter your first name',
                          validator: (value) {
                          },
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Branch Address',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            helperStyle:
                            const TextStyle(fontFamily: 'Sora', fontSize: 15),
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            focusColor: Colors.black,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                gapPadding: 7,
                                borderSide: const BorderSide(color: Colors.black)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(color: Colors.black)),
                            errorStyle: const TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),




                    ])),
          ],
        ),
      ),
    );
  }
}
