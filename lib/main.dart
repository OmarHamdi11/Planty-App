import 'package:flutter/material.dart';
import 'package:planty/features/auth/presentation/views/Signup_view.dart';
import 'package:planty/features/auth/presentation/views/signin_view.dart';
import 'package:planty/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:planty/features/splash/presentation/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingView(),
    );
  }
}
