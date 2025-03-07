import 'package:flutter/material.dart';
import 'package:planty/features/onboarding/presentation/views/widgets/get_started.dart';
import 'package:planty/features/onboarding/presentation/views/widgets/onboarding_custom_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Onboarding_Background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/images/onbording_Image.png'),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GetStarted(),
                  SizedBox(width: 10),
                  OnboardingCustomButton(),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
