import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/screens/user_screens/loginScreenUser.dart';

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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => loginUser()),
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
            ))
      ],
    );
  }
}
