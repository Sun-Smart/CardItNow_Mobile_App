import 'package:cardit/auth/auth.dart';
import 'package:cardit/ui/startingscreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

var drawerselection ='';
var items =[
  "Home",
  "How it Works?",
  "Pricing",
  "Split Expensed",
  "Refer a friend",
  "About us",
  "Contact us"
];
class drawer extends StatefulWidget {
  final ItemScrollController controller;
  const drawer({Key? key, required this.controller}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {

  // final ItemScrollController itemScrollController = ItemScrollController();
  // final ItemPositionsListener itemPositionsListener =
  // ItemPositionsListener.create();


  bool isselected = false;





  final AuthCon con = Get.put(AuthCon());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){

                      con.drawercountry.value = "CM";
                      setState(() {});
                    },
                      child: Text("Philipines",

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color:   con.drawercountry.value == "CM"
                              ? Color(0XFF004751)
                              : Colors.grey,
                        ),

                      )),

                  SizedBox(
                    width: 10,
                  ),

                  Text("I"),

                  SizedBox(
                    width: 10,
                  ),

                  GestureDetector(
                      onTap: (){

                        con.drawercountry.value = "Ds";
                        setState(() {});
                      },
                      child: Text("UAE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color:   con.drawercountry.value == "Ds"
                              ? Color(0XFF004751)
                              : Colors.grey,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              con.drawercountry.value == "CM"?
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  itemCount: items.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                            print(items[index] );

                            widget.controller.scrollTo(
                              index:index==0?0:index+1,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeInOutCubic);

                          drawerselection = items[index];
                         Get.back();

                        });
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height:50,
                            child: Text(
                              items[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Sora',
                                  fontSize: 16,
                                  color: drawerselection == items[index]
                              ? Color(0XFF004751)
                                : Colors.black,

                              ),
                            ),
                          ),


                        ],
                      ),
                    );
                  }):Container()



            ],
          ),
      ),
    );
  }
}
