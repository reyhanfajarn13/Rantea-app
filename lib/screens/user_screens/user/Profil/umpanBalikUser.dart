import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../guest_screens/page/Profil/successNotifUmpanBalik.dart';
import 'profilUser.dart';

class umpanBalikUser extends StatefulWidget {
  const umpanBalikUser({super.key});

  @override
  State<umpanBalikUser> createState() => _umpanBalikUserState();
}

TextEditingController _msgController = TextEditingController();

Widget _buildSuccessNotifUmpanBalik(BuildContext context) {
  return successNotifUmpanBalik(returnback: umpanBalikUser());
}

class _umpanBalikUserState extends State<umpanBalikUser> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    var collection = FirebaseFirestore.instance
        .collection('guest')
        .doc('umpan_balik')
        .collection('pesan');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                    iconSize: 30,
                    onPressed: () async {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => profilUser()),
                      );
                    },
                    icon: Icon(Icons.west_rounded)),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width * 0.3, size.height * 0.05),
                    backgroundColor: Color(0xFFABD1C6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onPressed: () async {
                    if (_msgController.text.toString().isNotEmpty) {
                      await collection.add({
                        'date': DateTime.now(),
                        'user': user?.email.toString().split('@').first,
                        'pesan': _msgController.text.toString()
                      }).then(
                        (value) => {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15.0)),
                            ),
                            backgroundColor: Colors.blueGrey[50],
                            context: context,
                            builder: (BuildContext context) =>
                                _buildSuccessNotifUmpanBalik(context),
                          ),
                          _msgController.clear()
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Pesan tidak boleh kosong'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Kirim',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Icon(
                Icons.email_outlined,
                color: Color(0xFF133A40),
                size: 50,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              child: Text(
                'Apa yang ingin anda sampaikan?',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.3,
              child: TextFormField(
                controller: _msgController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Tuliskan Masukan Anda Disini',
                  fillColor: Colors.grey[300],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
