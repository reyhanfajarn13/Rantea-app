import 'dart:io';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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

  String selectedWarna = '';
  int? nilaiWarna;
  String selectedBentuk = '';
  int? nilaiBentuk;
  String selectedKerataan = '';
  int? nilaiKerataan;
  String selectedKebersihan = '';
  int? nilaiKebersihan;
  String messageWidgetValue = '';

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    Size size = MediaQuery.of(context).size;

    var totalNilai = (nilaiBentuk ?? 0) +
        (nilaiWarna ?? 0) +
        (nilaiKerataan ?? 0) +
        (nilaiKebersihan ?? 0);
    Widget messageWidget;

    if (totalNilai >= 41 && totalNilai <= 50) {
      messageWidgetValue = 'A';
      messageWidget = Text('$messageWidgetValue',
          style: GoogleFonts.poppins(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ));
    } else if (totalNilai >= 31 && totalNilai <= 40) {
      messageWidgetValue = 'B';
      messageWidget = Text('$messageWidgetValue',
          style: GoogleFonts.poppins(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ));
    } else if (totalNilai >= 21 && totalNilai <= 30) {
      messageWidgetValue = 'C';
      messageWidget = Text('$messageWidgetValue',
          style: GoogleFonts.poppins(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ));
    } else if (totalNilai >= 10 && totalNilai <= 20) {
      messageWidgetValue = 'D';
      messageWidget = Text('$messageWidgetValue',
          style: GoogleFonts.poppins(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ));
    } else if (totalNilai >= 0 && totalNilai <= 9) {
      messageWidgetValue = 'E';
      messageWidget = Text('$messageWidgetValue',
          style: GoogleFonts.poppins(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ));
    } else {
      messageWidgetValue = ' ';
      messageWidget = Text('$messageWidgetValue',
          style: GoogleFonts.poppins(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ));
    }

    List<String> warnaValue = [
      'Blackish & Bloom',
      'Blackish',
      'Fairly black, Brownish, Rather Greyish, Few green leaf',
      'Greyish',
      'Reddish, Ragged'
    ];

    Map<String, int> warnaNilai = {
      'Blackish & Bloom': 12,
      'Blackish': 10,
      'Fairly black, Brownish, Rather Greyish, Few green leaf': 7,
      'Greyish': 5,
      'Reddish, Ragged': 2,
    };

    List<String> bentukValue = [
      'Curly, Wiry, Tippy',
      'Fairly curly, Some tis, Few tips, Choppy (BP)',
      'Rather: Choppy/flaky/open',
      'Open/flaky,Smaller, Bold, Choppy',
      'Irregular, Too Choppy'
    ];

    Map<String, int> bentukNilai = {
      'Curly, Wiry, Tippy': 12,
      'Fairly curly, Some tis, Few tips, Choppy (BP)': 10,
      'Rather: Choppy/flaky/open': 7,
      'Open/flaky,Smaller, Bold, Choppy': 5,
      'Irregular, Too Choppy': 2,
    };

    List<String> kerataanValue = [
      'Even >95%',
      'Even 91-95%',
      'Fairly Even 85-90%',
      'Uneven 75-84%',
      'Ragged, Mixed < 75%'
    ];

    Map<String, int> kerataanNilai = {
      'Even >95%': 12,
      'Even 91-95%': 10,
      'Fairly Even 85-90%': 8,
      'Uneven 75-84%': 5,
      'Ragged, Mixed < 75%': 2
    };

    List<String> kebersihanValue = [
      'Clean',
      'Clean 98%',
      'Few: fibres, stalks, fairly clean 96-97%',
      'Some: fibres, stalks 90-95%',
      'Fibrous, Stalky < 90%'
    ];

    Map<String, int> kebersihanNilai = {
      'Clean': 14,
      'Clean 98%': 10,
      'Few: fibres, stalks, fairly clean 96-97%': 8,
      'Some: fibres, stalks 90-95%': 5,
      'Fibrous, Stalky < 90%': 3
    };

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => homeScreenUser()),
          (Route<dynamic> route) => false,
        );
        return false; // Prevent default back navigation
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10)),
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
                      Container(
                        height: 40,
                        width: size.width,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFF133A40)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text('Apa warna bubuknya? 🌱',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        children: warnaValue.map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedWarna == item
                                    ? Color(0xFF133A40)
                                    : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedWarna = item;
                                  _warnaController.text = item;
                                  nilaiWarna = warnaNilai[item] ?? 0;
                                });
                              },
                              child: Text(
                                item,
                                style: TextStyle(
                                    color: selectedWarna == item
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      // TextFormField(
                      //   controller: _bentukController,
                      //   keyboardType: TextInputType.text,
                      //   decoration: InputDecoration(
                      //     labelText: 'Bentuk & Ukuran',
                      //   ),
                      // ),
                      Container(
                        height: 40,
                        width: size.width,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFF133A40), // Warna di bagian bawah
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text('Apa bentuk & ukurannya? 📏',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        children: bentukValue.map((item) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedBentuk == item
                                        ? Color(0xFF133A40)
                                        : null,
                                    fixedSize: Size(size.width * 0.9, 30),
                                    shadowColor: Color(0xFF133A40)),
                                onPressed: () {
                                  setState(() {
                                    selectedBentuk = item;
                                    _bentukController.text = item;
                                    nilaiBentuk = bentukNilai[item] ?? 0;
                                  });
                                },
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: selectedBentuk == item
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 40,
                        width: size.width,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFF133A40)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text('Kerataan Bubuk 📜',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        children: kerataanValue.map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedKerataan == item
                                    ? Color(0xFF133A40)
                                    : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedKerataan = item;
                                  _kerataanController.text = item;
                                  nilaiKerataan = kerataanNilai[item] ?? 0;
                                });
                              },
                              child: Text(
                                item,
                                style: TextStyle(
                                    color: selectedKerataan == item
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 40,
                        width: size.width,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFF133A40), // Warna di bagian bawah
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text('Apa Kebersihannya? 🍃',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        children: kebersihanValue.map((item) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedKebersihan == item
                                        ? Color(0xFF133A40)
                                        : null,
                                    fixedSize: Size(size.width * 0.9, 30),
                                    shadowColor: Color(0xFF133A40)),
                                onPressed: () {
                                  setState(() {
                                    selectedKebersihan = item;
                                    _kebersihanController.text = item;
                                    nilaiKebersihan =
                                        kebersihanNilai[item] ?? 0;
                                  });
                                },
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: selectedKebersihan == item
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
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

                      Row(
                        children: [
                          Text(
                            "Total: $totalNilai",
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xFF133A40)),
                            child: Center(child: messageWidget),
                          ),
                          SizedBox(
                            width: 25,
                          )
                        ],
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
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15.0)),
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
                                        fixedSize: Size(size.width * 0.8,
                                            size.height * 0.06),
                                        backgroundColor: Color(0xFF133A40),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                      ),
                                      onPressed: () async {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return Center(
                                              child: Lottie.asset(
                                                  'lib/images/loadingAnimationScreen.json'),
                                            );
                                          },
                                        );

                                        try {
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
                                            'kerataan':
                                                _kerataanController.text,
                                            'kebersihan':
                                                _kebersihanController.text,
                                            'bentuk_ukuran':
                                                _bentukController.text,
                                            'totalNilai': totalNilai,
                                            'totalBerat': totalBerat,
                                            'timestamp': formattedDate,
                                            'kriteriaPenerima':
                                                messageWidgetValue,
                                          });

                                          Navigator.pop(
                                              context); // Close the loading dialog
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    homeScreenUser()),
                                            (route) =>
                                                false, // Avoid all previous routes from the stack
                                          );
                                        } catch (e) {
                                          Navigator.pop(
                                              context); // Close the loading dialog if there's an error
                                          print('Error: $e');
                                          // You can also show an error message to the user here if needed
                                        }
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
