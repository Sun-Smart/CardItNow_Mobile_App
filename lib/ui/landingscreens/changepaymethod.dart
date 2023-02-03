import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class changepaymethod extends StatefulWidget {
  const changepaymethod({Key? key}) : super(key: key);

  @override
  State<changepaymethod> createState() => _changepaymethodState();
}
String slectpay = "reciever";
var paymethod = '';

var country=[
  {

    "type":'Reciever'
  },
  {

    "type":'Both'
  },
];

class _changepaymethodState extends State<changepaymethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#004751'),
      appBar: AppBar(
        backgroundColor: HexColor('#004751'),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Change Your Payment Method",
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold
        ),
        ),
      ),
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
              height: 40,
            ),
            Text("${"Choose Your Payment Method"}",
              style: TextStyle(
                  fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold,
                  fontFamily: 'sora'
              ),
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
                        child: GestureDetector(
                          // hoverColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              paymethod = country[index]['type']!;


                            });
                          },
                          child: Container(
                            height: 80,
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 5),

                            child: Card(
                              elevation: 0,
                              color: paymethod == country[index]['type']
                                  ? HexColor('#CEE812')
                                  : Colors.white12,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(width: 20),
                                       Center(
                                         child:  Text(country[index]['type']!,
                                             textAlign: TextAlign.center,
                                             style: TextStyle(

                                                 fontWeight: FontWeight.bold,color:
                                             paymethod == country[index]['type']?
                                             HexColor('#004751'):Colors.lightGreen,
                                                 fontSize: 20)),
                                       ),

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
            // if (paymethod != '')
            //   AuthButton(
            //     decoration: BoxDecoration(
            //       color: HexColor('#CEE812'),
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //     onTap: () {
            //       // Get.to(Register());
            //     },
            //     text: "Next",
            //   ),
          ],
        ),
      )
    );
  }
}
