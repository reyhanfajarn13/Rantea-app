import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class PieChartScreen extends StatefulWidget {
  @override
  _PieChartScreenState createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen> {
  List<PieChartSectionData> _pieChartSections = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchChartData();
  }

  Future<void> _fetchChartData() async {
    // Fetch data from Firestore
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('history')
        .collection('tea_detail')
        .get();

    List<QueryDocumentSnapshot> documents = querySnapshot.docs;

    // Step 1: Create a map to accumulate total berat by prediction type
    Map<String, double> totalBeratByPrediction = {};

    documents.forEach((document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      String predictionTeaType = data['predictionTeaType'];
      double totalBerat = data['totalBerat'].toDouble(); // Parse to double

      // Add or update totalBerat for each predictionTeaType
      totalBeratByPrediction.update(
          predictionTeaType, (value) => value + totalBerat,
          ifAbsent: () => totalBerat);
    });

    // Step 2: Calculate the total of all sections
    double totalBerat = totalBeratByPrediction.values.reduce((a, b) => a + b);

    // Step 3: Convert data to PieChartSectionData with percentages
    List<PieChartSectionData> sections = [];

    totalBeratByPrediction.forEach((prediction, totalWeight) {
      double percentage = (totalWeight / totalBerat) * 100;

      final section = PieChartSectionData(
        color: _randomColor(),
        value: totalWeight,
        title:
            '$prediction\n${percentage.toStringAsFixed(1)}%', // Display percentage
        radius: 100,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
      sections.add(section);
    });

    // Update the state with the new sections
    setState(() {
      _pieChartSections = sections;
      _loading = false;
    });
  }

  Color _randomColor() {
    // Generate random color
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(child: CircularProgressIndicator())
        : Center(
            child: PieChart(
              PieChartData(
                sections: _pieChartSections,
                borderData: FlBorderData(show: false),
                centerSpaceRadius: 0,
              ),
            ),
          );
  }
}
