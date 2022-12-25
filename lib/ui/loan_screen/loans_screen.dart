import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../themes/styles.dart';
import '../../themes/theme_notifier.dart';
import '../../widgets/bottom_navbar.dart';

class Loans extends StatefulWidget {
  const Loans({super.key});

  @override
  State<Loans> createState() => _LoansState();
}

class _LoansState extends State<Loans> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavBarWidget(1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: AppBar(
              elevation: 0,
              leadingWidth: 30,
              centerTitle: false,
              title: Text(
                'Easy Installment',
                style: TextStyle(
                    color: Styles.whitecolortext,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 10.0, top: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/search.png',
                        fit: BoxFit.contain,
                        width: 25,
                        height: 22,
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(right: 10.0, top: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/notification.png',
                        fit: BoxFit.contain,
                        width: 25,
                        height: 22,
                        color: Styles.whitecolortext,
                      ),
                    )),
              ],
            )),
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            topBanner(),
            buildtitle(),
            buildbutton(),
            buildfaq(),
          ],
        ),
      )),
    ));
  }

  Widget topBanner() {
    return Container(
      color: Color(0XFFF7F7F7),
      child: Image.asset(
        "assets/loanpg.png",
      ),
    );
  }

  Widget buildtitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Get Instant loans !',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Sora',
                color:
                    themeChange.darkTheme ? Colors.white : HexColor('#026C7A'),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'for payments of carditnow participating Partners 0% fee,\n for non cardit dont  worry you can still do easy Payment plan at very low cost of 2% only.',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Sora',
                color: themeChange.darkTheme ? Colors.white : Color(0Xff81898A),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }

  Widget buildbutton() {
    return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Color(0XFFCEE812),
        ),
        margin: EdgeInsets.all(10),
        child: InkWell(
          highlightColor: Color(0XFF004751),
          focusColor: Color(0XFF004751),
          splashColor: Colors.green, // splash color
          onTap: () {
            Navigator.of(context).pushNamed('/loanpayment');
          }, // button pressed
          child: const Padding(
            padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
            child: Text(
              "Let’s Go",
              style: TextStyle(color: Color(0XFF004751), fontSize: 16),
            ),
            // text
          ),
        ));
  }

  Widget buildfaq() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0Xff81898A))),
            child: ExpansionTile(
              title: Text('What are the benefits?',
                  style: TextStyle(
                      color: themeChange.darkTheme
                          ? Colors.white
                          : Color(0Xff81898A),
                      fontSize: 18)),
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: const Text(
                        'There are several methods towidgets This is called composition.'))
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0Xff81898A))),
            child: ExpansionTile(
              title: Text('How i can repay?',
                  style: TextStyle(
                      color: themeChange.darkTheme
                          ? Colors.white
                          : Color(0Xff81898A),
                      fontSize: 18)),
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        'several methods towidgets This is called composition.'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
