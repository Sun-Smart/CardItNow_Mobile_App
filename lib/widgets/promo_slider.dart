// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_print, unnecessary_string_interpolations, prefer_const_constructors_in_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/card_api.dart';
import '../api/regster_api.dart';

class TopPromoSlider extends StatefulWidget {
  TopPromoSlider({Key? key}) : super(key: key);

  @override
  State<TopPromoSlider> createState() => _TopPromoSliderState();
}

class _TopPromoSliderState extends State<TopPromoSlider> {
  final CarouselController _controller = CarouselController();
  final RegisterAPI con = Get.find();
  final CardAPI cardcons = Get.find();

  int _currentsliderindex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: CarouselSlider.builder(
                  itemCount: cardcons.creditCardGet.length,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      aspectRatio: 1.5,
                      enlargeCenterPage: true,
                      padEnds: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentsliderindex = index;
                        });
                      }),
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
                    return Obx(() => CustomeCardData(
                        id: cardcons.creditCardGet[index]['payid'].toString(),
                        customerId:
                        cardcons.creditCardGet[index]['customerid'].toString(),
                        cardDefault:
                        cardcons.creditCardGet[index]['carddefault'].toString(),
                        bankName:
                        cardcons.creditCardGet[index]['bankname'].toString(),
                        cardNumber:
                        cardcons.creditCardGet[index]['cardnumber'].toString(),
                        nameHolder:
                        cardcons.creditCardGet[index]['cardname'].toString(),
                        validity:
                        cardcons.creditCardGet[index]['expirydate'].toString()));
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cardcons.creditCardGet.asMap().entries.map((entry) {
                return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                        width: 10.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(60),
                            color: _currentsliderindex == entry.key
                                ? Color(0xff036D7A)
                                : const Color(0xffc5d2da))));
              }).toList(),
            ),
           // SizedBox(height: 20,),
          ],
        ),
      ],
    );
  }
}

class CustomeCardData extends StatelessWidget {
  final String bankName,
      cardNumber,
      nameHolder,
      validity,
      id,
      customerId,
      cardDefault;

  const CustomeCardData(
      {Key? key,
      required this.cardDefault,
      required this.bankName,
      required this.cardNumber,
      required this.nameHolder,
      required this.validity,
      required this.id,
      required this.customerId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/banner/card_01.png'))),
              child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(bankName,
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name',
                              style: TextStyle(
                                  fontFamily: 'Sora',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(nameHolder,
                                  style: TextStyle(
                                      fontFamily: 'Sora',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text(cardNumber,
                                  style: TextStyle(
                                      fontFamily: 'Sora',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xffC9E313),
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Text('Exp',
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                            SizedBox(width: 10),
                            Text(validity.substring(5, 10),
                                style: TextStyle(
                                    fontFamily: 'Sora',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ],
                        ),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
