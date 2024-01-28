import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';

import 'takeCamera.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Display the Picture'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF133A40),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Hasil Deteksi :',
              style: GoogleFonts.poppins(
                color: Color(0xFF9E9E9E),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 0.08,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'DUST 4',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              height: size.height * 0.5,
              width: size.width * 1,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: Image.file(File(imagePath))),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text('${imagePath}'),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(size.width * 0.9, size.height * 0.08),
                backgroundColor: Color(0xFF69D19F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
              ),
              onPressed: () async {},
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    'Simpan Hasil Uji Mutu',
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
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () async {},
            child: const Text('Foto Kembali'),
          ),
          Spacer()
        ],
      ),
    );
  }
}
