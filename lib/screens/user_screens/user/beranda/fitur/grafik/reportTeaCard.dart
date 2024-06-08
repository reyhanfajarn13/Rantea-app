import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class reportTeaCard extends StatelessWidget {
  final List<String> firstTeaType;
  final int listlength;
  final String groupTeaType;
  final Map<String, double> totalWeights;

  const reportTeaCard({
    Key? key,
    required this.firstTeaType,
    required this.groupTeaType,
    required this.listlength,
    required this.totalWeights,
  }) : super(key: key);

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
                color: Colors.black,
              ),
            ),
            Spacer(),
            Container(
              width: size.width * 0.65,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorTea[groupTeaType],
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.1, // Memberikan tinggi pada ListView.builder
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(listlength, (index) {
                String teaType = firstTeaType[index];
                double totalBeratTea = totalWeights.containsKey(teaType)
                    ? totalWeights[teaType]!
                    : 0.0;
                return Container(
                  width: listlength == 2 ? size.width * 0.45 : size.width * 0.4,
                  // Lebar setiap card
                  margin: const EdgeInsets.symmetric(
                    horizontal: 2,
                  ), // Margin antar card
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
                                    teaType,
                                    style: GoogleFonts.urbanist(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  LayoutBuilder(
                                    builder: (BuildContext context,
                                        BoxConstraints constraints) {
                                      double fontSize = 13.0;
                                      // Cek apakah teks overflow
                                      if (constraints.maxWidth <
                                          size.width * 0.3) {
                                        // Jika overflow, sesuaikan ukuran font
                                        fontSize = 8.0;
                                      }
                                      return Text(
                                        '$totalBeratTea Kg',
                                        style: GoogleFonts.urbanist(
                                          fontSize: fontSize,
                                          fontWeight: FontWeight.w500,
                                          color: colorTea[groupTeaType],
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      );
                                    },
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
