import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/screens/signIn.dart';

import 'umpanBalikGuest.dart';

class profilGuest extends StatelessWidget {
  const profilGuest({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    offset: Offset(0, 3) // Shadow position
                    ),
              ],
            ),
            height: size.height * 0.08,
            alignment: AlignmentDirectional.center,
            child: Text(
              "Profil",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(size.width * 0.9, size.height * 0.08),
              backgroundColor: Color(0xFFABD1C6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            onPressed: () async {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => signIn()),
                (Route<dynamic> route) => false,
              );
            },
            child: Row(
              children: [
                const Spacer(),
                Icon(
                  Icons.login_rounded,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Masuk sebagai User',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Spacer()
              ],
            )),
        SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.grey[200]),
          width: size.width * 0.9,
          height: size.height * 0.3,
          child: Row(
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset('lib/images/guestProfil_1.png')),
              Spacer(),
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 200,
                      child: Text(
                        'Aplikasi ini masih dalam tahap Pengembangan🌱',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      'Bantu kami dengan memberikan masukan/kendala/bug agar aplikasi Rantea menjadi lebih baik lagi!',
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width * 0.3, size.height * 0.05),
                      backgroundColor: Color(0xFF133A40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => umpanBalikGuest()),
                      );
                    },
                    child: Text(
                      'Umpan Balik',
                      style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
