import 'package:flutter/material.dart';

class tabelNilai extends StatelessWidget {
  const tabelNilai({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Tabel Nilai',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF133A40),
        centerTitle: true,
      ),
    );
  }
}
