import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/static/loadingPage.dart';

class listTeaContentContainer extends StatelessWidget {
  const listTeaContentContainer({
    super.key,
    required this.content,
    required this.pict,
    required this.nextpage,
  });
  final String content, pict;
  final nextpage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextpage));
        },
        style: ElevatedButton.styleFrom(
            minimumSize: Size(size.width * 0.4, size.height * 0.13),
            backgroundColor: Colors.white,
            shadowColor: Colors.black),
        child: Row(
          children: [
            Container(
              width: 75.60,
              child: Text(
                content,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0.17,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: size.height * 0.1,
              width: size.width * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: AssetImage(pict), fit: BoxFit.contain)),
            )
          ],
        ));
  }
}
