import 'package:flutter/material.dart';

import 'package:innovation/views/onboarding/first_page.dart';
import 'package:innovation/views/onboarding/second_page.dart';
import 'package:innovation/views/onboarding/third_page.dart';
import 'package:innovation/views/screens/login_page.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingPage extends StatefulWidget {
  const OnBordingPage({super.key});

  @override
  State<OnBordingPage> createState() => _OnBordingPageState();
}

class _OnBordingPageState extends State<OnBordingPage> {
  final PageController _pageController = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 110),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: const [FirstPage(), SecondPage(), ThirdPage()],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: SmoothPageIndicator(
                effect: const WormEffect(
                    dotColor: Colors.grey, activeDotColor: Colors.black),
                onDotClicked: (index) {
                  _pageController.animateToPage(index,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500));
                },
                controller: _pageController,
                count: 3,
              ),
            ),
            isLastPage
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onPressed: () async {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));

                      // local data
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', false);
                    },
                    // get started button
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.white),
                    ))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        // skip button
                        TextButton(
                            onPressed: () => _pageController.jumpToPage(2),
                            child: const Text(
                              "SKIP",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black),
                            )),
                        // next button
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            onPressed: () => _pageController.nextPage(
                                curve: Curves.easeInOut,
                                duration: const Duration(milliseconds: 500)),
                            child: const Text(
                              "NEXT",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.white),
                            ))
                      ]),
          ],
        ),
      ),
    );
  }
}
