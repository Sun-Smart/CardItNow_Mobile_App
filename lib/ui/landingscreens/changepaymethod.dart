import 'package:flutter/material.dart';

class changepaymethod extends StatefulWidget {
  const changepaymethod({Key? key}) : super(key: key);

  @override
  State<changepaymethod> createState() => _changepaymethodState();
}

class _changepaymethodState extends State<changepaymethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Your Payment Method",
        style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
