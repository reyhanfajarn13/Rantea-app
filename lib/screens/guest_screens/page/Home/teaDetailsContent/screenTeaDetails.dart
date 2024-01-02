import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/screens/guest_screens/page/Home/teaDetailsContent/teaDetailsContent.dart';
import 'homeTeaDetails.dart';

class screenTeaDetails extends StatelessWidget {
  const screenTeaDetails({super.key});

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
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[teaDetailsContent()],
        ),
      ),
    );
  }
}
