// ignore_for_file: prefer_const_constructors

import 'package:cardit/auth/auth.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class TopPromoSlider extends StatefulWidget {
  final List<String> data = [
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
    'assets/banner/banner1.png'
  ];

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
        con.creditCardGet == null
            ? Text("welcome")
            : Column(
                children: [
                  CarouselSlider.builder(
                      itemCount: widget.data.length,
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          enlargeCenterPage: false,
                          aspectRatio: 1.8,
                          padEnds: false,
                          //autoPlayInterval: const Duration(seconds: 1),
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentsliderindex = index;
                            });
                          }),
                      itemBuilder:
                          (BuildContext context, int index, int pageViewIndex) {
                        return _buildSliderItem(context, widget.data[index]);
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.data.asMap().entries.map((entry) {
                      //int pageIndex = imgList.indexOf(url);
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
                                  : const Color(0xffc5d2da),
                            ),
                          ));
                    }).toList(),
                  )
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
