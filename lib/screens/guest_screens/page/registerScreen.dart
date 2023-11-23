import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rantea_app/screens/user_screens/loginScreenUser.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

final _formKey = GlobalKey<FormState>();
final _auth = FirebaseAuth.instance;

final TextEditingController passwordController = new TextEditingController();
final TextEditingController confirmPasswordController =
    new TextEditingController();
final TextEditingController emailController = new TextEditingController();
final TextEditingController usernameController = new TextEditingController();

File? file;
var options = [
  'Admin',
  'Penguji',
];

var _currentItemSelected = "Admin";
var role = "Admin";

void signUpUser(
    String email, String password, String username, String role) async {
  if (_formKey.currentState!.validate()) {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFireStore(email, username, role)})
        .catchError((e) {});
  }
}

postDetailsToFireStore(String email, String username, String role) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var user = _auth.currentUser;
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  ref.doc(user!.uid).set({
    'email': emailController.text,
    'username': usernameController.text,
    'role': role
  });
}

class _registerScreenState extends State<registerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('Register Screen'),
      ),
    );
  }
}
