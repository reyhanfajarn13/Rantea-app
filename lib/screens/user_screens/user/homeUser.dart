import 'package:flutter/material.dart';

class homeUser extends StatefulWidget {
  const homeUser({super.key});

  @override
  State<homeUser> createState() => _homeUserState();
}

class _homeUserState extends State<homeUser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          height: 500,
          child: Center(
            child: Text('index 0: Home'),
          ),
        )
      ],
    );
  }
}
