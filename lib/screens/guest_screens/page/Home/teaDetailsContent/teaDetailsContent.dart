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
          child: Column(
            children: <Widget>[
              Row(
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
              const SizedBox(
                height: 15,
              ),
              CarouselSlider(
                  items: pages,
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.5,
                    aspectRatio: 3.0,
                    initialPage: 1,
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.assignment_outlined,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Deskripsi',
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
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.9,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Broken Peco 1 atau biasa disingkat menjadi BP 1 merupakan salah satu mutu high grade yang memiliki spesifikasi ukuran 10 – 12, kadar air maksimal 4,5 dan kepadatan 300 – 330.',
                      style: GoogleFonts.urbanist(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          letterSpacing: 0.17),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.description_outlined,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Parameter Uji Mutu',
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
              const SizedBox(
                height: 15,
              ),
              Container(
                  width: size.width * 1,
                  padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 170,
                            child: Card(
                                shadowColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.thermostat_rounded,
                                            color: Colors.green,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Temperature',
                                                style: GoogleFonts.urbanist(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text("18 - 20 C",
                                                  style: GoogleFonts.urbanist(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          const Spacer(),
                          Container(
                            width: 170,
                            child: Card(
                                shadowColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.wb_sunny_outlined,
                                            color: Colors.orange,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Sunlight',
                                                style: GoogleFonts.urbanist(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text("Inderect Light",
                                                  style: GoogleFonts.urbanist(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 170,
                            child: Card(
                                shadowColor: Colors.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.purple[900],
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Hardlines Zones',
                                                style: GoogleFonts.urbanist(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text("10 - 12",
                                                  style: GoogleFonts.urbanist(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          const Spacer(),
                          Container(
                            width: 170,
                            child: Card(
                                shadowColor: Colors.brown,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.grass_outlined,
                                            color: Colors.brown,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Soil',
                                                style: GoogleFonts.urbanist(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text("Inderect Light",
                                                  style: GoogleFonts.urbanist(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 170,
                            child: Card(
                                shadowColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.area_chart_outlined,
                                            color: Colors.blue,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Growth Rate',
                                                style: GoogleFonts.urbanist(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text("Moderate",
                                                  style: GoogleFonts.urbanist(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          const Spacer(),
                          Container(
                            width: 170,
                            child: Card(
                                shadowColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.warning_amber_rounded,
                                            color: Colors.red[600],
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Caution/Toxicity',
                                                style: GoogleFonts.urbanist(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text("Non Toxic",
                                                  style: GoogleFonts.urbanist(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          const Spacer(),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.assignment_late_outlined,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Fun Facts',
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
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.9,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'The name "Prayer Plant" is inspired by its unique habit of folding its leaves upward in the evening, resembling hands in prayer.',
                      style: GoogleFonts.urbanist(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          letterSpacing: 0.17),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
