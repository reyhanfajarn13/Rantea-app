import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/screens/guest_screens/page/registration/firebase.dart';
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

class _registerScreenState extends State<registerScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.2,
            alignment: Alignment.center,
            child: Image.asset(
              'lib/images/logo_rantea_3.png',
            ),
          ),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      fillColor: Colors.white60,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.person_rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: passwordController,
                    //obscureText: passVisibility,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.lock_rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                      // suffixIcon: IconButton(
                      //     icon: Icon(
                      //       _passVisibility
                      //           ? Icons.visibility
                      //           : Icons.visibility_off,
                      //       color: Colors.grey,
                      //       size: 20,
                      //     ),
                      //     onPressed: () {
                      //       setState(() {
                      //         _passVisibility = !_passVisibility;
                      //       });
                      //     }),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: usernameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      fillColor: Colors.white60,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.person_rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(alignment: Alignment.center, child: RegisterButton())
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

//CLASS LOGIN BUTTON
class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          try {
            UserCredential userCredential =
                await _auth.createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
            await addUser(emailController.text, usernameController.text);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => loginUser()),
            );
          } catch (e) {
            print("Error signing up: $e");
          }
        },
        style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(300),
            backgroundColor: Color(0xFF133A40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
        child: Text(
          'Register',
          style: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
        ));
  }
}
