import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/ui/register.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

var type = '';
var countrytype = ['assets/newlogo.png', 'assets/newuae.png'];
var countryname = ['Philipines', 'UAE'];
bool country = false;
var isphilipines;

class Selectcountry extends StatefulWidget {
  const Selectcountry({Key? key}) : super(key: key);

  @override
  State<Selectcountry> createState() => _SelectcountryState();
}

class _SelectcountryState extends State<Selectcountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildToptitle(),
            buildtitle(),
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                children: [
                  Text(
                    "Select Your Country",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#004751')),
                  ),
                ],
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                itemCount: countrytype.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        country == isphilipines ? true : false;
                        print(country);
                        isphilipines;
                        print(isphilipines);
                        type = countrytype[index];
                      });
                    },
                    child: Container(
                      // padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(10),
                      child: Card(
                        color: type == countrytype[index]
                            ? Color(0xffA8DAB5)
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  countrytype[index],
                                  width: 100,
                                  height: 100,
                                ),
                                SizedBox(width: 30),
                                Text(
                                  countryname[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ],
                        )),
                      ),
                    ),
                  );
                }),
            const Spacer(),
            if (type != '')
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 55,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: HexColor('#CEE812'),
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register(
                                        // countrytype: type,
                                        )));
                          },
                          child: Text(
                            "CONFIRM",
                            style: TextStyle(
                              fontFamily: 'ProductSans',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: HexColor('#004751'),
                            ),
                          )),
                    )),
                  ],
                ),
              ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildToptitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: themeChange.darkTheme ? Colors.white : Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container()
        ]);
  }

  Widget buildtitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        padding: EdgeInsets.all(15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Join ',
                    style: TextStyle(
                        fontSize: 28,
                        color: themeChange.darkTheme
                            ? Colors.white
                            : HexColor('#CEE812')),
                  ),
                  Image.asset(
                    "assets/carditlogo.png",
                    width: 100,
                    height: 65,
                  ),
                ],
              ),
              // Image.asset(
              //   "assets/userimg.png",
              //   width: 107,
              // ),
            ]));
  }
}
