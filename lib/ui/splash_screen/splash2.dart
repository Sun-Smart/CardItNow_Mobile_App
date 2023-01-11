import 'package:cardit/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../responsive/responsive.dart';
import '../../widgets/auth_button.dart';
import '../register/register_screen.dart';

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
      "img":'assets/phli.png',
      "type":'Philippines'
    },
    {
      "img":'assets/uae.png',
      "type":'UAE'
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
                  height: 30,
                ),
                Container(
                  width: Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.width / 1
                      : Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 4.3
                      : MediaQuery.of(context).size.width / 2.5,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      itemCount: country.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return
                          SingleChildScrollView(
                            child: InkWell(
                              hoverColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  type = country[index]['type']!;
                                  print(type);
                                  if(type=='UAE'){
                                    con.isUAE.value=true;
                                  }else{
                                    con.isUAE.value=false;

                                  }

                                });
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(80, 20, 80, 20),
                                child: Card(
                                  elevation: 0,
                                  color: type == country[index]['type']
                                      ? HexColor('#CEE812')
                                      : Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              const SizedBox(height: 10),
                                              Image.asset(country[index]['img']!,
                                                  width:Responsive.isMobile(context)? 100:50, height:Responsive.isMobile(context)? 100:50),
                                              const SizedBox(height: 10),
                                              Text(country[index]['type']!,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16)),
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
                if (type != '')
                //   Container(
                //     width: Responsive.isMobile(context)
                //         ? MediaQuery.of(context).size.width / 1
                //         : Responsive.isDesktop(context)
                //             ? MediaQuery.of(context).size.width / 4.3
                //             : MediaQuery.of(context).size.width / 2.5,
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 10),
                //       child: Row(
                //         mainAxisAlignment: Responsive.isMobile(context)
                //             ? MainAxisAlignment.center
                //             : MainAxisAlignment.center,
                //         children: [
                //           SizedBox(
                //             height: 55,
                //             child: ElevatedButton(
                //             style: ElevatedButton.styleFrom(
                //                 backgroundColor: HexColor('#CEE812'),
                //                 textStyle: const TextStyle(
                //                     fontSize: 18, fontWeight: FontWeight.bold)),
                //             onPressed: () {
                //               Get.to(Register());


                //             },
                //             child: Text(
                //               "CONFIRM",
                //               style: TextStyle(
                //                 fontFamily: 'ProductSans',
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.bold,
                //                 color: HexColor('#004751'),
                //               ),
                //             )),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // //const SizedBox(height: 30),
                  AuthButton(
                    decoration: BoxDecoration(
                      color: HexColor('#CEE812'),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onTap: () {
                      Get.to(Register());
                    },
                    text: "Next",
                  )
              ],
            ),
          )),
    );
  }
}
