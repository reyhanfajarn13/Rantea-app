import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'headlineNewsContent/headlineNewsContent.dart';
import 'highlightTeaContent/highlightTeaContent.dart';
import 'pengenalanContent/pengenalanContent.dart';

class homeGuest extends StatefulWidget {
  const homeGuest({super.key});

  @override
  State<homeGuest> createState() => _homeGuestState();
}

class _homeGuestState extends State<homeGuest> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Container(
          height: size.height * 0.1,
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          alignment: AlignmentDirectional.centerStart,
          child: Image.asset(
            'lib/images/logo_rantea_3.png',
            width: 112,
            height: 40,
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.transparent),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              CarouselSlider(
                  items: pages,
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    initialPage: 2,
                  )),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: pengenalanContent(),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: highlightTeaContent(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
