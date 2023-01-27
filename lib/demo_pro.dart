// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:s10s_card_scanner/s10s_card_scanner.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LvScrollView extends StatelessWidget {
  LvScrollView({super.key});

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              itemScrollController.scrollTo(
                  index: 1,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOutCubic);
            },
            child: Text('Tap me')),
      ),
      body: ScrollablePositionedList.builder(
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          itemCount: 3,
          itemBuilder: (context, index) {
            return index == 0
                ? Lv2()
                : index == 1
                    ? Lv1()
                    : index == 2
                        ? Lv3()
                        : Lv3();
          }),
    );
  }
}

class Lv1 extends StatelessWidget {
  const Lv1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Bahssss'),
        ),
        ListTile(
          title: Text('Bahssss'),
        ),
        ListTile(
          title: Text('Bahssss'),
        ),
        ListTile(
          title: Text('Bahssss'),
        ),
        SizedBox(
          height: 500,
        )
      ],
    );
  }
}

class Lv2 extends StatelessWidget {
  const Lv2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('bbbbb'),
        ),
        SizedBox(
          height: 500,
        )
      ],
    );
  }
}

class Lv3 extends StatelessWidget {
  const Lv3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('sssssss'),
        ),
        ListTile(
          title: Text('sssssss'),
        ),
        ListTile(
          title: Text('sssssss'),
        ),
        ListTile(
          title: Text('sssssss'),
        ),
        ListTile(
          title: Text('sssssss'),
        ),
      ],
    );
  }
}

class DemoAppTask extends StatefulWidget {
  const DemoAppTask({Key? key}) : super(key: key);

  @override
  State<DemoAppTask> createState() => _DemoAppTaskState();
}

class _DemoAppTaskState extends State<DemoAppTask> {
  String _cardNumber = 'Unknown';

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    try {
      final results = await S10sCardScanner.cardScanInfo;
      _cardNumber = results?['cardNumber'] ?? "";
      print(_cardNumber);
    } on Exception {
      print("failed");
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Card scanner'), backgroundColor: Colors.blueGrey),
        body: Column(
          children: [
            MaterialButton(
              color: Colors.blue,
                onPressed: () {
                  initPlatformState();
                },
                child: Text('Press')),
            Center(
              child: Text('Scanned card number: $_cardNumber\n'),
            ),
          ],
        ));
  }
}
