import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AuthButton extends StatefulWidget {
  final String text;
  final void Function()? onTap;
  final double? width, height, fontsize;
  final Color? color, bordercolor;
  final FontWeight? fontweight;
  final BoxDecoration decoration;

  const AuthButton(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.decoration,
      this.fontsize,
      this.width,
      this.fontweight,
      this.color,
      this.bordercolor,
      this.height})
      : super(key: key);

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: widget.width ?? scrWidth * 0.90,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: widget.decoration,
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontFamily: 'ProductSans',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: HexColor('#004751'),
            ),
          ),
        ),
      ),
    );
  }
}
