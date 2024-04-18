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

    // Process data
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

    // Convert data to PieChartSectionData
    List<PieChartSectionData> sections = [];
    totalBeratByPrediction.forEach((prediction, totalBerat) {
      final value = PieChartSectionData(
        color: _randomColor(),
        value: totalBerat,
        title:
            '$prediction\n${totalBerat.toStringAsFixed(2)}', // Label format: PredictionType\nTotalBerat
        radius: 100,
        titleStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      );
      sections.add(value);
    });

    setState(() {
      _pieChartSections = sections;
      _loading = false;
    });
  }

  Color _randomColor() {
    // Generate random color
    return Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
        .withOpacity(1.0);
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
