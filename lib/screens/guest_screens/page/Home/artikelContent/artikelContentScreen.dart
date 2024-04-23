import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class artikelContentScreen extends StatefulWidget {
  const artikelContentScreen({super.key});

  @override
  State<artikelContentScreen> createState() => _artikelContentScreenState();
}

class _artikelContentScreenState extends State<artikelContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              child: Text(
                "Artikel Berita",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0.17,
                ),
              ),
            ),
            Spacer(),
            Container(
              child: Text(
                '------------------------------------------------------',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              height: 100,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'lib/images/teh.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  'Mengenal Perbedaan Teh Hitam Orthodox dan CTC',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Apakah kamu termasuk salah satu orang yang gemar mengonsumsi teh? Teh memang sudah menjadi minuman yang familiar di Indonesia dan sebagai salah satu minuman yang paling dekat dengan aktivitas harian masyarakat.',
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
