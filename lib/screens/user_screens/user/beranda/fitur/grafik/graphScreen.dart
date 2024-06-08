import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'reportTeaCard.dart';

class graphScreen extends StatefulWidget {
  const graphScreen({super.key});

  @override
  State<graphScreen> createState() => _graphScreenState();
}

class _graphScreenState extends State<graphScreen> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  List<Map<String, dynamic>> allData = [];
  Map<String, double> totalWeights = {};
  late Future<Map<String, double>> _fetchDataFuture;

  @override
  void initState() {
    super.initState();

    _fetchDataFuture = fetchData('', '');
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  Map<String, List<String>> teaType = {
    'BT': ['BT4', 'BT3', 'BT2'],
    'BOPF': ['BOPF3', 'BOPF4'],
    'BP': ['BP3', 'BP4'],
    'DUST': ['DUST3', 'DUST4'],
    'PF': ['PF2', 'PF3', 'PF4']
  };

  Future<Map<String, double>> fetchData(
      String startDate, String endDate) async {
    final data = await fetchTeaTotalWeightData(startDate, endDate);
    Map<String, double> weights = {};

    for (var group in teaType.values) {
      for (var type in group) {
        weights[type] = data[type]?['total_berat']?.toDouble() ?? 0.0;
      }
    }
    return weights;
  }

  Future<Map> fetchTeaTotalWeightData(String startDate, String endDate) async {
    final Dio dio = Dio();
    final String url =
        'https://asia-southeast2-rantea-app-422901.cloudfunctions.net/get_calculated_data';

    try {
      final Response response = await dio.post(
        url,
        data: {
          'start_date': startDate.toString(),
          'end_date': endDate.toString(),
        },
      );

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic>) {
          return response.data as Map<String, dynamic>;
        } else {
          throw Exception('Unexpected response type');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, double> totalWeights = {};

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Laporan',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF133A40),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
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
                      Icon(Icons.assignment_outlined, color: Colors.green),
                      const SizedBox(width: 10),
                      Text(
                        'Laporan Performa Teh',
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
                      Spacer(),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: size.width * 0.7,
                  height: 60,
                  child: TextField(
                    controller: _startDateController,
                    decoration: InputDecoration(
                      labelText: 'Tanggal Mulai',
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: () async {
                      DateTimeRange? pickedDateRange =
                          await showDateRangePicker(
                        context: context,
                        initialDateRange: DateTimeRange(
                          start: DateTime.now().subtract(Duration(days: 7)),
                          end: DateTime.now(),
                        ),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDateRange != null) {
                        setState(() {
                          _startDateController.text = DateFormat('MMMM d, yyyy')
                              .format(pickedDateRange.start);
                          _endDateController.text = DateFormat('MMMM d, yyyy')
                              .format(pickedDateRange.end);
                        });
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width * 0.2, size.height * 0.06),
                    backgroundColor: Color(0xFF133A40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _startDateController.clear();
                      _endDateController.clear();
                      totalWeights.clear();
                    });
                  },
                  child: Text(
                    'Clear',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
                    '${_startDateController.text} - ${_endDateController.text}',
                    style: GoogleFonts.urbanist(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(size.width * 0.8, size.height * 0.06),
                backgroundColor: Color(0xFF133A40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              onPressed: () {
                String _startDate = _startDateController.text;
                String _endDate = _endDateController.text;
                setState(() {
                  _fetchDataFuture = fetchData(_startDate, _endDate);
                });
              },
              child: Text(
                'Filter',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 15),
            FutureBuilder<Map<String, double>>(
              future: _fetchDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: Lottie.asset(
                          'lib/images/loadingAnimationScreen.json'));
                } else if (snapshot.hasError) {
                  return Container(
                    width: size.width,
                    padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                    child: Column(
                      children: teaType.keys.map((groupTeaType) {
                        List<String> firstTeaType = teaType[groupTeaType]!;
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: reportTeaCard(
                            groupTeaType: groupTeaType,
                            firstTeaType: firstTeaType,
                            listlength: firstTeaType.length,
                            totalWeights: totalWeights,
                          ),
                        );
                      }).toList(),
                    ),
                  );
                } else if (snapshot.hasData) {
                  totalWeights = snapshot.data!;
                  return Container(
                    width: size.width,
                    padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                    child: Column(
                      children: teaType.keys.map((groupTeaType) {
                        List<String> firstTeaType = teaType[groupTeaType]!;
                        return reportTeaCard(
                          groupTeaType: groupTeaType,
                          firstTeaType: firstTeaType,
                          listlength: firstTeaType.length,
                          totalWeights: totalWeights,
                        );
                      }).toList(),
                    ),
                  );
                }
                return Container();
              },
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
