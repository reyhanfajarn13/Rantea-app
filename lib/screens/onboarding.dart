import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rantea_app/static/onboard_models.dart';
import 'signIn.dart';

class onBoarding extends StatefulWidget {
  onBoarding({Key? key}) : super(key: key);

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  // final pages = [
  late PageController _pageController;
  int _PageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _PageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardContent(
                      logo: demo_data[index].logo,
                      image: demo_data[index].image,
                      title: demo_data[index].title,
                      description: demo_data[index].description,
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: DotIndicator(isActive: index == _PageIndex),
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  SizedBox(
                    height: size.height * 0.075,
                    width: 111,
                    child: SignInRouteButton(
                      pageController: _pageController,
                      isNext: _PageIndex,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

class SignInRouteButton extends StatelessWidget {
  const SignInRouteButton({
    super.key,
    required PageController pageController,
    this.isNext,
  }) : _pageController = pageController;

  final PageController _pageController;

  final isNext;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (isNext == 2) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const signIn()));
          } else {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF133A40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
        child: isNext == 2
            ? Text(
                'Masuk',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )
            : Text(
                'Selanjutnya',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ));
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
      width: isActive ? 20 : 6,
      decoration: BoxDecoration(
          color:
              isActive ? Color(0xFF133A40) : Color(0xFF133A40).withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.logo,
    required this.image,
    required this.title,
    required this.description,
  });

  final String logo, image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(35.0, 15.0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Image.asset(
            logo,
            alignment: Alignment.center,
          ),
        ),
        const Spacer(),
        Image.asset(image),
        const Spacer(flex: 1),
        Column(
          children: [
            Container(
              width: 300,
              child: Text(title,
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 300,
              child: Text(description,
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12)),
            ),
          ],
        ),
        const Spacer()
      ],
    );
  }
}
