// ignore_for_file: prefer_const_constructors

import 'package:cardit/const/responsive.dart';
import 'package:flutter/material.dart';

class MyCustomInputBox extends StatefulWidget {
  final String? label;
  final String? inputHint;
  final String? Function(String?)? validator;
  final bool? obsecureText;
  final InputDecoration? inputDecoration;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? enabled;
  final int? maxLength;
  final inputFormatters;
//
  final TextInputType? keyboardType;
  final Widget? Function(String?)? onChanged;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final int? maxLines;
  final bool? read;

  MyCustomInputBox(
      {Key? key,
      this.textInputType,
      this.inputFormatters,
      this.textInputAction,
      required this.controller,
      required this.enabled,
      required this.obsecureText,
      required this.inputDecoration,
      this.validator,
      this.onChanged,
      this.label,
      this.inputHint,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLines,
      this.maxLength,
      this.keyboardType, this.read})
      : super(key: key);
  @override
  _MyCustomInputBoxState createState() => _MyCustomInputBoxState();
}

class _MyCustomInputBoxState extends State<MyCustomInputBox> {
  bool isSubmitted = false;
  bool showpass = true;
  // bool _isObscure = false;
  final checkBoxIcon = 'assets/checkbox.svg';

  @override
  Widget build(BuildContext context) {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      crossAxisAlignment: Responsive.isMobile(context)
          ? CrossAxisAlignment.start
          : Responsive.isDesktop(context)
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.center,
      mainAxisAlignment: Responsive.isMobile(context)
          ? MainAxisAlignment.start
          : Responsive.isDesktop(context)
              ? MainAxisAlignment.center
              : MainAxisAlignment.center,
      children: [
        Align(
          alignment: Responsive.isMobile(context)
              ? Alignment.centerLeft
              : Responsive.isDesktop(context)
                  ? Alignment.centerLeft
                  : Alignment.centerLeft,
          child: Padding(
            padding: Responsive.isMobile(context)
                ? EdgeInsets.only(left: 16, bottom: 0)
                : Responsive.isDesktop(context)
                    ? EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 4.8)
                    : EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 10,
                         ),
            child: Text(
              widget.label ?? "",
              style: TextStyle(fontFamily: 'Sora', fontSize: 14,fontWeight: FontWeight.bold),
            ),
          ),
        ),
         SizedBox(height:Responsive.isMobile(context)?10: 10),
        Container(
          padding:  Responsive.isMobile(context)
              ? EdgeInsets.fromLTRB(15, 0, 15, 10):EdgeInsets.zero,
          alignment: Alignment.bottomCenter,
          width: Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width / 1
              : Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width / 4
                  : MediaQuery.of(context).size.width / 2.5,
          // height: MediaQuery.of(context).size.height * 0.070,

          child: TextFormField(
            inputFormatters: widget.inputFormatters,
            maxLength: widget.maxLength,
            keyboardType: widget.keyboardType,
            readOnly: widget.read ?? false,
            onChanged: widget.onChanged,
            obscureText: widget.inputHint == 'Password' ? showpass : false,
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            enabled: widget.enabled,
            decoration: widget.inputDecoration,
          ),
        ),
      ],
    );
  }
}
