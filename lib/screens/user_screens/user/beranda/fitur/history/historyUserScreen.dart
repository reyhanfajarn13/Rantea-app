import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        Map<String, List<Map<String, dynamic>>> groupedData = {};
        snapshot.data!.docs.forEach((document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          String timestamp = data['timestamp'];
          groupedData.putIfAbsent(timestamp, () => []);
          groupedData[timestamp]!.add(data);
        });

        return Container(
          color: Colors.green,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: groupedData.keys.map((String timestamp) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Container(
                        color: Colors.white,
                        child: Text(
                          timestamp,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
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
                            color: Colors.lightBlue,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      child: Image.network(data['imageUrl']),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          'Prediction Tea Type: ${data['predictionTeaType']}',
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'User Predict By: ${data['userPredictBy']}'),
                                            Text(
                                                'Timestamp: ${data['timestamp']}'),
                                            Text(
                                                'Total Berat: ${data['totalBerat']}'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
      },
    );
  }
}
