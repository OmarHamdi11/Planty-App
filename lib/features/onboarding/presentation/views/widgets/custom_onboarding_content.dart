import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/utils/fonts.dart';
import 'package:planty/core/utils/images.dart';

class CustomOnboardingContent extends StatelessWidget {
  const CustomOnboardingContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 30,
      left: 30,
      right: 0,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                // Plant Image
                Image.asset(
                  AppImages
                      .onboardingImage, // Make sure to add this image to assets
                  height: 570,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),

                // Heading
                const Text(
                  "Order plants now",
                  style: TextStyle(
                    fontFamily: AppFonts.avenir,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 10),

                // Description
                const Text(
                  "We sell beautiful plants that are also easy to maintain & affordable",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
