import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:flutter/material.dart';

Future<void> addUser(String email, String username) {
  CollectionReference users = FirebaseFirestore.instance
      .collection('users')
      .doc('account')
      .collection('user_details');
  // Call the user's CollectionReference to add a new user
  return users
      .add({
        'email': email, // John Doe
        'username': username, // Stokes and Sons/ 42
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
