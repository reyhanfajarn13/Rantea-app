import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

class onBoarding extends StatelessWidget {
  onBoarding({Key? key}) : super(key: key);

  // final pages = [
  //   PageViewModel(
  //     pageColor: const Color(0xFFFFFF),
  //     title: Image.asset('lib/images/logo_rantea.png',
  //         width: double.infinity, height: 200),
  //     body: Column(
  //       children: [
  //         Container(
  //           child: const Text(
  //             'Hassle-free booking of flight tickets with a full refund on cancellation',
  //             style: TextStyle(
  //               fontSize: 24,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.black,
  //             ),
  //           ),
  //         ),
  //         Container(
  //           child: const Text(
  //             'Hassle-free booking of flight tickets with a full refund on cancellation',
  //             style: TextStyle(
  //               fontSize: 24,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.black,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //     bubbleBackgroundColor: Color(0xff133A40),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(35.0, 10.0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'lib/images/logo_rantea_2.png',
                alignment: Alignment.center,
              ),
            ),
            Image.asset('lib/images/onboard_1.png'),
            Container(
              width: 290,
              child: Text('Deteksi Mutu Bubuk Daun Teh',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),
            ),
            SizedBox(height: 15),
            Container(
              width: 290,
              child: Text(
                  'Nunc vitae est adipiscing cursus. Semper gravida vestibulum fermentum tristique massa ultrices proin nam gravida. Massa sem et posuere lacus.',
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12)),
            )
          ],
        ),
      ),
    );
  }
}
