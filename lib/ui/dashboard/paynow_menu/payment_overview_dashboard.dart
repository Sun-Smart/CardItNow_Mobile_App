import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/ui/bank_transection/transection_summery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';



class OverviewPayment extends StatefulWidget {
  const OverviewPayment({super.key});

  @override
  State<OverviewPayment> createState() => _OverviewPaymentState();
}

class _OverviewPaymentState extends State<OverviewPayment> {
  bool isChecked = false;
  // bool selectdbank =false;
    String _selectedGender = 'VISA - **** **** 8756';
    String selectbank = 'Pay via through bank';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:Responsive.isMobile(context)? buildButton():null,
      appBar: Responsive.isMobile(context)?PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: AppBar(
              leading: BackButton(
                color: Colors.black,
              ),
              centerTitle: true,
              title: Text(
                'Payment Overview',
                style: TextStyle(
                    color: 
                         HexColor('#413D4B'),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            )),
      ):null,
      body:Responsive.isMobile(context)? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bulildcard(),
            bulildPaymentsDetails(),
            buildcardenable(),
            buildchooseCard()
            ],
        ),
      ):Responsive.isDesktop(context)?Row(
        children: [
            Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 1,
                  color: Color(0XFF004751),
                  child: Center(
                      child: Image.asset("assets/applogo-02.png",
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height / 3)),
                ),
                Container(
                   width: MediaQuery.of(context).size.width / 1.5,
                  child:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
            bulildcard(),
            bulildPaymentsDetails(),
            buildcardenable(),
            buildchooseCard()
            ],
        ),) ,
                )
        ],
      ):Row(
        children: [
            Container(
                  width: MediaQuery.of(context).size.width / 3,
                 // height: MediaQuery.of(context).size.height / 1,
                  color: Color(0XFF004751),
                  child: Center(
                      child: Image.asset("assets/applogo-02.png",
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height / 3)),
                ),
                Container(
                   width: MediaQuery.of(context).size.width / 1.5,
                  child:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
            bulildcard(),
            bulildPaymentsDetails(),
            buildcardenable(),
            buildchooseCard()
            ],
        ),) ,
                )
        ],
      ),
    ));
  }
   Widget bulildcard() {
  //  final themeChange = Provider.of<DarkThemeProvider>(context);
    return Responsive.isMobile(context)?
    Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Paying',
            style: TextStyle(
                color:
            
                   Color.fromARGB(255, 140, 140, 140),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            leading:  ClipOval(
            child: Image.asset("assets/user-img.png",
            fit: BoxFit.cover,
            width: 45.0,
            height: 45.0,
            )
            ),
            title: Text(
              'Angelo',
              style: TextStyle(
                  color:
                      //themeChange.darkTheme ? Colors.white :
                       HexColor('#000000'),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              'Invoice No. - 23344565',
              style: TextStyle(
                  color:  Color.fromARGB(255, 140, 140, 140),
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    ):Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Paying',
            style: TextStyle(
                color:
            
                   Color.fromARGB(255, 140, 140, 140),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            leading:  ClipOval(
            child: Image.asset("assets/user-img.png",
            fit: BoxFit.cover,
            width: 45.0,
            height: 45.0,
            )
            ),
            title: Text(
              'Angelo',
              style: TextStyle(
                  color:
                      //themeChange.darkTheme ? Colors.white :
                       HexColor('#000000'),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              'Invoice No. - 23344565',
              style: TextStyle(
                  color:  Color.fromARGB(255, 140, 140, 140),
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
  Widget bulildPaymentsDetails() {
    return  Responsive.isMobile(context)?Container(
      width: MediaQuery.of(context).size.width / 1,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/paymentdetails.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Total Amount Pay',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '₱ 4120',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Service changes(3%)',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              '₱ 4000',
              style: TextStyle(
                  color: Color(0XffCEE812),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
             Text(
              '+',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
             Text(
              '₱ 120',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'For Rent on 23 December\n 2022',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
       
        SizedBox(
          height: 30,
        ),
        Text(
          'TXN ID: 45879652',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'View Invoice',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
      ]),
    ):Responsive.isDesktop(context)?Container(
      width: MediaQuery.of(context).size.width / 4,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/paymentdetails.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Total Amount Pay',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '₱ 4120',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Service changes(3%)',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              '₱ 4000',
              style: TextStyle(
                  color: Color(0XffCEE812),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
             Text(
              '+',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
             Text(
              '₱ 120',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'For Rent on 23 December\n 2022',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
       
        SizedBox(
          height: 30,
        ),
        Text(
          'TXN ID: 45879652',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'View Invoice',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
      ]),
    ):Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/paymentdetails.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Total Amount Pay',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '₱ 4120',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Service changes(3%)',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              '₱ 4000',
              style: TextStyle(
                  color: Color(0XffCEE812),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
             Text(
              '+',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
             Text(
              '₱ 120',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'For Rent on 23 December\n 2022',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
       
        SizedBox(
          height: 30,
        ),
        Text(
          'TXN ID: 45879652',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'View Invoice',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
      ]),
    );
  }

Widget  buildcardenable (){
  return Responsive.isMobile(context)?Row(
    children: [
      Checkbox(
                                              activeColor: 
                                                 
                                                   Color(0xff004751),
                                              value: isChecked,
                                              onChanged: (value) {
                                                setState(() {
                                                  if (isChecked) {
                                                    isChecked = false;
                                                  } else {
                                                    isChecked = true;
                                                    // showAlertDialog(context);
                                                  }
                                                });
                                              },
                                            ),
                                            Text("Enable Recurring Payment",
                                            style: TextStyle(
                                              color: HexColor('#413D4B'),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400
                                            ),)
                                         
    ],
  ):Responsive.isDesktop(context)?Container(
    width: MediaQuery.of(context).size.width/4,
    child: Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10,),
        Checkbox(
                                                activeColor: 
                                                   
                                                     Color(0xff004751),
                                                value: isChecked,
                                                onChanged: (value) {
                                                  setState(() {
                                                    if (isChecked) {
                                                      isChecked = false;
                                                    } else {
                                                      isChecked = true;
                                                      // showAlertDialog(context);
                                                    }
                                                  });
                                                },
                                              ),
                                              Text("Enable Recurring Payment",
                                              style: TextStyle(
                                                color: HexColor('#413D4B'),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400
                                              ),)
                                           
      ],
    ),
  ):Container(
    width: MediaQuery.of(context).size.width/2,
    child: Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10,),
        Checkbox(
                                                activeColor: 
                                                   
                                                     Color(0xff004751),
                                                value: isChecked,
                                                onChanged: (value) {
                                                  setState(() {
                                                    if (isChecked) {
                                                      isChecked = false;
                                                    } else {
                                                      isChecked = true;
                                                      // showAlertDialog(context);
                                                    }
                                                  });
                                                },
                                              ),
                                              Text("Enable Recurring Payment",
                                              style: TextStyle(
                                                color: HexColor('#413D4B'),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400
                                              ),)
                                           
      ],
    ),
  );
}

 Widget  buildchooseCard(){
  return Responsive.isMobile(context)?Padding(
    padding: const EdgeInsets.only(left: 12,top: 10),
    child: Column(
      children: [
  Row(children: [
    Text("Choose Card",
    style: TextStyle(
      color: HexColor('#1B1B1B'),
      fontSize: 14,
      fontWeight: FontWeight.w500
    ),),
    SizedBox(width: 10,),
    
    GestureDetector(
      onTap: (){},
      child: Row(
        children: [
          Icon(Icons.add,
          color:HexColor('#036D7A') ,
          size: 18,),
           Text("Add New Card",
      style: TextStyle(
         color:HexColor('#036D7A') ,
         fontSize: 12,
         fontWeight: FontWeight.w400
      ),)
        ],
      ),
    ),
   
  ],),
    buildaddcard()      
      ],
    ),
  ): Responsive.isDesktop(context)?Container(
    width: MediaQuery.of(context).size.width/4,
    child: Padding(
      padding: const EdgeInsets.only(top: 10,left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
    Row(
     // mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text("Choose Card",
      style: TextStyle(
        color: HexColor('#1B1B1B'),
        fontSize: 14,
        fontWeight: FontWeight.w500
      ),),
      SizedBox(width: 10,),
      
      GestureDetector(
        onTap: (){},
        child: Row(
          children: [
            Icon(Icons.add,
            color:HexColor('#036D7A') ,
            size: 18,),
             Text("Add New Card",
        style: TextStyle(
           color:HexColor('#036D7A') ,
           fontSize: 12,
           fontWeight: FontWeight.w400
        ),)
          ],
        ),
      ),
     
    ],),
      buildaddcard()      
        ],
      )),
  ):Container(
    width: MediaQuery.of(context).size.width/2,
    child: Padding(
      padding: const EdgeInsets.only(top: 10,left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
    Row(
     // mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text("Choose Card",
      style: TextStyle(
        color: HexColor('#1B1B1B'),
        fontSize: 14,
        fontWeight: FontWeight.w500
      ),),
      SizedBox(width: 10,),
      
      GestureDetector(
        onTap: (){},
        child: Row(
          children: [
            Icon(Icons.add,
            color:HexColor('#036D7A') ,
            size: 18,),
             Text("Add New Card",
        style: TextStyle(
           color:HexColor('#036D7A') ,
           fontSize: 12,
           fontWeight: FontWeight.w400
        ),)
          ],
        ),
      ),
     
    ],),
      buildaddcard()      
        ],
      )),
  );
 }
 Widget buildaddcard(){
  return  Responsive.isMobile(context)?Column(
    children: [
           ListTile(
            
                leading: Radio<String>(
                  
                  activeColor:HexColor('#036D7A'),
                  value: 'VISA - **** **** 8756',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                title:  Text('VISA - **** **** 8756',
                style: TextStyle(
                  color: HexColor('#2C3A4B'),
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),),
              ),
              ListTile(
              
                leading: Radio<String>(
                 activeColor:HexColor('#036D7A'),
                  value: 'Master Card - **** **** 1265',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                title: Text('Master Card - **** **** 1265',
                  style: TextStyle(
                  color: HexColor('#2C3A4B'),
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),),
              ),

      ListTile(

        leading: Radio<String>(

          activeColor:HexColor('#036D7A'),
          value: 'Master Card - **** **** 2265',
          groupValue: _selectedGender,
          onChanged: (value) {
            setState(() {
              _selectedGender = value!;
              Get.offAll(()=>TransectionSummeryScreen());
            });
          },
        ),
        title:  Text('Pay via through bank',
          style: TextStyle(
              color: HexColor('#2C3A4B'),
              fontSize: 14,
              fontWeight: FontWeight.w400
          ),),
      ),

    ],
  ):Responsive.isDesktop(context)?Container(
    width: MediaQuery.of(context).size.width/4,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
             ListTile(
              
                  leading: Radio<String>(
                    
                    activeColor:HexColor('#036D7A'),
                    value: 'VISA - **** **** 8756',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                  title:  Text('VISA - **** **** 8756',
                  style: TextStyle(
                    color: HexColor('#2C3A4B'),
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),),
                ),
                ListTile(
                
                  leading: Radio<String>(
                   activeColor:HexColor('#036D7A'),
                    value: 'Master Card - **** **** 1265',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                  title: Text('Master Card - **** **** 1265',
                    style: TextStyle(
                    color: HexColor('#2C3A4B'),
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),),
                ),
  
        ListTile(
  
          leading: Radio<String>(
  
            activeColor:HexColor('#036D7A'),
            value: 'Master Card - **** **** 2265',
            groupValue: _selectedGender,
            onChanged: (value) {
              setState(() {
                _selectedGender = value!;
                Get.offAll(()=>TransectionSummeryScreen());
              });
            },
          ),
          title:  Text('Pay via through bank',
            style: TextStyle(
                color: HexColor('#2C3A4B'),
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),),
        ),
  
   Container(
     child: SwipeButton(
            width:
              
                  MediaQuery.of(context).size.width / 4,
                   
            activeThumbColor: const Color(0XFFCEE812),
            thumbPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            borderRadius: BorderRadius.circular(3),
            activeTrackColor: const Color(0XFF004751),
            height: 60,
            child: const Text("Swipe to Apply",
                style: TextStyle(
                    fontFamily: "assets/fonts/Sora.ttf",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFFCEE812))),
            onSwipe: () {
              Navigator.of(context).pushNamed('/paymentsuccess');
            }),
   ),
      ],
    ),
  ):Container(
    width: MediaQuery.of(context).size.width/2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
             ListTile(
              
                  leading: Radio<String>(
                    
                    activeColor:HexColor('#036D7A'),
                    value: 'VISA - **** **** 8756',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                  title:  Text('VISA - **** **** 8756',
                  style: TextStyle(
                    color: HexColor('#2C3A4B'),
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),),
                ),
                ListTile(
                
                  leading: Radio<String>(
                   activeColor:HexColor('#036D7A'),
                    value: 'Master Card - **** **** 1265',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                  title: Text('Master Card - **** **** 1265',
                    style: TextStyle(
                    color: HexColor('#2C3A4B'),
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),),
                ),
  
        ListTile(
  
          leading: Radio<String>(
  
            activeColor:HexColor('#036D7A'),
            value: 'Master Card - **** **** 2265',
            groupValue: _selectedGender,
            onChanged: (value) {
              setState(() {
                _selectedGender = value!;
                Get.offAll(()=>TransectionSummeryScreen());
              });
            },
          ),
          title:  Text('Pay via through bank',
            style: TextStyle(
                color: HexColor('#2C3A4B'),
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),),
        ),
  
   Container(
     child: SwipeButton(
            width:
              
                  MediaQuery.of(context).size.width / 2,
            activeThumbColor: const Color(0XFFCEE812),
            thumbPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            borderRadius: BorderRadius.circular(3),
            activeTrackColor: const Color(0XFF004751),
            height: 60,
            child: const Text("Swipe to Apply",
                style: TextStyle(
                    fontFamily: "assets/fonts/Sora.ttf",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFFCEE812))),
            onSwipe: () {
              Navigator.of(context).pushNamed('/paymentsuccess');
            }),
   ),
      ],
    ),
  );
 }
  Widget buildButton() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SwipeButton(
          width: Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width / 1
              : Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width / 4.4
                  : MediaQuery.of(context).size.width / 2.5,
          activeThumbColor: const Color(0XFFCEE812),
          thumbPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          borderRadius: BorderRadius.circular(3),
          activeTrackColor: const Color(0XFF004751),
          height: 60,
          child: const Text("Swipe to Apply",
              style: TextStyle(
                  fontFamily: "assets/fonts/Sora.ttf",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFFCEE812))),
          onSwipe: () {
            Navigator.of(context).pushNamed('/paymentsuccess');
          }),
    );
  }

  }
