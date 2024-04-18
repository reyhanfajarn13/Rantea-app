import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'historyPagination.dart';

class historyUserScreen extends StatefulWidget {
  const historyUserScreen({Key? key});

  @override
  State<historyUserScreen> createState() => _historyUserScreenState();
}

TextEditingController _dateController = TextEditingController();

class _historyUserScreenState extends State<historyUserScreen> {
  int dropdownValue = 4;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const List<int> list = <int>[4, 25, 50, 100];
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc('history')
          .collection('tea_detail')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No data available'));
        }

        // Membuat Map untuk mengelompokkan data berdasarkan timestamp
        List<Map<String, dynamic>> allData = [];
        snapshot.data!.docs.forEach((document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          allData.add(data);
        });
// Sortir data berdasarkan timestamp secara menurun
        allData.sort((a, b) => b['timestamp'].compareTo(a['timestamp']));

        Map<String, List<Map<String, dynamic>>> groupedData = {};
        for (int i = 0; i < min(dropdownValue, allData.length); i++) {
          Map<String, dynamic> data = allData[i];
          String timestamp = data['timestamp'];
          groupedData.putIfAbsent(timestamp, () => []);
          groupedData[timestamp]!.add(data);
        }

        Future<void> selectedDate() async {
          DateTime? _picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (_picked != null) {
            setState(() {
              _dateController.text = DateFormat('MMMM d, yyyy').format(_picked);
              // Filter data berdasarkan tanggal yang dipilih
              groupedData.clear();
              for (int i = 0; i < min(dropdownValue, allData.length); i++) {
                Map<String, dynamic> data = allData[i];
                String timestamp = data['timestamp'];
                // Mengonversi format tanggal dari timestamp ke format yang sama dengan _dateController
                DateTime dataDate = DateFormat('MMMM d, yyyy').parse(timestamp);
                DateTime pickedDate =
                    DateTime(_picked.year, _picked.month, _picked.day);
                if (dataDate.year == pickedDate.year &&
                    dataDate.month == pickedDate.month &&
                    dataDate.day == pickedDate.day) {
                  groupedData.putIfAbsent(timestamp, () => []);
                  groupedData[timestamp]!.add(data);
                }
              }
            });
          }
        }

        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            title: const Text('Riwayat',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            backgroundColor: Color(0xFF133A40),
            centerTitle: true,
          ),
          body: Container(
            color: Colors.white70,
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: size.width * 0.7,
                      height: 60,
                      child: TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: 'Tanggal',
                          filled: true,
                          prefixIcon: Icon(Icons.calendar_month_rounded),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(
                                10), // Mengatur radius border kotak input
                          ),
                        ),
                        onTap: () {
                          selectedDate();
                        },
                      ),
                    ),
                    DropdownMenu<int>(
                      textStyle: TextStyle(fontSize: 16),
                      initialSelection: dropdownValue,
                      onSelected: (int? value) {
                        // This is called when the user selects an item.
                        if (value != null) {
                          setState(() {
                            dropdownValue = value;
                          });
                        }
                      },
                      dropdownMenuEntries:
                          list.map<DropdownMenuEntry<int>>((int value) {
                        return DropdownMenuEntry<int>(
                            value: value, label: value.toString());
                      }).toList(),
                      width: 90,
                    ),
                  ],
                ),
                historyScrollableView(groupedData: groupedData),
              ],
            ),
          ),
        );
      },
    );
  }
}

class historyScrollableView extends StatelessWidget {
  const historyScrollableView({
    super.key,
    required this.groupedData,
  });

  final Map<String, List<Map<String, dynamic>>> groupedData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: groupedData.keys.map((String timestamp) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          timestamp,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: groupedData[timestamp]!.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data = groupedData[timestamp]![index];
                    return Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Card(
                        color: Colors.white70,
                        child: SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              Spacer(),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 120,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        data['imageUrl'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        '${data['predictionTeaType']}',
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'User Predict By: ${data['userPredictBy']}',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87),
                                          ),
                                          Text(
                                            'Timestamp: ${data['timestamp']}',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87),
                                          ),
                                          Text(
                                            'Total Berat: ${data['totalBerat']}',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer()
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
