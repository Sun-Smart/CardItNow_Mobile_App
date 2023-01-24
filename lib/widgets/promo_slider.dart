// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:cardit/auth/auth.dart';
import 'package:cardit/ui/payment_method/manula_card_screen.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TopPromoSlider extends StatefulWidget {
  final List<String> data = [
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
  ];

  TopPromoSlider({Key? key}) : super(key: key);

  @override
  State<TopPromoSlider> createState() => _TopPromoSliderState();
}

class _TopPromoSliderState extends State<TopPromoSlider> {
  final CarouselController _controller = CarouselController();
  final AuthCon con = Get.find();
  int _currentsliderindex = 0;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        con.creditCardGet == null
            ? Text("welcome")
            : Column(
                children: [
                  con.creditCardGet == null
                      ? Text("welcome")
                      :
                      Obx(() =>CarouselSlider.builder(
                          itemCount: con.creditCardGet.length,
                          carouselController: _controller,
                          options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 1,
                              enlargeCenterPage: false,
                              aspectRatio: 1.8,
                              padEnds: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentsliderindex = index;
                                });
                              }),
                          itemBuilder:
                              (BuildContext context, int index, int pageViewIndex) {
                            return CustomeCardData(
                                bankName: con.creditCardGet['bankname'] ?? '',
                                cardNumber: con.creditCardGet['cardnumber'] ?? '',
                                nameHolder: con.creditCardGet['cardname'] ?? '',
                                validity: con.creditCardGet['expirydate'] ?? '');
                          }), ),

                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: WormEffect(
                              dotHeight: 8, dotWidth: 8, type: WormType.thin))),
                ],
              )
      ],
    );
  }

  Widget _buildSliderItem(BuildContext context, String item) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        //padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Image.asset(
          item,
          height: double.infinity,
          fit: BoxFit.cover,
        ));
  }
}
