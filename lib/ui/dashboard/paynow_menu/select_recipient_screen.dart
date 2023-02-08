import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../responsive/responsive.dart';

class RecipientType extends StatefulWidget {
  const RecipientType({super.key});

  @override
  State<RecipientType> createState() => _RecipientTypeState();
}

class _RecipientTypeState extends State<RecipientType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)?AppBar(
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text("Select Type of Payee",
            style: TextStyle(
              color: Color(0xFF413D4B),
              fontSize: 14,
              fontFamily: "Sora",
              fontWeight: FontWeight.w600,
            )),
      ):null,
      body: Responsive.isMobile(context)?Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          individualrecipient(),
          const SizedBox(
            height: 20,
          ),
          registeredrecipient()
        ],
      ):Responsive.isDesktop(context)?
      Row(
        children: [
          Container(
             width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 1,
                        color: Color(0XFF004751),
                        child: Center(
                            child: Image.asset("assets/applogo-02.png",
                                width: MediaQuery.of(context).size.width / 1.5, height:  MediaQuery.of(context).size.height / 3
                              )),
          ),
             Container(
               width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 1,
               child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                     
                       Row(
                         children: [
                           const BackButton(
          color: Colors.black,
        ),
                         ],
                       ),
       const SizedBox(height: 30,),
         
                    const    Text("Select Type of Payee",
            style: TextStyle(
              color: Color(0xFF413D4B),
              fontSize: 20,
              fontFamily: "Sora",
              fontWeight: FontWeight.w600,
            )),
           const  SizedBox(
                         height: 30,
                       ),
                       individualrecipient(),
                       const SizedBox(
                         height: 20,
                       ),
                      registeredrecipient()
                     ],
                   ),
             ),
   
        ],
      ):Row(
        children: [
          Container(
             width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 1,
                        color: Color(0XFF004751),
                        child: Center(
                            child: Image.asset("assets/applogo-02.png",
                                width: MediaQuery.of(context).size.width / 1.5, height:  MediaQuery.of(context).size.height / 3
                              )),
          ),
             Container(
               width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 1,
               child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       
                         Row(
                         children: [
                           const BackButton(
          color: Colors.black,
        ),
                         ],
                       ),
                       const SizedBox(
                         height: 50,
                       ),
                       const Text("Select Type of Payee",
            style: TextStyle(
              color: Color(0xFF413D4B),
              fontSize: 20,
              fontFamily: "Sora",
              fontWeight: FontWeight.w600,
            )),
           const  SizedBox(
                         height: 50,
                       ),
                       individualrecipient(),
                       const SizedBox(
                         height: 20,
                       ),
                      registeredrecipient()
                     ],
                   ),
             ),
   
        ],
      )
    );
  }
 
  Widget individualrecipient() {
    return  Responsive.isMobile(context)?GestureDetector(
      
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: const Color(0xFFE5E5E5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Individual Payee",
                      style: TextStyle(
                          color: HexColor('#004751'),
                          fontFamily: "Sora",
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: const [
                    Flexible(
                      child: Text(
                        "Pay to Recipient like Landloards , Tution Teachers etc.",
                        style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(65, 61, 75, 0.5)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/selectdocuments');
      },
    ):Responsive.isDesktop(context)?GestureDetector(
      
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 6.5,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: const Color(0xFFE5E5E5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Individual Payee",
                      style: TextStyle(
                          color: HexColor('#004751'),
                          fontFamily: "Sora",
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: const [
                    Flexible(
                      child: Text(
                        "Pay to Recipient like Landloards , Tution Teachers etc.",
                        style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(65, 61, 75, 0.5)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/selectdocuments');
      },
    ):GestureDetector(
      
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 6,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: const Color(0xFFE5E5E5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Individual Payee",
                      style: TextStyle(
                          color: HexColor('#004751'),
                          fontFamily: "Sora",
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: const [
                    Flexible(
                      child: Text(
                        "Pay to Recipient like Landloards , Tution Teachers etc.",
                        style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(65, 61, 75, 0.5)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/selectdocuments');
      },
    );
  }

  Widget registeredrecipient() {
    return Responsive.isMobile(context)?GestureDetector(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: const Color(0xFFE5E5E5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Registered Payees",
                      style: TextStyle(
                          color: HexColor('#004751'),
                          fontFamily: "Sora",
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: const [
                    Flexible(
                      child: Text(
                        "Pay to Payees like Insurance, Education.",
                        style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(65, 61, 75, 0.5)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ):Responsive.isDesktop(context)?GestureDetector(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 6.5,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: const Color(0xFFE5E5E5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Registered Payees",
                      style: TextStyle(
                          color: HexColor('#004751'),
                          fontFamily: "Sora",
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: const [
                    Flexible(
                      child: Text(
                        "Pay to Payees like Insurance, Education.",
                        style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(65, 61, 75, 0.5)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ):GestureDetector(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 6,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: const Color(0xFFE5E5E5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Registered Payees",
                      style: TextStyle(
                          color: HexColor('#004751'),
                          fontFamily: "Sora",
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: const [
                    Flexible(
                      child: Text(
                        "Pay to Payees like Insurance, Education.",
                        style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(65, 61, 75, 0.5)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
