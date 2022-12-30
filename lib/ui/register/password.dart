import 'package:cardit/responsive/responsive.dart';
// import 'package:cardit/themes/Themes.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/ui/register/register_screen.dart';
import 'package:cardit/ui/register/verify_userid_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../themes/styles.dart';
import '../../widgets/custom_input.dart';

final password = TextEditingController();
final confirmpassword = TextEditingController();

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                color: Styles.colorBackgroundBlock,
                child: Column(
                  crossAxisAlignment: Responsive.isMobile(context)
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    Container(
                      // padding: EdgeInsets.only(top: 20, bottom: 30),
                        margin: EdgeInsets.only(top: 40),
                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //     image: AssetImage("assets/loginbg.png"),
                        //     fit: Responsive.isMobile(context)
                        //         ? BoxFit.cover
                        //         : BoxFit.fill,
                        //   ),
                        // ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildToptitle(),
                              buildtitle(),
                            ])),
                    // buildbutton(),
                    bulidForm(),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
  Widget buildToptitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.close,
                color: themeChange.darkTheme ? Colors.white : Colors.black,
                size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container()
        ]);
  }


  Widget bulidForm() {

    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCustomInputBox(
                    enabled: true,
                    label: "Enter Your Password ",
                    keyboardType: TextInputType.emailAddress,
                    controller: password,
                    textInputAction: TextInputAction.next,
                    obsecureText: false,
                    inputHint: 'Enter Your Password',
                    validator: (value) {
                      if(password.text.isEmpty){
                        return "Please Enter your password";
                      }else if(password.text.contains(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')){
                        return "Enter Valid Password";
                      }


                      else {
                        return null;
                      }
                    },
                    inputDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your Password',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      helperStyle:
                      const TextStyle(fontFamily: 'Sora', fontSize: 14),
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.normal,
                      ),
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
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                SizedBox(
                  height: 15,
                ),
                  MyCustomInputBox(
                    enabled: true,
                    label: "Confirm Your Password ",
                    keyboardType: TextInputType.emailAddress,
                    controller: confirmpassword,
                    textInputAction: TextInputAction.next,
                    obsecureText: false,
                    inputHint: 'Retype your email',
                    validator: (value) {
                     if(confirmpassword.text.isEmpty){
                        return "Please Enter The Confirm password";
                      }
                      else {
                        return null;
                      }
                    },
                    inputDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Retype Your Password',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      helperStyle:
                      const TextStyle(fontFamily: 'Sora', fontSize: 14),
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.normal,
                      ),
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
                          fontWeight: FontWeight.bold),
                    ),
                  ),


                  AuthButton(
                    onTap: () {
                    if(password.text.isEmpty){
                    Fluttertoast.showToast(msg: "Please Enter Your Password");
                    }
                    else if(confirmpassword.text.isEmpty){
                      Fluttertoast.showToast(msg: "Please Enter Your Confirm Password");
                    }
                    else if(password.text!=confirmpassword.text){
                      Fluttertoast.showToast(msg: "Password has mismatched");
                    }
                    else{
                      Get.to(()=>VerifyUserId());
                    }
                    },

                    text: "Confirm",
                    decoration: BoxDecoration(
                        color:
                        // isChecked == false
                        //     ? HexColor('#E9F9B2')
                        HexColor('#CEE812'),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  const SizedBox(height: 10),

                ])));
  }
  Widget buildtitle() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        'Set Your Password',
        style: TextStyle(
          fontSize: 28,
          // color: themeChange.darkTheme ? Colors.white : HexColor('#004751'),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }


}