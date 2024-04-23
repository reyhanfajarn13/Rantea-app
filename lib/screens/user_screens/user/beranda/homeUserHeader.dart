import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'fitur/grafik/pieChartScreen.dart';
import 'fitur/grafik/lineGraph.dart';

class homeUserHeader extends StatelessWidget {
  const homeUserHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 400,
      color: Color(0xFF133A40),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Hallo, Penguji Teh!👋",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Ayo Jaga Mutu Teh!",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                child: SvgPicture.asset('lib/images/logo_rantea_4.svg'),
              ),
              SizedBox(
                width: 30,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            width: size.width,
            child: PieChartScreen(),
          )
        ],
      ),
    );
  }
}
