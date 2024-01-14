import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'fiturBottomSheet.dart';
import 'homeUserHeader.dart';

class homeUser extends StatefulWidget {
  const homeUser({super.key});

  @override
  State<homeUser> createState() => _homeUserState();
}

class _homeUserState extends State<homeUser> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        homeUserHeader(),
        SizedBox(
          height: 20,
        ),
        Container(
          width: size.width * 0.9,
          height: size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('lib/images/headlineNewsGuest_1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              child: SvgPicture.asset(
                'lib/images/home_user_fitur.svg',
                height: 100,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Apa saja fitur Rantea?",
                    style: GoogleFonts.urbanist(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    "Kenali fitur-fitur Rantea lebih dekat.",
                    style: GoogleFonts.urbanist(
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                        color: Colors.grey[700]),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF133A40),
                      fixedSize: Size(150, 50)),
                  child: Text(
                    'Fitur Rantea',
                    style: GoogleFonts.urbanist(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15.0)),
                        ),
                        backgroundColor: Colors.blueGrey[50],
                        context: context,
                        builder: (BuildContext context) {
                          return fiturBottomSheet();
                        });
                  },
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
