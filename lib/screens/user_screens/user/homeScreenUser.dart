import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Profil/profilUser.dart';
import 'beranda/fitur/camera/takeCamera.dart';
import 'beranda/homeUser.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

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

  late CameraDescription firstCamera;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    // Ensure that plugin services are initialized so that `availableCameras()`
    // can be called before `runApp()`
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    firstCamera = cameras.first;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        // Exit the app
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          exit(0);
        }
        return false; // Disable back button
      },
      child: Scaffold(
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
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        takePictureCamera(camera: firstCamera)),
              );
            },
            shape: CircleBorder(),
            child: SvgPicture.asset('lib/images/logo_scan.svg'),
          ),
        ),
        bottomNavigationBar: Container(
          height: size.height * 0.1,
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
                  icon: Icon(
                    Icons.home_rounded,
                    size: 30,
                  ),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people_rounded, size: 30),
                  label: 'Profil',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Color(0xFF133A40),
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }

  static const List<Widget> _widgetOptions = <Widget>[
    homeUser(),
    profilUser(),
  ];
}
