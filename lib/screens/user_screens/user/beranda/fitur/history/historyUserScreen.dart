import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class historyUserScreen extends StatefulWidget {
  const historyUserScreen({Key? key});

  @override
  State<historyUserScreen> createState() => _historyUserScreenState();
}

TextEditingController _dateController = TextEditingController();

class _historyUserScreenState extends State<historyUserScreen> {
  int dropdownValue = 4;
  List<Map<String, dynamic>> allData = [];
  Map<String, List<Map<String, dynamic>>> filteredData = {};

  @override
  void initState() {
    _initializeData();
    super.initState();
    // Inisialisasi data saat widget pertama kali dibuat
  }

  void _initializeData() {
    allData.clear();
    filteredData.clear();
    // Ambil data dari Firebase
    FirebaseFirestore.instance
        .collection('users')
        .doc('history')
        .collection('tea_detail')
        .orderBy('timestamp', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        allData.add(data);
      });
      // Tampilkan 100 data pertama
      for (int i = 0; i < min(100, allData.length); i++) {
        Map<String, dynamic> data = allData[i];
        String timestamp = data['timestamp'];
        filteredData.putIfAbsent(timestamp, () => []);
        filteredData[timestamp]!.add(data);
      }
      // Perbarui tampilan
      setState(() {});
    }).catchError((error) {
      print("Failed to fetch data: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Riwayat',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
          );
        }

        // Ambil semua data dari snapshot
        allData.clear();
        snapshot.data!.docs.forEach((document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          allData.add(data);
        });

        // Filter data berdasarkan tanggal yang dipilih
        _filterDataByDate(DateTime selectedDate) {
          filteredData.clear();
          for (int i = 0; i < allData.length; i++) {
            Map<String, dynamic> data = allData[i];
            String timestamp = data['timestamp'];
            DateTime dataDate = DateFormat('MMMM d, yyyy').parse(timestamp);
            if (dataDate.year == selectedDate.year &&
                dataDate.month == selectedDate.month &&
                dataDate.day == selectedDate.day) {
              filteredData.putIfAbsent(timestamp, () => []);
              filteredData[timestamp]!.add(data);
            }
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Riwayat',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              SizedBox(height: 5),
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
                        prefixIcon: Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _dateController.text =
                                DateFormat('MMMM d, yyyy').format(pickedDate);
                            _filterDataByDate(pickedDate);
                          });
                        } else {
                          // Jika user membatalkan pemilihan tanggal, tampilkan 100 data
                          setState(() {
                            if (_dateController.text.isEmpty) {
                              filteredData.clear();
                              for (int i = 0;
                                  i < min(100, allData.length);
                                  i++) {
                                Map<String, dynamic> data = allData[i];
                                String timestamp = data['timestamp'];
                                filteredData.putIfAbsent(timestamp, () => []);
                                filteredData[timestamp]!.add(data);
                              }
                            }
                          });
                        }
                      },
                    ),
                  ),
                  // DropdownMenu<int>(
                  //   textStyle: TextStyle(fontSize: 16),
                  //   initialSelection: dropdownValue,
                  //   onSelected: (int? value) {
                  //     // This is called when the user selects an item.
                  //     if (value != null) {
                  //       setState(() {
                  //         dropdownValue = value;
                  //       });
                  //     }
                  //   },
                  //   dropdownMenuEntries:
                  //       list.map<DropdownMenuEntry<int>>((int value) {
                  //     return DropdownMenuEntry<int>(
                  //         value: value, label: value.toString());
                  //   }).toList(),
                  //   width: 90,
                  // ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width * 0.2, size.height * 0.06),
                      backgroundColor: Color(0xFF133A40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () async {
                      _dateController.clear();
                      _initializeData();
                    },
                    child: Text(
                      'Clear',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: filteredData.keys.map((String timestamp) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                SizedBox(width: 15),
                                Text(
                                  timestamp,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: filteredData[timestamp]!.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> data =
                                  filteredData[timestamp]![index];
                              return Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Card(
                                  child: SizedBox(
                                    height: 200,
                                    child: Column(
                                      children: [
                                        Spacer(),
                                        Row(
                                          children: [
                                            SizedBox(width: 10),
                                            Container(
                                              height: 160,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
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
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                subtitle: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'User Predict By: ${data['userPredictBy']}',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Total Berat: ${data['totalBerat']}',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
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
              ),
            ],
          ),
        );
      },
    );
  }
}
