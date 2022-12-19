import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../widgets/bottom_navbar.dart';
import '../../widgets/tgrid.dart';
import '../model/dashboard.dart';
import '../model/user.dart';

class LoansPayment extends StatefulWidget {
  const LoansPayment({Key? key}) : super(key: key);

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

  @override
  State<LoansPayment> createState() => _LoansPaymentState();
}

class _LoansPaymentState extends State<LoansPayment> {
  DataDashboard? myData;
  @override
  void initState() {
    myData = DataDashboard.fromJson(LoansPayment.mdata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //bottomNavigationBar: BottomNavBarWidget(1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: AppBar(
              leading: const BackButton(
                color: Colors.black,
              ),
              centerTitle: true,
              title: const Text(
                'Payment',
                style: TextStyle(
                    color: Color(0Xff1B1B1B),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildScarch(),
            _buildtitle1(),
            buildRecipients(),
            _buildtitle2(),
            _buildPartners(),
          ],
        ),
      ),
    ));
  }

  Widget _buildScarch() {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        width: double.infinity,
        height: 80,
        color: Colors.white,
        child: Center(
          child: TextField(
            onTap: () {},
            decoration: const InputDecoration(
              hintText: 'Enter email or phone number to search',
              suffixIcon: Icon(
                Icons.search,
                color: Color(0xff292929),
                size: 30,
              ),
              contentPadding: EdgeInsets.all(18.0),
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
    final items = <Widget>[];
    for (var i = 0; i < myData!.user.length; i++) {
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
                    child: Image.asset(
                      myData!.user[i].url,
                      fit: BoxFit.cover,
                      width: 36,
                      height: 36,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(myData!.user[i].title,
                    style: const TextStyle(
                        color: Color(0XFF000000),
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            onTap: () {},
          ),
        ),
      );
    }

    items.add(
      Container(
        margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
        padding: EdgeInsets.all(8),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/onboardseller');
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
            const Text('Add',
                style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 12,
                    fontWeight: FontWeight.bold))
          ]),
        ),
      ),
    );
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Wrap(
        children: items,
      ),
    );
  }

  Widget _buildtitle1() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: const Text('My Recipients',
          style: TextStyle(
              color: Color(0XFF413D4B),
              fontSize: 14,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildtitle2() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: const Text('Carditnow Partners',
          style: TextStyle(
              color: Color(0XFF413D4B),
              fontSize: 14,
              fontWeight: FontWeight.bold)),
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
    return InkWell(
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
          SizedBox(
            height: 10,
          ),
          Text(partners.title,
              style: const TextStyle(
                color: Color(0XFF000000),
                fontSize: 12,
              )),
        ]),
      ),
      onTap: () {},
    );
  }
}
