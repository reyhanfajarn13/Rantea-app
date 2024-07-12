import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/screens/user_screens/user/beranda/fitur/tabel_nilai/tabel_nilai.dart';
import 'fitur/grafik/graphScreen.dart';
import 'fitur/history/historyUserScreen.dart';

class fiturBottomSheet extends StatelessWidget {
  const fiturBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 3.0, color: Colors.black12),
              ),
            ),
            child: Text(
              "Fitur Rantea",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              // Column(
              //   children: [
              //     ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Color(0xFF133A40),
              //         fixedSize: Size(80, 60),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(12), // <-- Radius
              //         ),
              //       ),
              //       child: Container(
              //           child: Icon(
              //         Icons.app_registration_rounded,
              //         size: 30,
              //         color: Colors.white,
              //       )),
              //       onPressed: () async {
              //         await Navigator.of(context).push(
              //           MaterialPageRoute(builder: (context) => tabelNilai()),
              //         );
              //       },
              //     ),
              //     SizedBox(
              //       height: 5,
              //     ),
              //     Text(
              //       'Tabel Nilai',
              //       style: GoogleFonts.urbanist(
              //           fontSize: 15,
              //           fontWeight: FontWeight.bold,
              //           color: Color(0xFF133A40)),
              //     )
              //   ],
              // ),
              // SizedBox(
              //   width: 35,
              // ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF133A40),
                      fixedSize: Size(80, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    child: Center(
                      // Posisikan ikon di tengah secara vertikal
                      child: Icon(
                        Icons.history_rounded,
                        color: Colors.white,
                        size: 30, // Ukuran ikon yang diinginkan
                      ),
                    ),
                    onPressed: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => historyUserScreen()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Riwayat',
                    style: GoogleFonts.urbanist(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF133A40)),
                  )
                ],
              ),
              SizedBox(
                width: 35,
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF133A40),
                      fixedSize: Size(80, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    child: Container(
                        child: Icon(
                      Icons.ssid_chart_rounded,
                      size: 30,
                      color: Colors.white,
                    )),
                    onPressed: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => graphScreen()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Laporan',
                    style: GoogleFonts.urbanist(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF133A40)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
