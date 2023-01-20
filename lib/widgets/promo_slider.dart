// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_print

import 'package:cardit/auth/auth.dart';
import 'package:cardit/ui/payment_method/add_credit_card.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class TopPromoSlider extends StatefulWidget {
  final List<String> data = [
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        con.creditCardGet == null
            ? CustomeCardData()
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
              ),
      ],
    );
  }

  Widget _buildSliderItem(BuildContext context, String item) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Image.asset(item, height: double.infinity, fit: BoxFit.cover));
  }
}

class CustomeCardData extends StatelessWidget {
  const CustomeCardData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 230,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/banner/empty_card.png'))),
      child: Stack(
        children: [
          Positioned(
              top: 100,
              left: 135,
              child: MaterialButton(
                  color: HexColor('#CEE812'),
                  minWidth: 90,
                  onPressed: () {
                    Get.to(() => AddCreditCardPage());
                  },
                  child: Text('Add Card',
                      style: TextStyle(fontSize: 18, fontFamily: 'Sora'))))
        ],
      ),
    );
  }
}
