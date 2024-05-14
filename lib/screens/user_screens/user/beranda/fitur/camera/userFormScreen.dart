import 'dart:io';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_svg/flutter_svg.dart';
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
  final TextEditingController _warnaController = TextEditingController();
  final TextEditingController _kerataanController = TextEditingController();
  final TextEditingController _kebersihanController = TextEditingController();
  final TextEditingController _bentukController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              color: Color(0xFF133A40),
            ),
            height: size.height * 0.15,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Container(
                      child: Text(
                        "Wah, Hasil Prediksinya!👋",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "${widget.predictionTeaType}",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer()
                  ],
                ),
                Spacer(),
                Container(
                  child: SvgPicture.asset('lib/images/logo_rantea_4.svg'),
                ),
                SizedBox(
                  width: 30,
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _warnaController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Warna',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _kerataanController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Kerataan',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _kebersihanController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Kebersihan',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _bentukController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Bentuk & Ukuran',
                    ),
                  ),
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
                      backgroundColor: Colors.red, // background
                      foregroundColor: Colors.white, // foreground
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
                            width: size.width,
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
                                    fixedSize: Size(
                                        size.width * 0.8, size.height * 0.06),
                                    backgroundColor: Color(0xFF133A40),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                  onPressed: () async {
                                    final String formattedDate =
                                        DateFormat('MMMM d, yyyy')
                                            .format(DateTime.now());
                                    String imageUrl =
                                        await _saveImagetoFirebase(
                                            widget.imagePath);
                                    double totalBerat = double.tryParse(
                                            _weightController.text) ??
                                        0.0;
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc('history')
                                        .collection('tea_detail')
                                        .add({
                                      'userPredictBy': user?.email,
                                      'predictionTeaType':
                                          widget.predictionTeaType,
                                      'imageUrl': imageUrl,
                                      'warna': _warnaController.text,
                                      'kerataan': _kerataanController.text,
                                      'kebersihan': _kebersihanController.text,
                                      'bentuk_ukuran': _bentukController.text,
                                      'totalBerat': totalBerat,
                                      'timestamp': formattedDate,
                                    });
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              homeScreenUser()),
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
          ),
        ],
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
