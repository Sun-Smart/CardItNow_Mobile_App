// ignore_for_file: avoid_print, unnecessary_import, prefer_interpolation_to_compose_strings

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoTask extends StatefulWidget {
  const DemoTask({Key? key}) : super(key: key);

  @override
  State<DemoTask> createState() => _DemoTaskState();
}

class _DemoTaskState extends State<DemoTask> {
  List<String> _pictures = [];

  var displayNumber = '';

  final cardController = TextEditingController();
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ElevatedButton(
            //     onPressed: onPressed, child: const Text("Add Pictures")),
            // for (var picture in _pictures) Image.file(File(picture))
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  if (cardController.text.isNotEmpty)
                    Positioned(
                        left: 12,
                        top: 20,
                        child: Text(displayNumber.toString()[0])),
                  if (cardController.text.length > 1)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text(displayNumber.toString()[0] + 'x')),
                  if (cardController.text.length > 2)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text(displayNumber.toString()[0] + 'xx')),
                  if (cardController.text.length > 3)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text('${displayNumber.toString()[0]}xxx')),
                  if (cardController.text.length > 4)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text(displayNumber.toString()[0] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[4])),
                  if (cardController.text.length > 5)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text(displayNumber.toString()[0] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[4] +
                            'x')),
                  if (cardController.text.length > 6)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text(displayNumber.toString()[0] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[4] +
                            'xx')),
                  if (cardController.text.length > 7)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text(displayNumber.toString()[0] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[4] +
                            'xxx')),
                  if (cardController.text.length > 8)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text(displayNumber.toString()[0] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[4] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[8])),
                  if (cardController.text.length > 9)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text(displayNumber.toString()[0] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[4] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[8] +
                            'x')),
                  if (cardController.text.length > 10)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text(displayNumber.toString()[0] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[4] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[8] +
                            'xx')),
                  if (cardController.text.length > 11)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text(displayNumber.toString()[0] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[4] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[8] +
                            'xxx')),
                  if (cardController.text.length > 12)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text(displayNumber.toString()[0] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[4] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[8] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[12])),
                  if (cardController.text.length > 13)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text(displayNumber.toString()[0] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[4] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[8] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[12] +
                            'x')),
                  if (cardController.text.length > 14)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text(displayNumber.toString()[0] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[4] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[8] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[12] +
                            'xx')),
                  if (cardController.text.length > 15)
                    Positioned(
                        top: 20,
                        left: 12,
                        child: Text(displayNumber.toString()[0] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[4] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[8] +
                            'xxx' +
                            ' ' +
                            displayNumber.toString()[12] +
                            'xxx')),
                  TextField(
                    style: const TextStyle(
                        color: Colors.transparent,
                        fontSize: 16,
                        fontFamily: 'Sora'),
                    controller: cardController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16)
                    ],
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0)),
                        hintText: '2xxx 1xxx 5xxx 5xxx'),
                    onChanged: (v) {
                      setState(() {
                        displayNumber = v;
                      });
                    },
                    onSubmitted: (v) {
                      print(cardController.text);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void onPressed() async {
  //   List<String> pictures;
  //   try {
  //     pictures = await CunningDocumentScanner.getPictures() ?? [];
  //     if (!mounted) return;
  //     setState(() {
  //       _pictures = pictures;
  //     });
  //   } catch (exception) {
  //     print('Image Not Pic');
  //   }
  // }
}
