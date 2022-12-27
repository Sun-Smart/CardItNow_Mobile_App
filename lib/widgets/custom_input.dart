// ignore_for_file: prefer_const_constructors

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
  final Widget? Function(String?)? onChanged;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final int? maxLines;
  const MyCustomInputBox(
      {Key? key,
      this.textInputType,
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
      this.maxLines})
      : super(key: key);
  @override
  _MyCustomInputBoxState createState() => _MyCustomInputBoxState();
}

class _MyCustomInputBoxState extends State<MyCustomInputBox> {
  bool isSubmitted = false;
  bool showpass = true;
  final checkBoxIcon = 'assets/checkbox.svg';

  @override
  Widget build(BuildContext context) {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 0),
            child: Text(
              widget.label ?? "",
              style: TextStyle(fontFamily: 'Sora', fontSize: 14),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width / 1,
          // height: MediaQuery.of(context).size.height * 0.070,
          child: TextFormField(
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
