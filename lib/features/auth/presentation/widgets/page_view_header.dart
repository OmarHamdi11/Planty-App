import 'package:flutter/material.dart';

class PageViewHeader extends StatelessWidget {
  const PageViewHeader({
    super.key,
    required PageController pageController,
    required this.currentPage,
  }) : _pageController = pageController;

  final PageController _pageController;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    if (currentPage == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Sign in text with underline
          Column(
            children: [
              const Text(
                'sign in',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 41,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff49640F),
                ),
              ),
              Container(
                width: 80,
                height: 4,
                color: const Color(0xff49640F),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Sign up text with opacity
          GestureDetector(
            onTap: () {
              _pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            child: Column(
              children: [
                Text(
                  'sign up',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 41,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff49640F).withOpacity(.40),
                  ),
                ),
                Container(
                  width: 80,
                  height: 4,
                  color: const Color(0xff49640F).withOpacity(.40),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Sign in text with opacity
          GestureDetector(
            onTap: () {
              _pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            child: Column(
              children: [
                Text(
                  'sign in',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 41,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff49640F).withOpacity(.40),
                  ),
                ),
                Container(
                  width: 80,
                  height: 4,
                  color: const Color(0xff49640F).withOpacity(.40),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Sign up text with underline
          Column(
            children: [
              const Text(
                'sign up',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 41,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff49640F),
                ),
              ), // Underline for sign-up
              Container(
                width: 80,
                height: 4,
                color: const Color(0xff49640F),
              ),
            ],
          ),
        ],
      );
    }
  }
}
