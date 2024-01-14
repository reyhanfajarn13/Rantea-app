import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> getImageUrl(String image) async {
    // Get the reference to the image file in Firebase Storage
    try {
      final ref = _storage.ref('images').child(image);
      // Get teh imageUrl to download URL
      final url = await ref.getDownloadURL();

      final imageUrl = url;
      return imageUrl;
    } catch (e) {
      return null;
    }
  }
}
