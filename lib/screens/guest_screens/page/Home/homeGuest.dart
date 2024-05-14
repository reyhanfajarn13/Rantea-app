import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';
import 'artikelContent/artikelContentScreen.dart';
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
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: artikelContentScreen(),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: size.width,
                child: Link(
                    target: LinkTarget.self,
                    uri: Uri.parse('https://rantea.vercel.app/blog'),
                    builder: (context, followlink) {
                      return GestureDetector(
                        onVerticalDragDown: ((details) {
                          Future.delayed(Duration(seconds: 1), () {
                            followlink!();
                          });
                        }),
                        child: Column(
                          children: [
                            Text(
                              "Selengkapnya",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade900,
                                letterSpacing: 0.17,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Colors.green.shade900,
                              size: 30,
                            )
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
