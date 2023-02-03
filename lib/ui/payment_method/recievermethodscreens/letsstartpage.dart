import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Letsstartpage extends StatefulWidget {
  const Letsstartpage({Key? key}) : super(key: key);

  @override
  State<Letsstartpage> createState() => _LetsstartpageState();
}

class _LetsstartpageState extends State<Letsstartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          leading: BackButton(
            onPressed: (){
              Get.back();
            },
          ),
          foregroundColor: Colors.black, backgroundColor: Colors.transparent),
    );
  }
}
