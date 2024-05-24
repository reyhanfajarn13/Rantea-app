import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class reportTeaCard extends StatelessWidget {
  final firstTeaType;
  final int listlength;
  final groupTeaType;
  const reportTeaCard(
      {super.key,
      required this.firstTeaType,
      required this.groupTeaType,
      required this.listlength});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Map<String, Color> colorTea = {
      'BT': Colors.green,
      'DUST': Colors.red,
      'BOPF': Colors.blue,
      'PF': Colors.orange,
      'BP': Colors.indigo
    };

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.grass_rounded,
              color: colorTea[groupTeaType],
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '$groupTeaType',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Spacer(),
            Container(
              width: size.width * 0.65,
              height: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorTea[groupTeaType]),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.1, // Memberikan tinggi pada ListView.builder
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(listlength, (index) {
                return Container(
                  width: listlength == 2 ? size.width * 0.45 : size.width * 0.3,
                  // Lebar setiap card
                  margin: const EdgeInsets.symmetric(
                      horizontal: 2), // Margin antar card
                  child: Card(
                    shadowColor: colorTea[groupTeaType],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.line_weight_rounded,
                                color: colorTea[groupTeaType],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    firstTeaType[index],
                                    style: GoogleFonts.urbanist(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "1000 Kg",
                                    style: GoogleFonts.urbanist(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: colorTea[groupTeaType],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
