// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:io';

import 'package:cardit/widgets/auth_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../themes/styles.dart';
import '../../themes/theme_notifier.dart';
import '../../widgets/bottom_navbar.dart';
import '../../widgets/promo_slider.dart';

final userDetails = FirebaseAuth.instance.currentUser;

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({Key? key}) : super(key: key);

  @override
  DashbordScreenState createState() => DashbordScreenState();
}

class DashbordScreenState extends State<DashbordScreen>
    with SingleTickerProviderStateMixin {
  final CarouselController _controller = CarouselController();

  int _currentsliderindex = 0;
  List<_SalesData> data = [
    _SalesData('Jan', 35, const Color(0XffEDEDED)),
    _SalesData('Feb', 50, const Color(0XffEDEDED)),
    _SalesData('Mar', 100, const Color(0XffEDEDED)),
    _SalesData('Apr', 32, const Color(0XffEDEDED)),
    _SalesData('May', 40, const Color(0XffEDEDED)),
    _SalesData('June', 90, const Color(0XffEDEDED)),
    _SalesData('July', 150, const Color(0Xff036D7A)),
    _SalesData('August', 80, const Color(0XffEDEDED)),
  ];
  var item = ['Monthly', 'weekly'];
  String? dropdownvalue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return WillPopScope(
      onWillPop: _onBackButtonPressed,
      child: Scaffold(
          bottomNavigationBar: const BottomNavBarWidget(0),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: AppBar(
              elevation: 0,
              centerTitle: false,
              leadingWidth: 40,
              titleSpacing: 0.0,
              backgroundColor: Styles.colorBackgroundBlock,
              title: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xff036D7A)),
                          child: GetStorage().read("avatarpic") == null
                              ? Container()
                              : GetStorage()
                                      .read("avatarpic")
                                      .toString()
                                      .contains('assets')
                                  ? Image.asset(GetStorage().read("avatarpic"),
                                      fit: BoxFit.cover, height: 43, width: 43)
                                  : Image.file(
                                      File(GetStorage().read("avatarpic")),
                                      fit: BoxFit.cover,
                                      height: 43,
                                      width: 43)),
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: '${GetStorage().read('username')}',
                                      style: const TextStyle(
                                          color: Color(0xff036D7A),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                      /*defining default style is optional */
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: '',
                                        style: const TextStyle(
                                            color: Color(0xffC9E313),
                                            fontSize: 18))
                                  ])),
                              const Text(
                                'Welcome !',
                                style: TextStyle(
                                    color: Color(0xffA49EA5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ))
                    ],
                  )),
              actions: [
                Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 10),
                    child: GestureDetector(
                        onTap: () {},
                        child: Image.asset('assets/notification.png',
                            fit: BoxFit.contain, width: 25, height: 25))),
              ],
            ),
          ),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Slider(),
              buildPaySchedule(),
              buildPayCharttitle(),
              buildPayChart(),
              buildTranstitle(),
              _buildBusinesscard(),
              const SizedBox(
                height: 20,
              )
            ],
          ))),
    );
  }

  //Back Press
  Future<bool> _onBackButtonPressed() async {
    bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          title: const Text('Really...',
              style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          content: const Text('Do you want to Close the app?',
              style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          actions: <Widget>[
            AuthButton(
              decoration: BoxDecoration(
                  color: HexColor('#90BA06'),
                  borderRadius: BorderRadius.circular(5)),
              onTap: () {
                SystemNavigator.pop();
              },
              text: "Yes",
            ),
            AuthButton(
              decoration: BoxDecoration(
                  color: HexColor('#D2ED78'),
                  borderRadius: BorderRadius.circular(5)),
              onTap: () {
                Navigator.pop(context);
              },
              text: "No",
            ),
          ],
        );
      },
    );
    return exitApp ?? false;
  }

  Widget Slider() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
          //color: themeChange.darkTheme ? Colors.black : Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/dashbordpg.png"), fit: BoxFit.cover)),
      child: TopPromoSlider(),
    );
  }

  Widget buildPaySchedule() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border:
                      Border.all(color: const Color(0XFFB7C5C7), width: 1.5),
                  color: const Color(0XFFffffff)),
              margin: const EdgeInsets.all(15),
              child: InkWell(
                highlightColor: const Color(0XFFffffff),
                focusColor: const Color(0XFFffffff),
                splashColor: Colors.green,
                // splash color
                onTap: () {
                  Navigator.of(context).pushNamed('/payment_dashboard');
                },
                // button pressed
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(width: 5),
                        Image.asset("assets/paynow.png", width: 32),
                        const SizedBox(width: 15),
                        Text("Pay Now",
                            style: TextStyle(
                                color: themeChange.darkTheme
                                    ? Colors.black
                                    : const Color(0XFF413D4B),
                                fontSize: 14)),
                        //text
                      ],
                    )),
              )),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0XFFB7C5C7), width: 1.5),
                color: const Color(0XFFffffff),
              ),
              margin: const EdgeInsets.all(15),
              child: InkWell(
                highlightColor: const Color(0XFFffffff),
                focusColor: const Color(0XFFffffff),
                splashColor: Colors.green,
                // splash color
                onTap: () {},
                // button pressed
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: const Color(0xffC9E313),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(
                              "assets/calander.png",
                              width: 20,
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "Schedule",
                          style:
                              TextStyle(color: Color(0XFF413D4B), fontSize: 14),
                        ),
                        // text
                      ],
                    )),
              )),
        ],
      ),
    );
  }

  Widget buildTranstitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Recent Transactions",
              style: TextStyle(
                  color: themeChange.darkTheme
                      ? Colors.white
                      : const Color(0XFF041316),
                  fontSize: 20)),
          Text('View',
              style: TextStyle(
                  color: themeChange.darkTheme
                      ? Colors.blue
                      : const Color(0Xff004751),
                  fontSize: 14))
        ],
      ),
    );
  }

  Widget buildPayCharttitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              "Money Spend",
              style: TextStyle(
                  color: themeChange.darkTheme
                      ? Colors.white
                      : const Color(0XFF041316),
                  fontSize: 20),
            )),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          width: MediaQuery.of(context).size.width / 3.6,
          height: MediaQuery.of(context).size.height / 15,
          decoration: const BoxDecoration(
              //border: Border.all(color: Color(0XffB7C5C7), width: 1.5),
              //borderRadius: const BorderRadius.all(Radius.circular(3)))
              ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButton(
              underline: const SizedBox(),
              // underline:Container(),
              //  validator: (value)=>value==null?'field required':null,
              dropdownColor: Colors.white,
              isExpanded: true,
              value: dropdownvalue,
              hint: Text(
                'Monthly',
                style: TextStyle(
                    color: themeChange.darkTheme
                        ? Colors.blue
                        : const Color(0Xff004751),
                    fontSize: 14),
              ),
              icon: InkWell(
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: themeChange.darkTheme
                      ? Colors.white
                      : const Color(0Xff004751),
                ),
              ),
              items: item.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item,
                      style: const TextStyle(
                          color: Color(0Xff004751), fontSize: 14)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPayChart() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // primaryXAxis: CategoryAxis(isVisible: false),
            // Chart title
            //title: ChartTitle(text: 'Half yearly sales analysis'),
            // Enable legend
            //legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_SalesData, String>>[
              ColumnSeries<_SalesData, String>(
                  dataSource: data,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  xValueMapper: (_SalesData sales, _) => sales.year,
                  name: 'Sales',
                  // Enable data label
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  trackColor: Colors.grey,
                  pointColorMapper: (_SalesData data, _) => data.color)
            ]));
  }

  Widget _buildBusinesscard() {
    final items = <Widget>[];

    items.add(buildTransactionCade(
        '25 December 2022', '₱ 4000', 'Paid to San Nicolas', 45879652, true));
    items.add(const SizedBox(
      height: 20,
    ));
    items.add(buildTransactionCade(
        '28 December 2022', '₱ 5000', 'Paid to San suresh', 45879652, false));

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        children: items,
      ),
    );
  }

  Widget buildTransactionCade(
      String date, String amount, String paidname, int tax, bool states) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0XffE5E5E5), width: 1.5),
          //borderRadius: const BorderRadius.all(Radius.circular(3)))
        ),
        // padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              color: const Color(0Xff004751),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(amount.toString(),
                          style: const TextStyle(
                            color: Color(0XffCEE812),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(date.toString(),
                          style: const TextStyle(
                              color: Color(0Xffffffff), fontSize: 9))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(paidname.toString(),
                            style: const TextStyle(
                                color: Color(0Xffffffff), fontSize: 14),
                            textAlign: TextAlign.left),
                        const SizedBox(
                          width: 10,
                        )
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TXN ID  :  ' + amount.toString(),
                          style: const TextStyle(
                              color: Color(0Xffffffff), fontSize: 11)),
                      const Text('Download Receipt',
                          style:
                              TextStyle(color: Color(0Xffffffff), fontSize: 10))
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                states
                    ? Image.asset(
                        "assets/paymentsuccess.png",
                        width: 32,
                      )
                    : Image.asset(
                        "assets/paymentsuccess.png",
                        width: 32,
                        color: const Color(0XffFF9D00),
                      ),
                const SizedBox(
                  width: 5,
                ),
                Text(states ? 'Transaction Success' : 'Confirmation Pending',
                    style: TextStyle(
                        color: states
                            ? const Color(0Xff0AA06E)
                            : const Color(0XffFF9D00),
                        fontSize: 14))
              ],
            )
          ],
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales, this.color);

  final String year;
  final double sales;
  final Color? color;
}
