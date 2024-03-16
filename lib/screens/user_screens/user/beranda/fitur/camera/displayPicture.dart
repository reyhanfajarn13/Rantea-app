import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'userFormScreen.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({super.key, required this.imagePath});

  Future<String> _saveImagetoFirebase() async {
    if (imagePath == null) {
      print('Please select an image and fill in all fields.');
      return '';
    }
    String fileName = path.basename(imagePath);
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/$fileName');
    try {
      await storageReference
          .putFile(File(imagePath))
          .whenComplete(() => print('Image uploaded to Firebase Storage'));
      String imageUrl = await storageReference.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return '';
    }
  }

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
              onPressed: () async {
                String imageUrl = await _saveImagetoFirebase();
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc('history')
                    .collection('tea_detail')
                    .add({
                  'imageUrl': imageUrl,
                  'timestamp':
                      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                });
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => userFormScreen(
                            imageUrl: imageUrl,
                          )),
                );
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
