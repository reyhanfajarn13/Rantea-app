import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:io';
import 'displayPicture.dart';

class takePictureCamera extends StatefulWidget {
  const takePictureCamera({super.key, required this.camera});

  final CameraDescription camera;
  @override
  State<takePictureCamera> createState() => _takePictureCameraState();
}

class _takePictureCameraState extends State<takePictureCamera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.high,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  Future<File?> getImage() async {
    final XFile? image = await _controller.takePicture();

    File file = File(image!.path);
//print(‘Image picked’);
    return file;
  }

  Future<Map<String, dynamic>> sendImageToApi(
      BuildContext context, File image) async {
    try {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
              child: Lottie.asset('lib/images/loadingAnimationScreen.json'));
        },
      );
      final url =
          "https://asia-southeast2-rantea-app-422901.cloudfunctions.net/rantea-predict-wbrgb/rantea-prediction";

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
          var className = responseBody["class_name"].toString();
          var probability = responseBody["probability"].toString();

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
      Navigator.pop(context);
    } catch (e) {
      print("Error sending image data to API: $e");
      return {
        "class_name": 'Empty',
        "probability": '0.0',
      };
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Center(
          child: new Text(
            "Uji Mutu Bubuk Teh",
            style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview if the controller is initialized.
                if (_controller.value.isInitialized) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: CameraPreview(_controller),
                        ),
                      ),
                      Center(
                        child: Lottie.asset(
                          'lib/images/loadingAnimationScreen.json',
                          // Path to your Lottie animation file
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                      child: Lottie.asset(
                          'lib/images/loadingAnimationScreen.json'));
                }
              } else {
                // Otherwise, display a loading indicator.
                return Center(
                    child:
                        Lottie.asset('lib/images/loadingAnimationScreen.json'));
              }
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: FloatingActionButton(
          onPressed: () async {
            try {
              await _initializeControllerFuture;

              // Add a short delay to allow the camera to release its resources
              await Future.delayed(Duration(milliseconds: 500));
              final File? imageFile = await getImage();

              if (await imageFile != null) {
                print(
                    "File exists, path: ${imageFile}"); // Pastikan file gambar ada
                final prediction = await sendImageToApi(context, imageFile!);
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DisplayPictureScreen(
                      imagePath: imageFile.path,
                      predictionTeaType: prediction['class_name'] ?? 'Empty',
                      probability: prediction['probability'] ?? '0.0',
                      controller: _controller,
                    ),
                  ),
                );
              } else {
                print(
                    "File does not exist, path: ${imageFile}"); // Jika file tidak ada
              }

              if (!mounted) return;
            } catch (e) {
              print(e);
            }
          },
          child: const Icon(
            Icons.circle,
            color: Colors.white,
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: Colors.green),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
