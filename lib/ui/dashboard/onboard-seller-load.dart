import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/custom_input.dart';

class OnboardSellerLoad extends StatefulWidget {
  const OnboardSellerLoad({Key? key}) : super(key: key);

  @override
  State<OnboardSellerLoad> createState() => _OnboardSellerloadState();
}

class _OnboardSellerloadState extends State<OnboardSellerLoad> {
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
              'assets/lodaing-img.gif',
              fit: BoxFit.cover,
              height: 80,
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Please wait untill your Recipient is being verified',
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

  Widget bulildbutton() {
    return AuthButton(
      color: Color(0XffC4C4C4),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/onboardsellerapply',
        );
      },
      text: "Start BNPL Payment",
    );
  }
}
