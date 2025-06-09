import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/utils/fonts.dart';

class ModelResultCustomWidget extends StatelessWidget {
  const ModelResultCustomWidget({
    super.key,
    required this.text,
  });

  final String text;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Model Result:",
            style: TextStyle(
              fontSize: 24,
              color: AppColors.primaryColor,
              fontFamily: AppFonts.avenir,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              text, //title variable will be here //modelOutput will be here
              style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                  fontFamily: AppFonts.avenir,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
