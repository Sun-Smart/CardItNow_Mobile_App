import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/ui/landingscreens/loans_screen.dart';
import 'package:cardit/ui/landingscreens/payments_screen.dart';
import 'package:cardit/ui/landingscreens/profile_screen.dart';
import 'package:cardit/widgets/customicons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/responsive.dart';
import '../ui/payment_method/recievermethodscreens/credit_prepaid_screen.dart';
import '../ui/payment_method/recievermethodscreens/receiver_payment_screen.dart';

class ReceiverDrawerWeb extends StatefulWidget {
  const ReceiverDrawerWeb({super.key});

  @override
  State<ReceiverDrawerWeb> createState() => _ReceiverDrawerWebState();
}

class _ReceiverDrawerWebState extends State<ReceiverDrawerWeb> {
  int _selectedindex = 0;
  final List _screens = [ CreditPrepaidScreen(), ReceiverPaymentScreen(), ReceiverPaymentScreen(),];
  @override
  Widget build(BuildContext context) {
    print("------drawer");

    return  Responsive.isDesktop(context)?Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 5,
          height: MediaQuery.of(context).size.height / 1 ,
          decoration: BoxDecoration(  color: Color(0XFF004751),),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Container(
                  child: Image.asset(
                "assets/carditlogo.png",
                width: 100,
              )),
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                  //color: Colors.green
                ),
                child: NavigationRail(
                    labelType: NavigationRailLabelType.all,
                    backgroundColor:     Color(0XFF004751),
                    onDestinationSelected: (int index) {
                      setState(() {
                        _selectedindex = index;
                      });
                    },
                    destinations: const [
                      NavigationRailDestination(
                          icon: Icon(
                            CustomIcon.credit_card,
                            color: Colors.white,
                            size: 25,
                          ),
                          label: Text(
                            "PrePaid Card",
                            selectionColor: Colors.white,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16),
                          )),
                      NavigationRailDestination(
                          icon: Icon(
                             CustomIcon.credit_card, color: Colors.white,
                            size: 25,
                          ),
                          label: Text(
                            "Payments",
                            selectionColor: Colors.white,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16),
                          )),
                      NavigationRailDestination(
                          icon: Icon(
                            CustomIcon.person_outline,
                            color: Colors.white,
                            size: 25,
                          ),
                          label: Text(
                            "Profile",
                            selectionColor: Colors.white,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    
                    ],
                    selectedIndex: _selectedindex),
              ),
            ],
          ),
        ),
        Container(
            width:MediaQuery.of(context).size.width / 1.25,
               height: MediaQuery.of(context).size.height / 1,
               decoration: BoxDecoration(
                //color: Colors.green
               ),
           
            child: 
            _screens[_selectedindex]),
          
      ],
    ): Responsive.isMobile(context)?Container():
    Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 5,
          height: MediaQuery.of(context).size.height / 1 ,
          decoration: BoxDecoration(    color: Color(0XFF004751),),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                  child: Image.asset(
                "assets/carditlogo.png",
                width: 100,
              )),
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                  color: Colors.green
                ),
                child: NavigationRail(
                    labelType: NavigationRailLabelType.all,
                    backgroundColor:      Color(0XFF004751),
                    onDestinationSelected: (int index) {
                      setState(() {
                        _selectedindex = index;
                      });
                    },
                    destinations: const [
                      NavigationRailDestination(
                          icon: Icon(
                            CustomIcon.credit_card,
                            color: Colors.white,
                            size: 25,
                          ),
                          label: Text(
                            "Prepaid Card",
                            selectionColor: Colors.white,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16),
                          )),
                      NavigationRailDestination(
                          icon: Icon(
                            CustomIcon.credit_card,
                            color: Colors.white,
                            size: 25,
                          ),
                          label: Text(
                            "Payments",
                            selectionColor: Colors.white,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16),
                          )),
                      
                      NavigationRailDestination(
                          icon: Icon(
                            CustomIcon.person_outline,
                            color: Colors.white,
                            size: 25,
                          ),
                          label: Text(
                            "Profile",
                          selectionColor: Colors.white,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16),
                          )),
                    ],
                    selectedIndex: _selectedindex),
              ),
            ],
          ),
        ),
        Container(
            width:MediaQuery.of(context).size.width / 1.25,
               height: MediaQuery.of(context).size.height / 1,
               decoration: BoxDecoration(
                //color: Colors.green
               ),
           
            child: _screens[_selectedindex])
      ],
    );
  }
}
