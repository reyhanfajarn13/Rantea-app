import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rantea_app/screens/user_screens/user/homeScreenUser.dart';

class loadingPage extends StatefulWidget {
  const loadingPage({super.key});

  @override
  State<loadingPage> createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboard();
  }

  _navigateToOnboard() async {
    await Timer(
        Duration(milliseconds: 2500),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => homeScreenUser())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff133A40),
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: SpinKitWaveSpinner(
              color: Colors.white,
              size: 150,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            child: Image.asset('lib/images/logo_rantea.png'),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
