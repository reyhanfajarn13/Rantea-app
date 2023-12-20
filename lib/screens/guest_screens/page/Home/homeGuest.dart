import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homeCarouselContent.dart';

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
        Container(
          decoration: BoxDecoration(color: Colors.transparent),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "Headline News",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CarouselSlider(
                  items: pages,
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    initialPage: 2,
                  )),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
