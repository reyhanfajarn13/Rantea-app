import 'package:flutter/material.dart';

List<Widget> pages = [
  Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue[300],
        image: DecorationImage(
            image: AssetImage('lib/images/signin_pict.png'),
            fit: BoxFit.cover)),
    child: Center(child: Text('Page 1')),
  ),
  Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red[300],
        image: DecorationImage(
            image: AssetImage('lib/images/signin_pict.png'),
            fit: BoxFit.cover)),
    child: Center(child: Text('Page 2')),
  ),
  Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black87,
        image: DecorationImage(
            image: AssetImage('lib/images/signin_pict.png'),
            fit: BoxFit.cover)),
    child: Center(child: Text('Page 3')),
  ),
];
