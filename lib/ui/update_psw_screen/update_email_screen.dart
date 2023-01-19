// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import

import 'package:cardit/ui/update_psw_screen/update_password_code_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class UpdateEmailScreen extends StatefulWidget {
  const UpdateEmailScreen({Key? key}) : super(key: key);

  @override
  State<UpdateEmailScreen> createState() => _UpdateEmailScreenState();
}

class _UpdateEmailScreenState extends State<UpdateEmailScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(top: 20, bottom: 30),
                margin: EdgeInsets.only(top: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildToptitle(),
                      buildtitle(),
                    ])),
            bulidForm(),
            SizedBox(height: 10),
          ],
        ),
      )),
      bottomNavigationBar: buildbutton(),
    );
  }

  Widget buildToptitle() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container()
        ]);
  }

  Widget buildtitle() {
    return Container(
        padding: EdgeInsets.all(15),
        child: Text('Forgot \nPassword',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)));
  }

  Widget bulidForm() {
    return Form(
      key: formKey,
      child: MyCustomInputBox(
        enabled: true,
        label: "Enter Email",
        controller: emailController,
        obsecureText: false,
        validator: (value) {
          if (emailController.text.isEmpty) {
            return "Please Enter The Email";
          } else if (!emailController.text.contains("@") ||
              !emailController.text.endsWith('.com')) {
            return "Please Enter The valid Email";
          } else {
            return null;
          }
        },
        inputDecoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Enter Email',
          floatingLabelBehavior: FloatingLabelBehavior.never,
          helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
          hintStyle: const TextStyle(
              fontSize: 12, fontFamily: 'Sora', fontWeight: FontWeight.normal),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          focusColor: Colors.grey.shade300,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              gapPadding: 7,
              borderSide: const BorderSide(color: Colors.grey)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.grey)),
          errorStyle: const TextStyle(
              fontFamily: 'Sora', fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
      onTap: () {
        if (formKey.currentState!.validate()) {
          Get.to(() => UpdatePasswordCode());
        }
      },
      text: "Next",
    );
  }
}
