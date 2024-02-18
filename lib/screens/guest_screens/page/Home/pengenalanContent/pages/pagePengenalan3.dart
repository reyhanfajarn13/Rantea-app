import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class pagePengenalan3 extends StatelessWidget {
  const pagePengenalan3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 150,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Text(
                'Tujuan utamanya yaitu untuk membantu mengklafifikasikan kualitas bubuk teh dan juga mendigitalisasikan pelaporan hasil uji mutu',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset('lib/images/pagePengenalan_3.png')),
          ),
        ],
      ),
    );
  }
}
