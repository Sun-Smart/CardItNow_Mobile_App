// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_print, unnecessary_string_interpolations, prefer_const_constructors_in_immutables

import 'package:cardit/auth/auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopPromoSlider extends StatefulWidget {
  TopPromoSlider({Key? key}) : super(key: key);

  @override
  State<TopPromoSlider> createState() => _TopPromoSliderState();
}

class _TopPromoSliderState extends State<TopPromoSlider> {
  final CarouselController _controller = CarouselController();
  final AuthCon con = Get.find();

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
                  itemCount: con.creditCardGet.length,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      aspectRatio: 1.4,
                      enlargeCenterPage: false,
                      padEnds: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentsliderindex = index;
                        });
                      }),
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
                    return Obx(() => CustomeCardData(
                        bankName:
                            con.creditCardGet[index]['bankname'].toString(),
                        cardNumber:
                            con.creditCardGet[index]['cardnumber'].toString(),
                        nameHolder:
                            con.creditCardGet[index]['cardname'].toString(),
                        validity:
                            con.creditCardGet[index]['expirydate'].toString()));
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: con.creditCardGet.asMap().entries.map((entry) {
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
            )
          ],
        ),
      ],
    );
  }
}

class CustomeCardData extends StatelessWidget {
  final String bankName, cardNumber, nameHolder, validity;

  const CustomeCardData(
      {Key? key,
      required this.bankName,
      required this.cardNumber,
      required this.nameHolder,
      required this.validity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 230,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/banner/card 1.png'),
                  fit: BoxFit.contain)),
          child: Stack(
            children: [
              Positioned(
                  left: 40,
                  top: 30,
                  child: Text(bankName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Sora'))),
              Positioned(
                  left: 40,
                  bottom: 95,
                  child: Text(nameHolder,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Sora'))),
              Positioned(
                  right: 30,
                  bottom: 95,
                  child: Text(cardNumber,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: 'Sora'))),
              Positioned(
                  left: 75,
                  bottom: 26,
                  child: Text('${validity.substring(5, 10)}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: 'Sora'))),
            ],
          ),
        ),
      ],
    );
  }
}
