import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/onboarding/presentation/views/widgets/custom_get_started_button.dart';
import 'package:planty/features/onboarding/presentation/views/widgets/custom_onboarding_content.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Green Background
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.gradient,
            ),
          ),

          // Content Column
          const CustomOnboardingContent(),

          // Get Started Button
          const CustomGetStartedButton()
        ],
      ),
    );
  }
}

// Placeholder for Next Screen
class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Next Page")),
      body: const Center(child: Text("Welcome to the next page!")),
    );
  }
}
