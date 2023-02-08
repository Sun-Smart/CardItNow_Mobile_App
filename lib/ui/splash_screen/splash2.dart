import 'package:cardit/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../responsive/responsive.dart';
import '../../widgets/auth_button.dart';
import '../register/register_screen.dart';
import '../startingscreen/home_screen.dart';

class splash2 extends StatefulWidget {
  const splash2({Key? key}) : super(key: key);

  @override
  State<splash2> createState() => _splash2State();
}

class _splash2State extends State<splash2> {
  @override

  var type = '';

  var country=[
    {
      "img":'assets/uae.png',
      "type":'UAE'
    },
    {
      "img":'assets/phli.png',
      "type":'Philippines'
    },

  ];
  final AuthCon con=Get.find();
  // void initState() {
  //   super.initState();
  //   _navigation();
  // }

  // _navigation() async {
  //   await Future.delayed(const Duration(milliseconds: 3400), () {});
  //   if (GetStorage().read('token') == null) {
  //     Get.toNamed('/home');
  //   } else {
  //     Get.toNamed('/dashbordScreen');
  //   }
  // }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: HexColor('#004751'),
          body: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),

                SvgPicture.asset('assets/lodaingimg.svg',
                    width: 230, height: 65),
                SizedBox(
                  height: 30,
                ),
                Text("${"MAKE  YOUR  LIFE  EASY"}",
                  style: TextStyle(
                      fontSize: 15, color: Colors.white,
                      fontFamily: 'sora'
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Text("${"Select Your Region"}",
                  style: TextStyle(
                      fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold,
                      fontFamily: 'sora'
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Container(
                  width: Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.width / 1
                      : Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 4.3
                      : MediaQuery.of(context).size.width / 2.5,
                  child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      itemCount: con.pickcountry.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return
                          SingleChildScrollView(
                            child: InkWell(
                              hoverColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  con.dropdownvalue = con.pickcountry[index];
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 5),

                                child: Card(
                                  elevation: 0,
                                  color: con.dropdownvalue != null && (con.pickcountry[index]["geoid"] == con.dropdownvalue["geoid"])
                                    ? HexColor('#CEE812')
                                      : Colors.white12,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              const SizedBox(height: 10,width:10),
                                              Center(
                                                child: Image.asset(country[index]['img']!,
                                                    width:Responsive.isMobile(context)? 100:50, height:Responsive.isMobile(context)? 100:50),
                                              ),
                                              const SizedBox(height: 10),
                                              const SizedBox(width: 20),
                                              Text(con.pickcountry[index]['geoname'],
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,color:
                                                  con.dropdownvalue != null && (con.pickcountry[index]["geoid"] ==  con.dropdownvalue["geoid"])?
                                                  HexColor('#004751'):Colors.lightGreen,
                                                      fontSize: 20)),
                                              const SizedBox(height: 10),
                                            ],
                                          ),
                                        ],
                                      )),
                                ),

                              ),
                            ),
                          );
                      }),
                ),
                const Spacer(),
                if (con.dropdownvalue != null)
                AuthButton(
                    decoration: BoxDecoration(
                      color: HexColor('#CEE812'),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onTap: () {
                      Get.to(Register());
                    },
                    text: "Next",
                  ),
              ],
            ),
          )),
    );
  }
}
