import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  return Positioned.fill(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: CameraPreview(_controller),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              } else {
                // Otherwise, display a loading indicator.
                return const Center(child: CircularProgressIndicator());
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

              final image = await _controller.takePicture();

              if (!mounted) return;

              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DisplayPictureScreen(
                    imagePath: image.path,
                    predictionTeaType: 'DUST 4',
                    controller: _controller,
                  ),
                ),
              );
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
