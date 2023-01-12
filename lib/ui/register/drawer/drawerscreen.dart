import 'package:cardit/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  final AuthCon auth = Get.put(AuthCon());
  bool isselected = false;

  var type ='';
  var items =[
    "Home",
    "How it Works?",
    "Pricing",
    "Split Expensed",
    "Refer a friend",
    "About us",
    "Contact us"
  ];
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

                      auth.drawercountry.value = "CM";
                      setState(() {});
                    },
                      child: Text("Philipines",

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color:   auth.drawercountry.value == "CM"
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

                        auth.drawercountry.value = "Ds";
                        setState(() {});
                      },
                      child: Text("UAE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color:   auth.drawercountry.value == "Ds"
                              ? Color(0XFF004751)
                              : Colors.grey,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              auth.drawercountry.value == "CM"?
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

                          type = items[index];
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
                                  color: type == items[index]
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
