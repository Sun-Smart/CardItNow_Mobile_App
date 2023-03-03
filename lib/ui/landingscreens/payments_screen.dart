import 'package:cardit/ui/landingscreens/payments_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../const/responsive.dart';
import '../../themes/theme_notifier.dart';
import '../../widgets/bottom_navbar.dart';
import '../../widgets/promo_slider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  PaymentsState createState() => PaymentsState();
}

class PaymentsState extends State<Payments>
    with SingleTickerProviderStateMixin {

  int _currentsliderindex = 0;
  List<_SalesData> data = [
    _SalesData('Jan', 0, Color(0Xff1C292C)),
    _SalesData('Feb', 0, Color(0Xff1C292C)),
    _SalesData('Mar', 0, Color(0Xff036D7A)),
    _SalesData('Apr', 0, Color(0Xff1C292C)),
    _SalesData('May', 0, Color(0Xff1C292C)),
  ];
  var item = [
    'Monthly',
    'weekly',
  ];
  String? dropdownvalue;
  @override
  void initState() {
    super.initState();
  }

  var paymenttab = '/paymentsdetails';
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        bottomNavigationBar:
            Responsive.isMobile(context) ? BottomNavBarWidget(2) : null,
        appBar: Responsive.isMobile(context)
            ? PreferredSize(
                preferredSize: Size.fromHeight(70.0),
                child: AppBar(
                  elevation: 0,
                  centerTitle: false,
                  leadingWidth: 50,
                  titleSpacing: 0.0,
                  //backgroundColor: Colors.white,
                  title: Padding(
                      padding: EdgeInsets.only(top: 0.0),
                      child: Text(
                        "Payments",
                        style: TextStyle(
                            color: themeChange.darkTheme
                                ? Colors.white
                                : Color(0XFF1B1B1B),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                  actions: [
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      width: MediaQuery.of(context).size.width / 3.6,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
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
                                    : Color(0Xff004751),
                                fontSize: 14),
                          ),
                          icon: InkWell(
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: themeChange.darkTheme
                                  ? Colors.blue
                                  : Color(0Xff004751),
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
                ),
              )
            : null,
        body: Responsive.isMobile(context)
            ? SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildPayChart(),
                  buildCard(),
                  buildTranstitle(),
                  _buildBusinesscard(),
                  SizedBox(
                    height: 20,
                  )
                ],
              ))
            : Row(
                children: [
                  Container(
                    width:Responsive.isDesktop(context)? MediaQuery.of(context).size.width / 3.5:
                    MediaQuery.of(context).size.width / 2.6,
                    height: MediaQuery.of(context).size.width / 1,
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payments",
                                style: TextStyle(
                                    color: themeChange.darkTheme
                                        ? Colors.white
                                        : Color(0XFF1B1B1B),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                                width: 100,
                                height: MediaQuery.of(context).size.height / 15,
                                decoration: BoxDecoration(
                                    //border: Border.all(color: Color(0XffB7C5C7), width: 1.5),
                                    //borderRadius: const BorderRadius.all(Radius.circular(3)))
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                              : Color(0Xff004751),
                                          fontSize: 14),
                                    ),
                                    icon: InkWell(
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: themeChange.darkTheme
                                            ? Colors.blue
                                            : Color(0Xff004751),
                                      ),
                                    ),
                                    items: item.map((String item) {
                                      return DropdownMenuItem(
                                        value: item,
                                        child: Text(item,
                                            style: const TextStyle(
                                                color: Color(0Xff004751),
                                                fontSize: 14)),
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
                          ),
                        ),
                        buildPayChart(),
                        buildCard(),
                        buildTranstitle(),
                        _buildBusinesscard(),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    )),
                  ),
                  paymenttab == '/paymentsdetails'
                      ? Container(
                          width: Responsive.isDesktop(context)?MediaQuery.of(context).size.width / 2.2:
                          MediaQuery.of(context).size.width / 2.5,
                          child: PaymentsDetails())
                      : Container()
                ],
              ));
  }

  Widget buildCard() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        image: DecorationImage(
          image: AssetImage("assets/cardpg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Carditnow Points",
          style: TextStyle(color: Color(0Xffffffff), fontSize: 13),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '0',
          style: TextStyle(color: Color(0XFFCEE812), fontSize: 24),
        )
      ]),
    );
  }

  Widget buildTranstitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recent Transactions",
            style: TextStyle(
                color: themeChange.darkTheme ? Colors.white : Color(0XFF041316),
                fontSize: 20),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }

  Widget buildPayChart() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          image: DecorationImage(
            image: AssetImage("assets/dashbordpg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0Xff000000),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "₱ 0.00",
                          style:
                              TextStyle(color: Color(0XFFCEE812), fontSize: 24),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_upward,
                          color: Color(0XffCEE812),
                          size: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "0",
                          style:
                              TextStyle(color: Color(0XFFFFFFFF), fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/piyimg.png",
                    width: 16,
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
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
                          dataLabelSettings: DataLabelSettings(
                              isVisible: true, color: Color(0Xff026C7A)),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          trackColor: Colors.grey,
                          borderColor: Color(0X00F6FBFF),
                          pointColorMapper: (_SalesData data, _) => data.color)
                    ]),
              ),
            ],
          ),
        ));
  }

  Widget _buildBusinesscard() {
    final items = <Widget>[];

    // items.add(buildTransactionCade(
    //     '25 December 2022', '₱ 4000', 'Paid to San Nicolas', 45879652, true));
    // items.add(SizedBox(
    //   height: 20,
    // ));
    // items.add(buildTransactionCade(
    //     '28 December 2022', '₱ 5000', 'Paid to San suresh', 45879652, false)
    // );

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        children: items,
      ),
    );
  }

  Widget buildTransactionCade(
      String date, String amount, String paidname, int tax, bool states) {
    return InkWell(
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0XffE5E5E5), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          // ),
          // padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: Color(0Xff004751),
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(amount.toString(),
                            style: TextStyle(
                              color: Color(0XffCEE812),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(date.toString(),
                            style: const TextStyle(
                                color: Color(0Xffffffff), fontSize: 9))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(paidname.toString(),
                              style: const TextStyle(
                                  color: Color(0Xffffffff), fontSize: 14),
                              textAlign: TextAlign.left),
                          SizedBox(
                            width: 10,
                          )
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('TXN ID  :  ' + amount.toString(),
                            style: const TextStyle(
                                color: Color(0Xffffffff), fontSize: 11)),
                        Text('Download Receipt',
                            style: const TextStyle(
                                color: Color(0Xffffffff), fontSize: 10))
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
                          color: Color(0XffFF9D00),
                        ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(states ? 'Transaction Success' : 'Confirmation Pending',
                      style: TextStyle(
                          color: states ? Color(0Xff0AA06E) : Color(0XffFF9D00),
                          fontSize: 14))
                ],
              )
            ],
          )),
      onTap: () {
        if (paymenttab == '/paymentsdetails') {
          setState(() {
            paymenttab;
          });
        } else {
          Get.to(PaymentsDetails());
        }
        //PaymentsDetails()
      },
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales, this.color);

  final String year;
  final double sales;
  final Color? color;
}
