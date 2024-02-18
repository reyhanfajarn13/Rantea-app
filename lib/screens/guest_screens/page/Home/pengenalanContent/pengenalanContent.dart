import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'slidePengenalanContent.dart';

//CLASS LOGIN BUTTON
class pengenalanContent extends StatelessWidget {
  const pengenalanContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => slidePengenalanContent()),
          );
        },
        style: ElevatedButton.styleFrom(
          maximumSize: Size(size.width * 0.9, size.height * 0.1),
          backgroundColor: Color(0xFF133A40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    'Apa itu',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  child: Image.asset(
                    'lib/images/logo_rantea.png',
                    fit: BoxFit.contain,
                    width: 110,
                  ),
                )
              ],
            ),
            const Spacer(),
            Container(
              child: Icon(
                Icons.arrow_circle_right_rounded,
                size: size.width * 0.1,
              ),
            ),
            const SizedBox(
              width: 1,
            ),
          ],
        ));
  }
}
