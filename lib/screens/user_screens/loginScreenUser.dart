import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/screens/home.dart';

class loginUser extends StatefulWidget {
  const loginUser({super.key});

  @override
  State<loginUser> createState() => _loginUserState();
}

class _loginUserState extends State<loginUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 65.0, 0, 0),
            alignment: Alignment.center,
            child: Image.asset(
              'lib/images/logo_rantea_3.png',
            ),
          ),
          const Spacer(),
          Text("Username"),
          Text("Password"),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(
                              title: '',
                            )));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(300),
                  backgroundColor: Color(0xFF133A40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
              child: Text(
                'Masuk',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ))
        ],
      ),
    );
  }
}
