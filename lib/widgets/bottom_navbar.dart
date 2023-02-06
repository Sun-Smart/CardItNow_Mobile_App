// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:cardit/ui/payment_method/recievermethodscreens/credit_prepaid_screen.dart';
import 'package:cardit/ui/payment_method/recievermethodscreens/receiver_payment_screen.dart';
import 'package:cardit/widgets/customicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route_generator.dart';
import 'bottombar_widget/sliding_clipped_nav_bar.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  String cont = '0';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingClippedNavBar.colorful(
      backgroundColor: Color(0xff041316),
      onButtonPressed: _onItemTapped,
      iconSize: 30,
      // activeColor: const Color(0xFF01579B),
      selectedIndex: widget.index,
      barItems: <BarItem>[
        BarItem(
            icon: CustomIcon.credit_card,
            title: 'Card',
            activeColor: Color(0xffCEE812),
            inactiveColor: Color.fromRGBO(255, 255, 255, 0.4)),
        BarItem(
            icon: CustomIcon.doc_text,
            title: 'Loans',
            activeColor: Color(0xffCEE812),
            inactiveColor: Color.fromRGBO(255, 255, 255, 0.4)),
        BarItem(
            icon: CustomIcon.exchange,
            title: 'Payments',
            activeColor: Color(0xffCEE812),
            inactiveColor: Color.fromRGBO(255, 255, 255, 0.4)),
        BarItem(
            icon: CustomIcon.person_outline,
            title: 'Profile',
            activeColor: Color(0xffCEE812),
            inactiveColor: Color.fromRGBO(255, 255, 255, 0.4)),
      ],
    );
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(
            NavigationService.navigatorKey.currentContext ?? context,
            "/dashbordScreen");
        break;

      case 1:
        Navigator.pushReplacementNamed(
            NavigationService.navigatorKey.currentContext ?? context, "/loan");
        break;

      // case 2:
      //   Navigator.pushReplacementNamed(
      //       NavigationService.navigatorKey.currentContext ?? context,
      //       "/myorder");
      //   break;
      case 2:
        Navigator.pushReplacementNamed(
            NavigationService.navigatorKey.currentContext ?? context,
            "/payments");
        break;
      case 3:
        Navigator.pushReplacementNamed(
            NavigationService.navigatorKey.currentContext ?? context,
            "/profile");
        break;
    }
  }
}

class BottomNavBarReceiver extends StatefulWidget {
  const BottomNavBarReceiver({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<BottomNavBarReceiver> createState() => _BottomNavBarReceiverState();
}

class _BottomNavBarReceiverState extends State<BottomNavBarReceiver> {
  String cont = '0';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingClippedNavBar.colorful(
      backgroundColor: Color(0xff041316),
      onButtonPressed: _onItemTapped,
      iconSize: 30,
      selectedIndex: widget.index,
      barItems: <BarItem>[
        BarItem(
            icon: CustomIcon.credit_card,
            title: 'Wallet',
            activeColor: Color(0xffCEE812),
            inactiveColor: Color.fromRGBO(255, 255, 255, 0.4)),
        BarItem(
            icon: CustomIcon.doc_text,
            title: 'Payments',
            activeColor: Color(0xffCEE812),
            inactiveColor: Color.fromRGBO(255, 255, 255, 0.4)),
        BarItem(
            icon: CustomIcon.exchange,
            title: 'Profile',
            activeColor: Color(0xffCEE812),
            inactiveColor: Color.fromRGBO(255, 255, 255, 0.4)),
      ],
    );
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.to(() => CreditPrepaidScreen());
        break;
      case 1:
        Get.to(() => ReceiverPaymentScreen());
        break;
      case 2:
        Get.to(() => ReceiverPaymentScreen());
        break;
    }
  }
}
