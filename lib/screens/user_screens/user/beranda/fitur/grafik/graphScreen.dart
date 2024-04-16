import 'package:flutter/material.dart';

class graphScreen extends StatelessWidget {
  const graphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Grafik',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF133A40),
        centerTitle: true,
      ),
    );
  }
}
