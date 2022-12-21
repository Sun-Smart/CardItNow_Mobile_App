import 'package:cardit/themes/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 30, left: 20, right: 20),
                margin: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/loginbg.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    buildToptitle(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Header Title
  Widget buildToptitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Manage Cards ',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: themeChange.darkTheme
                  ? Colors.white
                  : const Color(0XFF1B1B1B),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        Material(
          borderRadius: BorderRadius.circular(12),
          color: Colors.amber,
          child: MaterialButton(
            onPressed: () {
              _alertDialog();
            },
            child: Row(
              children: const [
                Icon(Icons.add),
                SizedBox(width: 5),
                Text('Add Card',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        )
      ],
    );
  }

  //Popup Screen
  _alertDialog() {
    return Alert(
      closeIcon: const Icon(Icons.close),
      context: context,
      title: 'ADD CARD',
      buttons: [
        DialogButton(
          child: Text("SCAN",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          onPressed: () => Navigator.of(context).pushNamed('/scanCard'),
          color: HexColor('#CEE812'),
        ),
        DialogButton(
          child: Text("MANUAL",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          onPressed: () => Navigator.of(context).pushNamed('/manualCard'),
          color: HexColor('#CEE812'),
        )
      ],
    ).show();
  }
}
