import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/screens/home.dart';
import 'admin/homeScreenAdmin.dart';
import 'user/homeScreenUser.dart';

class loginUser extends StatefulWidget {
  const loginUser({super.key});

  @override
  State<loginUser> createState() => _loginUserState();
}

class _loginUserState extends State<loginUser> {
  bool _passVisibility = true;
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passController = TextEditingController();

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
                    controller: _emailController,
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
                    controller: _passController,
                    obscureText: _passVisibility,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.lock_rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                      suffixIcon: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _passVisibility
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                          size: 20,
                        ),
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
                Container(alignment: Alignment.center, child: LoginButton())
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _passVisibility = !_passVisibility;
    });
  }
}

//CLASS LOGIN BUTTON
class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => homeScreenAdmin()));
        },
        style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(300),
            backgroundColor: Color(0xFF133A40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
        child: Text(
          'Masuk',
          style: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
        ));
  }
}
