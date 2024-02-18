import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class pagePengenalan1 extends StatelessWidget {
  const pagePengenalan1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 80,
          ),
          Container(
            child: Text(
              'Apa itu',
              style: GoogleFonts.poppins(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            child: SvgPicture.asset('lib/images/logo_rantea_5.svg'),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset('lib/images/pagePengenalan_1.png')),
          ),
        ],
      ),
    );
  }
}
