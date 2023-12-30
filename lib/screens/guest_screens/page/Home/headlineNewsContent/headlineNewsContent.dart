import 'package:flutter/material.dart';

List<Widget> pages = [
  Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue[300],
        image: DecorationImage(
            image: AssetImage('lib/images/headlineNewsGuest_1.png'),
            fit: BoxFit.cover)),
  ),
  Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red[300],
        image: DecorationImage(
            image: AssetImage('lib/images/headlineNewsGuest_1.png'),
            fit: BoxFit.cover)),
  ),
  Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black87,
        image: DecorationImage(
            image: AssetImage('lib/images/headlineNewsGuest_1.png'),
            fit: BoxFit.cover)),
  ),
];
