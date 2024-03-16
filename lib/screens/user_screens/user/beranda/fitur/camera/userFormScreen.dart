import 'package:flutter/material.dart';

class userFormScreen extends StatefulWidget {
  final String imageUrl;
  const userFormScreen({super.key, required this.imageUrl});

  @override
  State<userFormScreen> createState() => _userFormScreenState();
}

class _userFormScreenState extends State<userFormScreen> {
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Total Berat (gram)',
            ),
          ),
        ],
      ),
    ));
  }
}
