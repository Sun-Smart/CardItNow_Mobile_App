import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class imagePassingScreen extends StatefulWidget {
  final File image;
  const imagePassingScreen({Key? key, required this.image}) : super(key: key);

  @override
  State<imagePassingScreen> createState() => _imagePassingScreenState();
}

class _imagePassingScreenState extends State<imagePassingScreen> {
  var image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.black),
      body: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // child: Image.file(
            //   File(image!.path),
            //   fit: BoxFit.contain,
            // ),
          ),
        ]),
      ),
    );
  }

  Widget alertDialogBox(BuildContext context) {
    return MaterialButton(
      minWidth: 300,
      color: Colors.grey[300],
      onPressed: () => Dialogs.bottomMaterialDialog(
          msg: 'Are you sure? you can\'t undo this action',
          title: 'Delete',
          context: context,
          actions: [
            IconsOutlineButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: 'Cancel',
              iconData: Icons.cancel_outlined,
              textStyle: TextStyle(color: Colors.grey),
              iconColor: Colors.grey,
            ),
            IconsButton(
              onPressed: () {},
              text: 'Delete',
              iconData: Icons.delete,
              color: Colors.red,
              textStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]),
      child: Text("Show Bottom Material Dialog"),
    );
  }
}
