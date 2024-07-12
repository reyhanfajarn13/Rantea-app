import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/screens/guest_screens/page/Home/teaDetailsContent/teaDetailsContent.dart';
import 'homeTeaDetails.dart';

class screenTeaDetails extends StatelessWidget {
  final title;
  final description;
  final mesh;
  final massaJenis;
  final tingkatMutu;
  final jenisPemasaran;
  final funFact;
  final image;
  const screenTeaDetails(
      {super.key,
      required this.title,
      required this.description,
      this.mesh,
      this.massaJenis,
      this.tingkatMutu,
      this.jenisPemasaran,
      this.funFact,
      this.image});

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
          children: <Widget>[
            teaDetailsContent(
                title: title,
                description: description,
                mesh: mesh,
                massaJenis: massaJenis,
                tingkatMutu: tingkatMutu,
                jenisPemasaran: jenisPemasaran,
                funFact: funFact,
                image: image)
          ],
        ),
      ),
    );
  }
}
