import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/dataTeaDetailsContent.dart';

class teaDetailsContent extends StatelessWidget {
  const teaDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Spacer(),
            Container(
              alignment: Alignment.center,
              width: size.width * 0.9,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/images/headlineNewsGuest_1.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(7)),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: Text(
            'Pecko Fanning (PF)',
            style: GoogleFonts.urbanist(
                fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: Row(
            children: [
              Text(
                'Jenis',
                style: GoogleFonts.urbanist(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              const Spacer(),
              Text(
                ':  Teh Hitam Ortodoks',
                style: GoogleFonts.urbanist(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: Row(
            children: [
              Icon(
                Icons.photo_outlined,
                color: Colors.green,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Photo Gallery',
                style: GoogleFonts.urbanist(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Spacer(
                flex: 6,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        CarouselSlider(
            items: pages,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.5,
              aspectRatio: 3.0,
              initialPage: 1,
            )),
      ],
    );
  }
}
