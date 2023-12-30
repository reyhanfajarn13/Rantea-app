import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/screens/guest_screens/homeScreenGuest.dart';
import 'package:rantea_app/static/loadingPage.dart';
import '../highlightTeaContent/listTeaContentContainer.dart';
import 'screenTeaDetails.dart';

class homeTeaDetails extends StatelessWidget {
  const homeTeaDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Container(
              child: Text(
                "Jelajahi Bubuk Teh",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () async {
            await Navigator.push(context,
                MaterialPageRoute(builder: (context) => homeScreenGuest()));
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Row(
              children: [
                const Spacer(),
                Column(
                  children: [
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
            ),
          ],
        ),
      ),
    );
  }
}
