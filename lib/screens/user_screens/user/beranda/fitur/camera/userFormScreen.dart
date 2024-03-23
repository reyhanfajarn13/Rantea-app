import 'dart:io';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart' as path;

import '../../../homeScreenUser.dart';

class userFormScreen extends StatefulWidget {
  final String imagePath;
  final String predictionTeaType;

  const userFormScreen({
    Key? key,
    required this.imagePath,
    required this.predictionTeaType,
  }) : super(key: key);

  @override
  _userFormScreenState createState() => _userFormScreenState();
}

class _userFormScreenState extends State<userFormScreen> {
  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Total Berat (gram)',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white, // foreground
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
                    return Container(
                      height: size.height * 0.35,
                      child: Column(
                        children: [
                          SizedBox(height: 25),
                          Container(
                            child: Icon(
                              Icons.mark_email_read_outlined,
                              color: Color(0xFF133A40),
                              size: 50,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: size.width * 0.7,
                            child: Text(
                              'Yakin untuk Simpan Gambar?',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: size.width * 0.8,
                            child: Text(
                              'Kami akan segera meninjaunya',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 15),
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
                              String imageUrl =
                                  await _saveImagetoFirebase(widget.imagePath);
                              double totalBerat =
                                  double.tryParse(_weightController.text) ??
                                      0.0;
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc('history')
                                  .collection('tea_detail')
                                  .add({
                                'userPredictBy': user?.email,
                                'predictionTeaType': widget.predictionTeaType,
                                'imageUrl': imageUrl,
                                'totalBerat': totalBerat,
                                'timestamp':
                                    '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                              });
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homeScreenUser()),
                                (route) =>
                                    false, // Hindari semua route sebelumnya dari tumpukan
                              );
                            },
                            child: Text(
                              'OK',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text('Kirim'),
            )
          ],
        ),
      ),
    );
  }

  Future<String> _saveImagetoFirebase(String imagePath) async {
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
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }
}
