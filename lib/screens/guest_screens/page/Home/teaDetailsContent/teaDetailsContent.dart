import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/dataTeaDetailsContent.dart';

class teaDetailsContent extends StatelessWidget {
  final title;
  final description;
  final mesh;
  final massaJenis;
  final tingkatMutu;
  final jenisPemasaran;
  final funFact;
  const teaDetailsContent(
      {super.key,
      required this.title,
      required this.description,
      this.mesh,
      this.massaJenis,
      this.tingkatMutu,
      this.jenisPemasaran,
      this.funFact});

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
            '${title}',
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
                      '${description}',
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
                    'Spesifikasi Bubuk Teh',
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
                                                'Ukuran Mesh',
                                                style: GoogleFonts.urbanist(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text("${mesh}",
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
                                                'Massa Jenis',
                                                style: GoogleFonts.urbanist(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text("${massaJenis}",
                                                  style: GoogleFonts.urbanist(
                                                    fontSize: 11.5,
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
                                                'Tingkat Mutu',
                                                style: GoogleFonts.urbanist(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text("${tingkatMutu}",
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
                                                'Jenis Pemasaran',
                                                style: GoogleFonts.urbanist(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text("${jenisPemasaran}",
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
                      '${funFact}',
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
