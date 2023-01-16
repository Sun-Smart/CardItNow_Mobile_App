import 'package:flutter/material.dart';
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
