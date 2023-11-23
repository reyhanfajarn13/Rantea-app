import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homeScreenAdmin extends StatefulWidget {
  const homeScreenAdmin({super.key});

  @override
  State<homeScreenAdmin> createState() => _homeScreenAdminState();
}

class _homeScreenAdminState extends State<homeScreenAdmin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.13,
            width: size.width * 0.42,
            alignment: Alignment.center,
            child: Image.asset(
              'lib/images/logo_rantea_3.png',
              width: 112,
              height: 40,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
