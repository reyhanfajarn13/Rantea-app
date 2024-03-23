import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'userFormScreen.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final String predictionTeaType;
  final CameraController controller;
  const DisplayPictureScreen({
    super.key,
    required this.imagePath,
    required this.predictionTeaType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
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
              '${predictionTeaType}',
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
              onPressed: () async {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15.0)),
                    ),
                    backgroundColor: Colors.blueGrey[50],
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: size.height * 0.35,
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
                                'Yakin untuk Simpan Gambar?',
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
                                fixedSize:
                                    Size(size.width * 0.8, size.height * 0.06),
                                backgroundColor: Color(0xFF133A40),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              onPressed: () async {
                                controller.dispose();
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => userFormScreen(
                                            imagePath: imagePath,
                                            predictionTeaType:
                                                predictionTeaType,
                                          )),
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
                    });
              },
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
