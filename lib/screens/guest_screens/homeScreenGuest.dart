import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/screens/guest_screens/page/Home/homeGuest.dart';

import 'page/Profil/profilGuest.dart';

class homeScreenGuest extends StatefulWidget {
  const homeScreenGuest({super.key});

  @override
  State<homeScreenGuest> createState() => _homeScreenGuestState();
}

class _homeScreenGuestState extends State<homeScreenGuest> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Column(
            children: [
              Container(
                child: _widgetOptions.elementAt(_selectedIndex),
              )
            ],
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_rounded),
                label: 'Profil',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xFF133A40),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  static const List<Widget> _widgetOptions = <Widget>[
    homeGuest(),
    profilGuest(),
  ];
}
