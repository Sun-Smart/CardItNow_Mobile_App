import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class MyCustomInputBox extends StatefulWidget {
  final String? label;
  final String? inputHint;
  final String? headingText;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool? obsecureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final int? maxLines;
  const MyCustomInputBox(
      {Key? key,
      this.label,
      this.inputHint,
      this.headingText,
      this.hintText,
      this.prefixIcon,
      this.obsecureText,
      this.suffixIcon,
      this.textInputType,
      this.textInputAction,
      required this.controller,
      this.maxLines,
      this.validator})
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20, bottom: 0),
            child: Text(
              widget.label ?? "",
              style: TextStyle(
                fontFamily: 'Sora',
                fontSize: 14,
                color: HexColor('#505050'),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width / 1,

          // height: MediaQuery.of(context).size.height * 0.070,
          child: TextFormField(
            obscureText: widget.inputHint == 'Password' ? showpass : false,
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            style: TextStyle(
                fontFamily: 'Sora',
                fontSize: 18,
                color: HexColor('#2f2145'),
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              //suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              helperText: '',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: widget.inputHint,
              helperStyle: TextStyle(fontFamily: 'Sora', fontSize: 14),
              hintStyle: const TextStyle(
                fontSize: 12,
                fontFamily: 'Sora',
                fontWeight: FontWeight.normal,
                color: Color.fromRGBO(65, 61, 75, 0.6),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              focusColor: Colors.grey.shade300,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: HexColor('#B7C5C7'), width: 1.3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: HexColor('#B7C5C7'), width: 1.3),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                gapPadding: 7,
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 255, 9, 9)),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 255, 9, 9)),
              ),
              errorStyle: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 13,
                  fontWeight: FontWeight.bold),

              suffixIcon: widget.inputHint == 'Password'
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          showpass = !showpass;
                        });
                      },
                      child: Container(
                        width: 10,
                        padding: const EdgeInsets.only(right: 20),
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          showpass
                              ? "assets/eyeclose.svg"
                              : "assets/eyeopen.svg",
                        ),
                      ),
                    )
                  : Visibility(
                      visible: false,
                      child: SvgPicture.asset(checkBoxIcon),
                    ),

              /*suffixIcon: isSubmitted == true
                  ? Visibility(
                      visible: true,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          checkBoxIcon,
                          height: 0.2,
                        ),
                      ),
                    )
                  : Visibility(
                      visible: false,
                      child: SvgPicture.asset(checkBoxIcon),
                    ),*/
            ),
          ),
        ),

        //
      ],
    );
  }
}
