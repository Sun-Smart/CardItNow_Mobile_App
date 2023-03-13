import 'package:cardit/ui/loan_screen/loan_amount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../api/regster_api.dart';
import '../../const/responsive.dart';
import '../../themes/theme_notifier.dart';
import '../../widgets/auth_button.dart';

class OnboardSellerApply extends StatefulWidget {
  var name;
  var email;
   OnboardSellerApply({Key? key,this.name,this.email}) : super(key: key);

  @override
  State<OnboardSellerApply> createState() => _OnboardSellerApplyState();
}

class _OnboardSellerApplyState extends State<OnboardSellerApply> {


  final RegisterAPI con = Get.find();

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar:
                Responsive.isMobile(context) ? loadbutton() : null,
            appBar: Responsive.isMobile(context)
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(90.0),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: AppBar(
                          leading: IconButton(
                            onPressed: () {
                              //Get.to( const PaymentLoading());
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                            color: themeChange.darkTheme
                                ? Colors.white
                                : Colors.black,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                              text: TextSpan(
                                            text: widget.name??'',
                                            style: TextStyle(
                                                color: themeChange.darkTheme
                                                    ? Colors.white
                                                    : Color(0xff000000),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                            /*defining default style is optional */
                                          )),
                                          Text(
                                            widget.email??'',
                                            style: TextStyle(
                                                color: themeChange.darkTheme
                                                    ? Colors.white
                                                    : Color(0xffA49EA5),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ))
                                ],
                              )),
                        )),
                  )
                : null,
            body: Responsive.isMobile(context)
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/payeeloading.png',
                          fit: BoxFit.cover,
                          height: 80,
                          width: 80,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "You Don't have any Payment",
                          style: TextStyle(
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Color(0xffCEE812),
                              fontSize: 14,
                              fontFamily: "Sora",
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                              "Press on start new payment to get started",
                              style: TextStyle(
                                  color: themeChange.darkTheme
                                      ? Colors.white
                                      : Color(0xff413D4B),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                       
                      ],
                    ),
                  )
                : Row(children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Image.asset("assets/applogo-02.png",
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: MediaQuery.of(context).size.height / 3)),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 1,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.close),
                                  color: themeChange.darkTheme
                                      ? Colors.white
                                      : Colors.black,
                                ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                            ),
                            SizedBox(
                              height: 150,
                            ),
                            Image.asset(
                              'assets/payeeloading.png',
                              fit: BoxFit.cover,
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                               "Press on start new payment to get started",
                              style: TextStyle(
                                  color: themeChange.darkTheme
                                      ? Colors.white
                                      : Color(0xff016F7E),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Press on start new payment to get started",
                              style: TextStyle(
                                  color: themeChange.darkTheme
                                      ? Colors.white
                                      : Color(0xff413D4B),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'You can now initiate payments.',
                              style: TextStyle(
                                  color: themeChange.darkTheme
                                      ? Colors.white
                                      : Color(0xff413D4B),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Get.to(LoanAmount());
                               //  showAlertDialog(context);
                                // con.invoicegetmethod();
                                // Get.to(AmountPay());
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                width: Responsive.isDesktop(context)
                                    ? MediaQuery.of(context).size.width / 4
                                    : MediaQuery.of(context).size.width / 3,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                    color: HexColor('#CEE812'),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    'Start New Payment',
                                    style: TextStyle(
                                      fontFamily: 'ProductSans',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#004751'),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  ])));
  }
   Widget loadbutton() {
    return AuthButton(
      decoration: BoxDecoration(
          color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
      onTap: () {
      
       // Get.to(LoanAmount());
      },
      text: "Start New Payment",
    );
  }
}
