import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reportTeaCard.dart';

class graphScreen extends StatelessWidget {
  const graphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Map<String, List> teaType = {
      'valueBT': ['BT4', 'BT3', 'BT2'],
      'valueBOPF': ['BOPF3', 'BOPF4'],
      'valueBP': ['BP3', 'BP4'],
      'valueDUST': ['DUST3', 'DUST4'],
      'valuePF': ['PF2', 'PF3', 'PF4']
    };

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Grafik',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF133A40),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            // padding: EdgeInsets.only(left: size.width * 0.05),
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    Container(
                      width: size.width * 0.2,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Color(0xFF133A40)),
                    ),
                    Spacer(),
                    Icon(
                      Icons.assignment_outlined,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Laporan Harian Teh',
                      style: GoogleFonts.urbanist(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Spacer(),
                    Container(
                      width: size.width * 0.2,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Color(0xFF133A40)),
                    ),
                    Spacer()
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: Row(
              children: [
                Text(
                  'Tanggal :',
                  style: GoogleFonts.urbanist(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                SizedBox(width: 10),
                Text(
                  '16 juni 2023',
                  style: GoogleFonts.urbanist(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: size.width * 1,
            padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
            child: Column(
              children: [
                reportTeaCard(
                  groupTeaType: 'BT',
                  firstTeaType: teaType['valueBT']!,
                  listlength: teaType['valueBT']!.length,
                ),
                reportTeaCard(
                  groupTeaType: 'BOPF',
                  firstTeaType: teaType['valueBOPF']!,
                  listlength: teaType['valueBOPF']!.length,
                ),
                reportTeaCard(
                  groupTeaType: 'BP',
                  firstTeaType: teaType['valueBP']!,
                  listlength: teaType['valueBP']!.length,
                ),
                reportTeaCard(
                  groupTeaType: 'DUST',
                  firstTeaType: teaType['valueDUST']!,
                  listlength: teaType['valueDUST']!.length,
                ),
                reportTeaCard(
                  groupTeaType: 'PF',
                  firstTeaType: teaType['valuePF']!,
                  listlength: teaType['valuePF']!.length,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
