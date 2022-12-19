import 'package:cardit/ui/register.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final double? width, height, fontsize;
  final Color? color, bordercolor;
  final FontWeight? fontweight;
  const AuthButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.fontsize,
      this.width,
      this.fontweight,
      this.color,
      this.bordercolor,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    // var scrHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: width ?? scrWidth * 0.90,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: isChecked == true && isChecked1 == true
              ? HexColor('#CEE812')
              : Color.fromARGB(255, 218, 248, 159),
          // color: color != null ? color : HexColor('#CEE812'),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
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
