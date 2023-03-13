// ignore_for_file: prefer_const_constructors

import 'package:cardit/api/regster_api.dart';
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
import 'package:hexcolor/hexcolor.dart';
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
        'title': 'Housing',
        'url': 'assets/medical.png',
      }
    ],
  };
}

class _PaymentDashboardState extends State<PaymentDashboard> {
  //DataDashboard ?myData;

  DataDashboard? myData;

  RegisterAPI reg = RegisterAPI();
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
          :  Responsive.isDesktop(context)?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BackButton(
                color: Colors.black,
              ),
              SizedBox(width: 250),
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
            ):Row(
              children: [
                Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      // height: MediaQuery.of(context).size.width / 1,
                      color: Color(0XFF004751),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/logoweb.png",
                              width: 150, height: 90),
                          SizedBox(height: 15),
                          Text(
                            '"Make your life simple"',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'sora'),
                          ),
                        ],
                      )),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              BackButton(
                                        color: Colors.black,
                                      ),
                            ],
                          ),
                                  
                                  Text(
                                    'Payment',
                                    style: TextStyle(
                          color: Color(0Xff413D4B),
                          fontSize: 16,
                          fontFamily: "Sora",
                          fontWeight: FontWeight.w600),
                                  ),
                                    SizedBox(height: 50,),
                                    //  _buildScarch(),
                                    _buildtitle1(),
                                    Row(
                                      children: [
                                        buildRecipients(),
                                      ],
                                    ),
                                    _buildtitle2(),
                                    _buildPartners(),
                        ],
                      ),
                    ),
             
              ],
            )
              
          
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

  var customerList = [
    {
      "customerid": 465,
      "customerid": 465,
      "mode": "I",
      "uid": "P00000465",
      "type": "R",
      "firstname": "",
      "lastname": "",
      "email": "miracledhamu0703@gmail.com",
      "mobile": "23423423",
      "dob": "2005-01-01T00:00:00",
      "customerinterests": null,
      "defaultavatar": null,
      "customerphoto": null,
      "googleid": "4xKZn5zUOITvNtE8Ky5YeLCkL0F3",
      "facebookid": "0",
      "lasttermsaccepted": null,
      "customfield": null,
      "attachment": null,
      "status": "A",
      "deletionaccountrequestedon": null,
      "autodeletedon": null,
      "deleterevokedon": null,
      "createddate": "2023-03-02T07:49:51.503",
      "createdby": 1,
      "updatedby": 0,
      "updateddate": "2023-03-02T07:50:09.978",
      "otp": "586844",
      "password": "978978",
      "tpin": "978978",
      "nickname": "sdfsdf",
      "customervisible": true
    }
  ];

  Widget buildRecipients() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final items = <Widget>[];
    for (var i = 0; i < customerList.length; i++) {
      items.add(
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
          padding: EdgeInsets.all(8),
          child: InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child:
                    customerList[i]["defaultavatar"] != null
                 ? Image.asset(
                      "${customerList[i]["defaultavatar"]}",
                      fit: BoxFit.cover,
                      width: 36,
                      height: 36,
                    )
                :  Container(
                      alignment: Alignment.center,
                      width: 50, height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: HexColor('#CEE812'),
                      ),

                      child: Text(reg.getInitials("${customerList[i]["firstname"]}"),
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.bold,
                              color: HexColor('#036D7B'),
                              fontSize: 16)),
                    ),),
                SizedBox(
                  height: 10,
                ),
                Text("${customerList[i]["firstname"]}",
                    style: TextStyle(
                        color: themeChange.darkTheme
                            ? Colors.white
                            : Color(0XFF000000),
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            onTap: () {
            Get.to(NewPayment(paymentType: customerList[i]["mode"] == "LG"
            ?"LGU"
            : customerList[i]["mode"] == "IL" || customerList[i]["mode"] == "M" || customerList[i]["mode"] == "PP"
            ? "House"
            : "Pay"));
            },
          ),
        ),
      );
    }

    items.add(Container(
      margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Get.to(NewPayment(paymentType: "Pay"));
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
          ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Image.asset(
                partners.url,
                fit: BoxFit.cover,
                width: 38,
                height: 38,
              )),
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
      onTap: () {
        if(partners.title == "LGU"){
          Get.to(NewPayment( paymentType: "LGU",));
        } else{
          Get.to(NewPayment( paymentType: "House",));
        }

      },
    );
  }
}
