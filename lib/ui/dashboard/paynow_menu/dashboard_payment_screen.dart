// ignore_for_file: prefer_const_constructors

import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/ui/payment/payee_information.dart';
import 'package:cardit/ui/dashboard/paynow_menu/select_recipient_screen.dart';
import 'package:cardit/ui/lgu/choose_lgu_screen.dart';
import 'package:cardit/ui/model_screen/dashboard_screen.dart';
import 'package:cardit/ui/model_screen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../const/responsive.dart';
import '../../../widgets/tgrid.dart';
import '../../payment/new_payment.dart';

class PaymentDashboard extends StatefulWidget {
  const PaymentDashboard({super.key});

  @override
  State<PaymentDashboard> createState() => _PaymentDashboardState();
  static dynamic mdata = {
    'user': [
      {
        'title': 'Angelo',
        'url': 'assets/user-img.png',
      },
      {
        'title': 'Raj',
        'type': '39 Listings',
        'url': 'assets/userimg.png',
      },
      {
        'title': 'Siva',
        'url': 'assets/user-img.png',
      },
    ],
    'partners': [
      {
        'title': 'LGU',
        'url': 'assets/goverment.png',
      },
      {
        'title': 'Medical',
        'url': 'assets/medical.png',
      },
      {
        'title': 'Grocery',
        'url': 'assets/foot.png',
      },
      {
        'title': 'Utilities',
        'url': 'assets/home.png',
      },
    ],
  };
}

class _PaymentDashboardState extends State<PaymentDashboard> {
  //DataDashboard ?myData;

  DataDashboard? myData;

  @override
  void initState() {
    myData = DataDashboard.fromJson(PaymentDashboard.mdata);
    super.initState();
  }

  var recepient = '/selecttypeofrecipient';
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
      //bottomNavigationBar: BottomNavBarWidget(1),
      appBar:Responsive.isMobile(context)?
       PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: AppBar(
              leading: BackButton(
                onPressed: (){

                  Get.back();
                },
                color: themeChange.darkTheme ? Colors.white : Colors.black,
              ),
              centerTitle: true,
              title: Text(
                'Payment',
                style: TextStyle(
                    color: themeChange.darkTheme
                        ? Colors.white
                        : Color(0Xff413D4B),
                    fontSize: 16,
                    fontFamily: "Sora",
                    fontWeight: FontWeight.w600),
              ),
            )),
      ):null,
      body: Responsive.isMobile(context)
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  _buildScarch(),
                  _buildtitle1(),
                  buildRecipients(),
                  _buildtitle2(),
                  _buildPartners(),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BackButton(
                color: Colors.black,
              ),
              SizedBox(width:Responsive.isDesktop(context)? 250:100,),
              Text(
                'Payment',
                style: TextStyle(
                    color: Color(0Xff413D4B),
                    fontSize: 16,
                    fontFamily: "Sora",
                    fontWeight: FontWeight.w600),
              ),
                  ],
                ),
                SizedBox(height: 50,),
                //  _buildScarch(),
                _buildtitle1(),
                buildRecipients(),
                _buildtitle2(),
                _buildPartners(),
              ],
            ),
    ));
  }

  Widget _buildScarch() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        width: double.infinity,
        height: 80,
        color: themeChange.darkTheme ? Colors.black : Colors.white,
        child: Center(
          child: TextField(
            onTap: () {},
            decoration: InputDecoration(
              hintText: 'Enter email or phone number to search',
              hintStyle: TextStyle(
                color: themeChange.darkTheme ? Colors.white : Colors.black,
                fontSize: 14,
              ),
              suffixIcon: Icon(
                Icons.search,
                color: themeChange.darkTheme ? Colors.white : Color(0xff292929),
                size: 20,
              ),
              contentPadding: EdgeInsets.all(10.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE5E5E5), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE5E5E5), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
          ),
        ));
  }

  Widget buildRecipients() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final items = <Widget>[];
    // for (var i = 0; i < myData!.user!.length; i++) {
    //   items.add(
    //     Container(
    //       margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
    //       padding: EdgeInsets.all(8),
    //       child: InkWell(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             ClipRRect(
    //                 borderRadius: BorderRadius.circular(50),
    //                 child: Image.asset(
    //                   myData!.user![i].url,
    //                   fit: BoxFit.cover,
    //                   width: 36,
    //                   height: 36,
    //                 )),
    //             SizedBox(
    //               height: 10,
    //             ),
    //             Text(myData!.user![i].title,
    //                 style: TextStyle(
    //                     color: themeChange.darkTheme
    //                         ? Colors.white
    //                         : Color(0XFF000000),
    //                     fontSize: 12,
    //                     fontWeight: FontWeight.bold)),
    //           ],
    //         ),
    //         onTap: () {},
    //       ),
    //     ),
    //   );
    // }

    items.add(Container(
      margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Get.to(NewPayment());
        },
        child: Column(children: [
          Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0XFFCEE812),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xff292929),
                    size: 30,
                  ))),
          SizedBox(
            height: 10,
          ),
          Text('Add',
              style: TextStyle(
                  color:
                      themeChange.darkTheme ? Colors.white : Color(0XFF000000),
                  fontFamily: "Sora",
                  fontSize: 12,
                  fontWeight: FontWeight.w400))
        ]),
      ),
    ));
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Wrap(
        children: items,
      ),
    );
  }

  Widget _buildtitle1() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Text('My Payees',
          style: TextStyle(
              color: themeChange.darkTheme ? Colors.white : Color(0XFF413D4B),
              fontFamily: "Sora",
              fontSize: 14,
              fontWeight: FontWeight.w400)),
    );
  }

  Widget _buildtitle2() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Text('Carditnow Partners',
          style: TextStyle(
              fontFamily: "Sora",
              color: themeChange.darkTheme ? Colors.white : Color(0XFF413D4B),
              fontSize: 14,
              fontWeight: FontWeight.w400)),
    );
  }

  Widget _buildPartners() {
    return Container(
        margin: EdgeInsets.all(15),
        child: TGrid(
            columnCount: 4,
            itemCount: myData!.partners.length,
            spacing: 15,
            runSpacing: 15,
            itemBuilder: (BuildContext context, int index) {
              return index < myData!.partners.length
                  ? _buildguide(myData!.partners[index])
                  : Container();
            }));
  }

  Widget _buildguide(DataUser partners) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: Color(0xffE5E5E5))),
        child: Column(children: [
          GestureDetector(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Image.asset(
                  partners.url,
                  fit: BoxFit.cover,
                  width: 38,
                  height: 38,
                )),
            onTap: () {
              Get.to(NewPayment( paymentType: "LGU",));
            },
          ),
          //commit
          SizedBox(
            height: 10,
          ),
          Text(partners.title,
              style: TextStyle(
                color: themeChange.darkTheme ? Colors.white : Color(0XFF000000),
                fontFamily: "Sora",
                fontWeight: FontWeight.w400,
                fontSize: 12,
              )),
        ]),
      ),
      onTap: () {},
    );
  }
}
