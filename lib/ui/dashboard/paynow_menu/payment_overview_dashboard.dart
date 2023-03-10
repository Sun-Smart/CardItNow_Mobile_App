import 'package:cardit/api/payment_api.dart';
import 'package:cardit/const/responsive.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../api/card_api.dart';
import '../../../api/regster_api.dart';
import '../../payment_method/add_credit_card.dart';



class OverviewPayment extends StatefulWidget {
  var paymentType;
  var payee;
  var purpose;
  var purposeResponse;
  var payment;
  var paymentResponse;
   OverviewPayment({super.key, this.paymentType,this.payee, this.purpose, this.purposeResponse, this.payment, this.paymentResponse});

  @override
  State<OverviewPayment> createState() => _OverviewPaymentState();
}

class _OverviewPaymentState extends State<OverviewPayment> {
  PaymentAPI pay = PaymentAPI();
  CardAPI card = Get.put(CardAPI());
  RegisterAPI reg = RegisterAPI();
  bool isChecked = false;
  bool isFeeCheck = false;
  bool cardLoading = true;
  var selectPaymentType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assignCardFunction();
  }

  assignCardFunction() {
  setState(() {
    cardLoading = true;
  });
    card.creditCardgetAPI().then((value){
     card.creditCardGet.forEach((element) {
       if(element["carddefault"] == 0){
         selectPaymentType = element["payid"].toString();
       }
     });
     setState(() {
       cardLoading = false;
     });
   });
  }

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
                    height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/logoweb.png",
                            width: 150, height: 90),
                        SizedBox(height: 15),
                        Text(
                          '"Make your life simple"',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'sora'),
                        ),
                      ],
                    )),
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
                    height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/logoweb.png",
                            width: 150, height: 90),
                        SizedBox(height: 15),
                        Text(
                          '"Make your life simple"',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'sora'),
                        ),
                      ],
                    )),
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
            widget.paymentResponse["paystatus"] ?? "",
            style: TextStyle(
                color:
            
                   Color.fromARGB(255, 140, 140, 140),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            leading:  ClipOval(
                child: widget.paymentType == "LGU" ?
                Image.asset("assets/logouser.png",
                  fit: BoxFit.cover,
                  width: 45.0,
                  height: 45.0,
                ):
                widget.paymentType == "House"
               && widget.purpose["payee"]["defaultavatar"] != null
                    ? Image.network("${widget.purpose["payee"]["defaultavatar"]}",
                  fit: BoxFit.cover,
                  width: 45.0,
                  height: 45.0,
                ) :Text(reg.getInitials(widget.paymentType == "House"
                    ? "${widget.purpose["payee"]["firstname"]}"
                : "${widget.purpose["owner"]}"),
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.bold,
                        color: HexColor('#036D7B'),
                        fontSize: 16))
            ),
            title: Text(
              widget.paymentType == "LGU"
              ? widget.purposeResponse["KEYVALUE"]["Declared Owner"] ?? ""
              : widget.paymentType == "House"
              ? widget.purpose["payee"]["firstname"]
              : widget.purpose["owner"],
              style: TextStyle(
                  color:
                      //themeChange.darkTheme ? Colors.white :
                       HexColor('#000000'),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
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
            widget.paymentResponse["paystatus"] ?? "",
            style: TextStyle(
                color:
            
                   Color.fromARGB(255, 140, 140, 140),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            leading:  ClipOval(
                child: widget.paymentType == "LGU" ?
                Image.asset("assets/logouser.png",
                  fit: BoxFit.cover,
                  width: 45.0,
                  height: 45.0,
                ):
                widget.paymentType == "House"
                    && widget.purpose["payee"]["defaultavatar"] != null
                    ? Image.network("${widget.purpose["payee"]["defaultavatar"]}",
                  fit: BoxFit.cover,
                  width: 45.0,
                  height: 45.0,
                ) :Text(reg.getInitials(widget.paymentType == "House"
                    ? "${widget.purpose["payee"]["firstname"]}"
                    : "${widget.purpose["owner"]}"))
            ),
            title: Text(
              widget.paymentType == "LGU"
                  ? widget.purposeResponse["KEYVALUE"]["Declared Owner"] ?? ""
                  : widget.paymentType == "House"
                  ? widget.purpose["payee"]["firstname"]
                  : widget.purpose["owner"],
              style: TextStyle(
                  color:
                      //themeChange.darkTheme ? Colors.white :
                       HexColor('#000000'),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
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
          'Total Amount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '${widget.paymentResponse["CC_totalamount"]??''}',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Net Payable Amount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Text(
              '${widget.paymentResponse["billamount"]} + ${widget.paymentResponse["CC_carditnowfee"]} = ${widget.paymentResponse["CC_totalamount"]}',
              style: TextStyle(
                  color: Color(0XffCEE812),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(onPressed: (){
              setState(() {
                if(isFeeCheck){
                  isFeeCheck = false;
                } else {
                  isFeeCheck = true;
                }
              });
            }, icon: Icon(Icons.announcement_outlined, color: Colors.white,))
          ],
        ),
        if(isFeeCheck)
        Column(
          children: [
            Text(
              '${widget.paymentResponse["feereason"]}',
              style: TextStyle(
                  color: Color(0Xff99B5B9),
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          widget.paymentType == "LGU"
    ? 'For ${widget.purpose["purpose"]["masterdatadescription"]??''} on ${DateFormat("dd-MMM-yyyy").format(DateTime.now())}'
    : widget.paymentType == "House"
         ? 'For ${widget.purpose["purpose"]["description"]??''} on ${DateFormat("dd-MMM-yyyy").format(DateTime.now())}'
          : 'For ${widget.purpose["purpose"]??''} on ${DateFormat("dd-MMM-yyyy").format(DateTime.now())}',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'View Invoice/Contract',
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
          'Total Amount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '${widget.paymentResponse["CC_totalamount"]??''}',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Net Payable Amount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Text(
              '${widget.paymentResponse["billamount"]} + ${widget.paymentResponse["CC_carditnowfee"]} = ${widget.paymentResponse["CC_totalamount"]}',
              style: TextStyle(
                  color: Color(0XffCEE812),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(onPressed: (){
              setState(() {
                if(isFeeCheck){
                  isFeeCheck = false;
                } else {
                  isFeeCheck = true;
                }
              });
            }, icon: Icon(Icons.announcement_outlined, color: Colors.white))
          ],
        ),
        if(isFeeCheck)
          Column(
            children: [
              Text(
                '${widget.paymentResponse["feereason"]}',
                style: TextStyle(
                    color: Color(0Xff99B5B9),
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        SizedBox(
          height: 20,
        ),
        Text(
          widget.paymentType == "LGU"
              ? 'For ${widget.purpose["purpose"]["masterdatadescription"]??''} on ${DateFormat("dd-MMM-yyyy").format(DateTime.now())}'
              : widget.paymentType == "House"
              ? 'For ${widget.purpose["purpose"]["description"]??''} on ${DateFormat("dd-MMM-yyyy").format(DateTime.now())}'
              : 'For ${widget.purpose["purpose"]??''} on ${DateFormat("dd-MMM-yyyy").format(DateTime.now())}',

          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'View  Invoice/Contract',
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
          'Total Amount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '${widget.paymentResponse["CC_totalamount"]??''}',
          style: TextStyle(
              color: Color(0XffCEE812),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Net Payable Amount',
          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Text(
              '${widget.paymentResponse["billamount"]} + ${widget.paymentResponse["CC_carditnowfee"]} = ${widget.paymentResponse["CC_totalamount"]}',
              style: TextStyle(
                  color: Color(0XffCEE812),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(onPressed: (){
              setState(() {
                if(isFeeCheck){
                  isFeeCheck = false;
                } else {
                  isFeeCheck = true;
                }
              });
            }, icon: Icon(Icons.announcement_outlined, color:  Colors.white,))
          ],
        ),
        if(isFeeCheck)
          Column(
            children: [
              Text(
                '${widget.paymentResponse["feereason"]}',
                style: TextStyle(
                    color: Color(0Xff99B5B9),
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        SizedBox(
          height: 20,
        ),
        Text(
          widget.paymentType == "LGU"
              ? 'For ${widget.purpose["purpose"]["masterdatadescription"]??''} on ${DateFormat("dd-MMM-yyyy").format(DateTime.now())}'
              : widget.paymentType == "House"
              ? 'For ${widget.purpose["purpose"]["description"]??''} on ${DateFormat("dd-MMM-yyyy").format(DateTime.now())}'
              : 'For ${widget.purpose["purpose"]??''} on ${DateFormat("dd-MMM-yyyy").format(DateTime.now())}',

          style: TextStyle(
              color: Color(0Xff99B5B9),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'View  Invoice/Contract',
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
  return widget.paymentType != "LGU"
   ? Responsive.isMobile(context)?Row(
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

                                                    datePickerForDate().then((value){
                                                      if(value != null){
                                                        isChecked = true;
                                                      } else{
                                                        isChecked = false;
                                                      }
                                                    });
                                                  }
                                                });
                                              },
                                            ),
                                            Text("Schedule Payment",
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
                                              Text("Schedule PaymentPayment",
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
                                              Text("Schedule Payment",
                                              style: TextStyle(
                                                color: HexColor('#413D4B'),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400
                                              ),)
                                           
      ],
    ),
  ) : Container();
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
      onTap: (){
        Get.to(() =>
            AddCreditCardPage())?.then((value){
          assignCardFunction();
        });
      },
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
        onTap: (){
          Get.to(() =>
              AddCreditCardPage())?.then((value){
            assignCardFunction();
          });
        },
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
        onTap: (){
          Get.to(() =>
              AddCreditCardPage())?.then((value){
            assignCardFunction();
          });
        },
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
  return !cardLoading
   ? Responsive.isMobile(context)?Column(
    children: [
      for(int i = 0; i < card.creditCardGet.length; i++)
           ListTile(
                leading: Radio<String>(
                  activeColor:HexColor('#036D7A'),
                  value: card.creditCardGet[i]["payid"].toString(),
                  groupValue: selectPaymentType,
                  onChanged: (value) {
                    setState(() {
                      selectPaymentType = value!;
                    });
                  },
                ),
                title:  Text('${card.creditCardGet[i]["cardname"]} - ${card.creditCardGet[i]["cardnumber"]}',
                style: TextStyle(
                  color: HexColor('#2C3A4B'),
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),),
              ),
    ],
  ):Responsive.isDesktop(context)
      ?Container(
    width: MediaQuery.of(context).size.width/4,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i = 0; i < card.creditCardGet.length; i++)
          ListTile(
            leading: Radio<String>(
              activeColor:HexColor('#036D7A'),
              value: card.creditCardGet[i]["payid"].toString(),
              groupValue: selectPaymentType,
              onChanged: (value) {
                setState(() {
                  selectPaymentType = value!;
                });
              },
            ),
            title:  Text('${card.creditCardGet[i]["cardname"]} - ${card.creditCardGet[i]["cardnumber"]}',
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
            child:  Text(
              widget.paymentType == "Receive"
   ? "SWIPE TO REQUEST"
       : "SWIPE TO PAY",
                style: TextStyle(
                    fontFamily: "assets/fonts/Sora.ttf",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFFCEE812))),
            onSwipe: () {

              pay.locationPermission().then((va){
                if(va){
                  pay.finalPaymentAPI(widget.paymentType, widget.payee, widget.purpose,  widget.payment, widget.paymentResponse, widget.purposeResponse);
                }
              });

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
        for(int i = 0; i < card.creditCardGet.length; i++)
          ListTile(
            leading: Radio<String>(
              activeColor:HexColor('#036D7A'),
              value: card.creditCardGet[i]["payid"].toString(),
              groupValue: selectPaymentType,
              onChanged: (value) {
                setState(() {
                  selectPaymentType = value!;
                });
              },
            ),
            title:  Text('${card.creditCardGet[i]["cardname"]} - ${card.creditCardGet[i]["cardnumber"]}',
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
            child:  Text( widget.paymentType == "Receive"
                ? "SWIPE TO REQUEST"
             : "SWIPE TO PAY"
                ,
                style: TextStyle(
                    fontFamily: "assets/fonts/Sora.ttf",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFFCEE812))),
            onSwipe: () {

              pay.locationPermission().then((va){
                if(va){
                  pay.finalPaymentAPI(widget.paymentType, widget.payee, widget.purpose,  widget.payment, widget.paymentResponse, widget.purposeResponse);
                }
              });

            }),
   ),
      ],
    ),
  ) : Center(
    child: CircularProgressIndicator(color: HexColor('#036D7A'),),
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
          child:  Text( widget.paymentType == "Receive"
              ? "SWIPE TO REQUEST"
              : "SWIPE TO PAY",
              style: TextStyle(
                  fontFamily: "assets/fonts/Sora.ttf",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFFCEE812))),
          onSwipe: () {
            pay.locationPermission().then((va){
              if(va){
                pay.finalPaymentAPI(widget.paymentType, widget.payee, widget.purpose,  widget.payment, widget.paymentResponse, widget.purposeResponse);
              }
            });

          }),
    );
  }


  datePickerForDate() async{
    DateTime? date = DateTime(1900);
    FocusScope.of(context).requestFocus(new FocusNode());
    date = (await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: HexColor('#004751'),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary:
                HexColor('#004751'), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 18),));
    return date;
  }

  }
