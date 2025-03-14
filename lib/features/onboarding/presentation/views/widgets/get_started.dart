import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/utils/fonts.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Get Started',
      style: TextStyle(
        color: AppColors.secondaryColor,
        fontFamily: AppFonts.avenir,
        fontSize: 40,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
