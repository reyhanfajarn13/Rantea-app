import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding.dart';
import 'home.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboard();
  }

  _navigateToOnboard() async {
    await Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => onBoarding())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff133A40),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 250,
            ),
            Container(
              alignment: Alignment.center,
              child: AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: 1.0,
                duration: const Duration(milliseconds: 1500),
                // The green box must be a child of the AnimatedOpacity widget.
                child: Container(
                  child: Image.asset('lib/images/logo_rantea.png'),
                ),
              ),
            ),
            SizedBox(
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                    width: 150,
                    child: Text(
                      'Hasil berkolaborasi dengan:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w600),
                    )),
                Container(
                  alignment: Alignment.center,
                  width: 100.55,
                  child: Image.asset('lib/images/logo_ptpn.png'),
                ),
                const Spacer(
                  flex: 2,
                )
              ],
            )
          ],
        ),
      ),
    );

    //Scaffold(

    //     body: Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Container(
    //         height: 100,
    //         width: 100,
    //         color: Colors.blue,
    //       ),
    //       Container(
    //         child: Text('Rantea',
    //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    //       ),
    //     ],
    //   ),
    // )
    // );
  }
}
