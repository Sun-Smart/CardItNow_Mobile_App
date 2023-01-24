

import 'package:cardit/themes/theme_notifier.dart';

import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import 'paynow_payment_sucess.dart';



class PaymentLoading extends StatefulWidget {
  const PaymentLoading({Key? key}) : super(key: key);

  @override
  State<PaymentLoading> createState() => _PaymentLoadingState();
}

class _PaymentLoadingState extends State<PaymentLoading> {
  @override
  void initState() {
    super.initState();
    _navigation();
  }

  _navigation() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
      Get.to( const PaynowSucessScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: bulildbutton(),
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(90.0),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
                color: themeChange.darkTheme ? Colors.white : Colors.black,
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
                                  text: TextSpan(
                                text: 'Angelo',
                                style: TextStyle(
                                    fontFamily: "Sora",
                                    color: themeChange.darkTheme
                                        ? Colors.white
                                        : Color(0xff000000),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                /*defining default style is optional */
                              )),
                              Text(
                                'Angelo@gmail.com',
                                style: TextStyle(
                                    color: themeChange.darkTheme
                                        ? Colors.white
                                        : Color(0xffA49EA5),
                                    fontSize: 12,
                                    fontFamily: "Sora",
                                    fontWeight: FontWeight.w400),
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
              textAlign: TextAlign.center,
              style: TextStyle(
                  color:
                      themeChange.darkTheme ? Colors.white : Color(0xff413D4B),
                  fontSize: 12,
                  fontFamily: "Sora",
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    ));
  }

  Widget bulildbutton() {
    return AuthButton(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5),
      ),
     // color: Color(0XffC4C4C4),
      onTap: null,
      text: "Start BNPL Payment",color: Colors.grey,
      
    );
  }
}
