
import 'package:flutter/material.dart';


import '../route_generator.dart';
import 'bottombar_widget/sliding_clipped_nav_bar.dart';
import 'customicons.dart';

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
          inactiveColor: Color.fromRGBO(255, 255, 255, 0.4),
        ),
        BarItem(
          icon: CustomIcon.doc_text,
          title: 'Loans',
          activeColor: Color(0xffCEE812),
          inactiveColor: Color.fromRGBO(255, 255, 255, 0.4),
        ),
        BarItem(
          icon: CustomIcon.exchange,
          title: 'Payments',
          activeColor: Color(0xffCEE812),
          inactiveColor: Color.fromRGBO(255, 255, 255, 0.4),
        ),
        BarItem(
          icon: CustomIcon.person_outline,
          title: 'Profile',
          activeColor: Color(0xffCEE812),
          inactiveColor: Color.fromRGBO(255, 255, 255, 0.4),
        ),
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
