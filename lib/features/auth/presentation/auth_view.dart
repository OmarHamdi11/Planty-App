import 'package:flutter/material.dart';
import 'package:planty/features/auth/presentation/sign_in_body.dart';
import 'package:planty/features/auth/presentation/sign_up_body.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/SignIn&SignUp.png', // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
          // PageView for sign in and sign up
          PageView(
            controller: _pageController,
            children: [
              _buildSignInPage(),
              _buildSignUpPage(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSignInPage() {
    return SignInBody(pageController: _pageController);
  }

  Widget _buildSignUpPage() {
    return SignUpBody(pageController: _pageController);
  }
}
