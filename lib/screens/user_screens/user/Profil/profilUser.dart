import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/screens/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'umpanBalikUser.dart';

class profilUser extends StatefulWidget {
  const profilUser({super.key});

  @override
  State<profilUser> createState() => _profilUserState();
}

class _profilUserState extends State<profilUser> {
  Future<File?> getImage() async {
    final ImagePicker _picker = ImagePicker();
// Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//TO convert Xfile into file
    File file = File(image!.path);
//print(‘Image picked’);
    return file;
  }

  Future<Map<String, dynamic>> sendImageToApi(File image) async {
    try {
      final url =
          "https://asia-southeast2-rantea-app-422901.cloudfunctions.net/rantea-predict/rantea-prediction";

      var formData =
          FormData.fromMap({'file': await MultipartFile.fromFile(image.path)});

      // Kirim permintaan
      final response = await Dio().post(
        url,
        data: formData,
      );
      print('status code : ${response.statusCode}');
      if (response.statusCode == 200) {
        var responseBody = response.data;

        if (responseBody is Map<String, dynamic>) {
          var className = responseBody["class_name"];
          var probability = responseBody["probability"];

          print('HASIL: ${className}, DAN ${probability}');

          return {
            "class_name": className ?? 'Empty',
            "probability": probability ?? '0.0',
          };
        } else {
          print("Respons API tidak valid: ${response.data}");
          return {
            "class_name": 'Empty',
            "probability": '0.0',
          };
        }
      } else {
        print("Gagal mendapatkan prediksi: ${response.statusMessage}");
        throw Exception("Failed to get prediction: ${response.statusMessage}");
      }
    } catch (e) {
      print("Error sending image data to API: $e");
      return {
        "class_name": 'Empty',
        "probability": '0.0',
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    String teaType = '';
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    offset: Offset(0, 3) // Shadow position
                    ),
              ],
            ),
            height: size.height * 0.08,
            alignment: AlignmentDirectional.center,
            child: Text(
              "Profil",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.grey[200]),
          width: size.width * 0.9,
          height: size.height * 0.1,
          child: Row(
            children: [
              Spacer(),
              Icon(
                Icons.account_circle_rounded,
                size: 50,
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    '${user?.email.toString().split('@').first.toUpperCase()}',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${user?.email}',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Spacer()
                ],
              ),
              Spacer(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(size.width * 0.9, size.height * 0.08),
              backgroundColor: Color(0xFFABD1C6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            onPressed: () async {
              await auth.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => signIn()),
                (Route<dynamic> route) => false,
              );
            },
            child: Row(
              children: [
                const Spacer(),
                Icon(
                  Icons.login_rounded,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Log Out',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Spacer()
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.grey[200]),
          width: size.width * 0.9,
          height: size.height * 0.3,
          child: Row(
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset('lib/images/guestProfil_1.png')),
              Spacer(),
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 200,
                      child: Text(
                        'Aplikasi ini masih dalam tahap Pengembangan🌱',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      'Bantu kami dengan memberikan masukan/kendala/bug agar aplikasi Rantea menjadi lebih baik lagi!',
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width * 0.3, size.height * 0.05),
                      backgroundColor: Color(0xFF133A40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => umpanBalikUser()),
                      );
                    },
                    child: Text(
                      'Umpan Balik',
                      style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(size.width * 0.3, size.height * 0.05),
            backgroundColor: Color(0xFF133A40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onPressed: () async {
            final File? imageAlbum = await getImage();
            print('pathnya: ${imageAlbum}'); // tunggu hasil getImage
            if (imageAlbum != null) {
              var prediction = await sendImageToApi(imageAlbum);
            } else {
              print('No image selected');
            }
          },
          child: Text(
            'Buka Gallery',
            style: GoogleFonts.poppins(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
