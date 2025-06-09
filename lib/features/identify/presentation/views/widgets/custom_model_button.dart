import 'package:flutter/material.dart';
import 'package:planty/core/utils/fonts.dart';

class CustomModelButton extends StatelessWidget {
  const CustomModelButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.color,
  });

  final String title;
  final void Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontFamily: AppFonts.avenir,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
