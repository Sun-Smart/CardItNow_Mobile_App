
import 'package:cardit/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../api/regster_api.dart';
import '../../const/responsive.dart';
import '../register/register_screen.dart';

class Country extends StatefulWidget {
  final choosetype;
   Country({Key? key,this.choosetype}) : super(key: key);

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
  final RegisterAPI con = Get.find();
  var countryList = [
    {
      "img":'assets/uae.png',
      "type":'UAE'
    },
    {
      "img":'assets/phli.png',
      "type":'Philippines'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: HexColor('#004751'),
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),

                SvgPicture.asset('assets/lodaingimg.svg',
                    width: 230, height: 65),
                SizedBox(
                  height: 30,
                ),
                Text("${"Make your life simple"}",
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
                                  if (con.dropdownvalue != null) {
                                    con.docselect();
                                    if (widget.choosetype == "Login") {
                                      Get.off(Login());
                                    } else {
                                      Get.off(Register());
                                    }
                                  }
                                }

                                );

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
                                                child: Image.asset(countryList[index]['img']!,
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
              ],
            ),
          )),
    );
  }
}
