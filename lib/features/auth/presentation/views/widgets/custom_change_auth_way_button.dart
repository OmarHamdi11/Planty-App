import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/utils/fonts.dart';

class CustomChangeAuthWayButton extends StatelessWidget {
  const CustomChangeAuthWayButton({
    super.key,
    required this.text,
    required this.title,
    required this.onPressed,
  });

  final String text;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: Text.rich(
          TextSpan(
            text: text,
            style: const TextStyle(
              color: AppColors.shadowColor,
              fontSize: 16,
              fontFamily: AppFonts.avenir,
            ),
            children: [
              TextSpan(
                text: title,
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
