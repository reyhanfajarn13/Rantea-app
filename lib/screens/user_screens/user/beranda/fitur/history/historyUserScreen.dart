import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class historyUserScreen extends StatelessWidget {
  const historyUserScreen({Key? key});

  @override
  Widget build(BuildContext context) {
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
        for (int i = 0; i < min(4, allData.length); i++) {
          Map<String, dynamic> data = allData[i];
          String timestamp = data['timestamp'];
          groupedData.putIfAbsent(timestamp, () => []);
          groupedData[timestamp]!.add(data);
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
                Container(
                  color: Colors.red,
                  height: 100,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: groupedData.keys.map((String timestamp) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
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
                                Map<String, dynamic> data =
                                    groupedData[timestamp]![index];
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87),
                                                  ),
                                                  subtitle: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'User Predict By: ${data['userPredictBy']}',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black87),
                                                      ),
                                                      Text(
                                                        'Timestamp: ${data['timestamp']}',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black87),
                                                      ),
                                                      Text(
                                                        'Total Berat: ${data['totalBerat']}',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black87),
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
