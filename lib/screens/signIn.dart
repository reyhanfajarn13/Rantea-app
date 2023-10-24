import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'guest_screens/homeScreenGuest.dart';
import 'user_screens/loginScreenUser.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(35.0, 35.0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'lib/images/logo_rantea_2.png',
              alignment: Alignment.center,
            ),
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => loginUser()));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(300),
                  backgroundColor: Color(0xFF133A40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
              child: Text(
                'Masuk sebagai user',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homeGuest()));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(300),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(width: 1.0, color: Colors.black)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
              child: Text(
                'Masuk sebagai tamu',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}