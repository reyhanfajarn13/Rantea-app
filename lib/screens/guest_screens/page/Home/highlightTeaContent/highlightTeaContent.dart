import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/static/loadingPage.dart';
import '../teaDetailsContent/homeTeaDetails.dart';
import '../teaDetailsContent/screenTeaDetails.dart';
import 'listTeaContentContainer.dart';

class highlightTeaContent extends StatelessWidget {
  const highlightTeaContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Jelajah Bubuk Teh",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0.17,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            listTeaContentContainer(
              content: "Broken Orange Pecko",
              pict: 'lib/images/logo_rantea_3.png',
              nextpage: screenTeaDetails(),
            ),
            const SizedBox(
              height: 10,
            ),
            listTeaContentContainer(
              content: "Pecko Fanning",
              pict: 'lib/images/logo_rantea_3.png',
              nextpage: screenTeaDetails(),
            ),
            const SizedBox(
              height: 10,
            ),
            listTeaContentContainer(
              content: "Dust",
              pict: 'lib/images/logo_rantea_3.png',
              nextpage: screenTeaDetails(),
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homeTeaDetails()),
                );
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Lihat Semua",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF56A37E),
                      letterSpacing: 0.17,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Color(0xFF56A37E),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            listTeaContentContainer(
              content: "Broken Orange Pecko Fanning",
              pict: 'lib/images/logo_rantea_3.png',
              nextpage: screenTeaDetails(),
            ),
            const SizedBox(
              height: 10,
            ),
            listTeaContentContainer(
              content: "Pecko Fanning 2",
              pict: 'lib/images/logo_rantea_3.png',
              nextpage: screenTeaDetails(),
            ),
            const SizedBox(
              height: 10,
            ),
            listTeaContentContainer(
              content: "Dust 2",
              pict: 'lib/images/logo_rantea_3.png',
              nextpage: screenTeaDetails(),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
