import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'beranda/homeUser.dart';
import 'package:flutter_svg/flutter_svg.dart';

class homeScreenUser extends StatefulWidget {
  const homeScreenUser({super.key});

  @override
  State<homeScreenUser> createState() => _homeScreenUserState();
}

class _homeScreenUserState extends State<homeScreenUser> {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 75,
        height: 75,
        child: FloatingActionButton(
          backgroundColor: Color(0xFF133A40),
          onPressed: () {
            // Add your onPressed code here!
          },
          child: SvgPicture.asset('lib/images/logo_scan.svg'),
        ),
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
            unselectedItemColor: Colors.grey[600],
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Beranda',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.app_registration_rounded),
              //   label: 'Artikel',
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.app_registration_rounded),
              //   label: 'Artikel',
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.history_rounded),
              //   label: 'Riwayat',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_rounded),
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
    homeUser(),
    Text(
      'Index 1: Business',
    ),
  ];
}
