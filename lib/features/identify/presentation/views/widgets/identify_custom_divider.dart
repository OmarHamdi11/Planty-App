import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/utils/fonts.dart';

class IdentifyCustomDivider extends StatelessWidget {
  const IdentifyCustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: AppColors.primaryColor,
            thickness: 2.5, // Thickness of the lines
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8), // Space around "or"
          child: Text(
            'or',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.avenir,
            ), // Text color
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.primaryColor,
            thickness: 2.5, // Thickness of the lines
          ),
        ),
      ],
    );
  }
}
