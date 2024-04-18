import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/screens/guest_screens/page/Profil/umpanBalikGuest.dart';

class successNotifUmpanBalik extends StatelessWidget {
  final returnback;
  const successNotifUmpanBalik({super.key, required this.returnback});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.35,
      width: size.width,
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Container(
            child: Icon(
              Icons.mark_email_read_outlined,
              color: Color(0xFF133A40),
              size: 50,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: size.width * 0.7,
            child: Text(
              'Terima kasih atas masukan anda',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: size.width * 0.8,
            child: Text(
              'Kami akan segera meninjaunya',
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(size.width * 0.8, size.height * 0.06),
              backgroundColor: Color(0xFF133A40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            onPressed: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => returnback),
              );
            },
            child: Text(
              'OK',
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
