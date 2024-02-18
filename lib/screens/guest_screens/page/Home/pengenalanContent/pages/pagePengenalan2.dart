import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class pagePengenalan2 extends StatelessWidget {
  const pagePengenalan2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(),
          Container(
            width: 300,
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(
              'lib/images/logo_rantea_5.svg',
              height: 60,
              width: 30,
            ),
          ),
          Container(
            width: 300,
            child: Text(
              'merupakan sebuah project capstone design yang berkolaborasi dengan PT. Perkebunan Nusantara VIII',
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset('lib/images/pagePengenalan_2.png')),
          Spacer(),
        ],
      ),
    );
  }
}
