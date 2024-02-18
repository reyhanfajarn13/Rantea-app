import 'dart:async';
import 'package:flutter/material.dart';
import '../homeGuest.dart';
import 'pages/pagePengenalan1.dart';
import 'pages/pagePengenalan2.dart';
import 'pages/pagePengenalan3.dart';
import 'pengenalanContent.dart';

class slidePengenalanContent extends StatefulWidget {
  @override
  _slidePengenalanContentState createState() => _slidePengenalanContentState();
}

class _slidePengenalanContentState extends State<slidePengenalanContent> {
  PageController pageController = PageController();
  int currentIndex = 0;
  var currentTabs = [pagePengenalan1(), pagePengenalan2(), pagePengenalan3()];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
        pageController.animateToPage(
          currentIndex,
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeIn,
        );
      } else {
        currentIndex = 2;
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF133A40), Color(0xFF69D19F)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(
            top: 30, // Adjust this value according to your layout
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                currentTabs.length,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: DotIndicator(isActive: index == currentIndex),
                ),
              ),
            ),
          ),
          Positioned(
            top: 45, // Adjust this value according to your layout
            left: 0,
            right: 0,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              IconButton(
                  iconSize: 35,
                  onPressed: () async {
                    await Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => homeGuest()),
                    );
                  },
                  icon: Icon(
                    Icons.west_rounded,
                    color: Colors.white,
                    fill: 0.0,
                  ))
            ]),
          ),
          PageView(
            children: currentTabs,
            controller: pageController,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ]),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 120 : 120,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
