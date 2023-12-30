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
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 3,
            ),
          ],
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
    );
  }

  static const List<Widget> _widgetOptions = <Widget>[
    homeGuest(),
    profilGuest(),
  ];
}
