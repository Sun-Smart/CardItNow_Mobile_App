import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../widgets/auth_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class OnboardSellerApply extends StatefulWidget {
  const OnboardSellerApply({Key? key}) : super(key: key);

  @override
  State<OnboardSellerApply> createState() => _OnboardSellerApplyState();
}

class _OnboardSellerApplyState extends State<OnboardSellerApply> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: bulildbutton(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
                color: Colors.black,
              ),
              centerTitle: true,
              title: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff036D7A),
                          ),
                          child: Image.asset(
                            'assets/profile.png',
                            fit: BoxFit.cover,
                            height: 43,
                            width: 43,
                          )),
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: const TextSpan(
                                text: 'Angelo',
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                /*defining default style is optional */
                              )),
                              const Text(
                                'Angelo@gmail.com',
                                style: TextStyle(
                                    color: Color(0xffA49EA5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ))
                    ],
                  )),
            )),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/notesimg.png',
              fit: BoxFit.cover,
              height: 80,
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Congratulations ! ',
              style: TextStyle(
                  color: Color(0xff413D4B),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'We have verified the Recipient.\n You can now initiate',
              style: TextStyle(
                  color: Color(0xff413D4B),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ));
  }

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Stack(
        children: [
          Positioned(
            right: -15,
            top: -15,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
              color: Colors.black,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload Invoice "),
              SizedBox(
                height: 2,
              ),
              Text(" Choose from options",
                  style: TextStyle(
                      color: Color(0xff413D4B),
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
      content: Container(
        height: 180,
        child: Column(children: [
          Container(
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: Color(0XFFB7C5C7), width: 1.5),
                color: Color(0XFFffffff),
              ),
              margin: EdgeInsets.all(15),
              child: InkWell(
                highlightColor: Color(0XFFffffff),
                focusColor: Color(0XFFffffff),
                splashColor: Colors.green, // splash color
                onTap: () {}, // button pressed
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0XFFCEE812),
                            ),
                            padding: EdgeInsets.all(5),
                            child: Image.asset(
                              "assets/document-icon.png",
                              width: 24,
                              height: 24,
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "Choose a document",
                          style:
                              TextStyle(color: Color(0XFF413D4B), fontSize: 14),
                        ),
                        // text
                      ],
                    )),
              )),
          Container(
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: Color(0XFFB7C5C7), width: 1.5),
                color: Color(0XFFffffff),
              ),
              margin: EdgeInsets.all(15),
              child: InkWell(
                highlightColor: Color(0XFFffffff),
                focusColor: Color(0XFFffffff),
                splashColor: Colors.green, // splash color
                onTap: () {}, // button pressed
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0XFFCEE812),
                            ),
                            padding: EdgeInsets.all(5),
                            child: Image.asset(
                              "assets/icon-pdf.png",
                              width: 24,
                              height: 24,
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "Take a Picture",
                          style:
                              TextStyle(color: Color(0XFF413D4B), fontSize: 14),
                        ),
                        // text
                      ],
                    )),
              )),
        ]),
      ),
      actions: [
        //okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget bulildbutton() {
    return AuthButton(
      onTap: () {
        showAlertDialog(context);
      },
      text: "Proceed to Apply",
    );
  }
}
