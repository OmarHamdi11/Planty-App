import 'package:flutter/material.dart';
import 'package:planty/core/utils/fonts.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: const Center(
        child: Text(
          "Error: Please try again.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Colors.redAccent,
            fontFamily: AppFonts.avenir,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
