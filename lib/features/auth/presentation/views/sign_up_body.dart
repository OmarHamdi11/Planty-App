import 'package:flutter/material.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:planty/features/auth/presentation/views/widgets/page_view_header.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    String? email;
    String? userName;
    String? password;
    GlobalKey<FormState> formKey = GlobalKey();

    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 120),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PageViewHeader(
              pageController: _pageController,
              currentPage: 1,
            ),
            const SizedBox(height: 32),
            CustomAuthTextField(
              icon: Icons.account_circle,
              obscureText: false,
              hintText: 'User Name',
              onChanged: (p0) {
                userName = p0;
              },
            ),
            const SizedBox(height: 16),
            CustomAuthTextField(
              icon: Icons.email,
              hintText: 'Email address',
              onChanged: (p0) {
                email = p0;
              },
            ),
            const SizedBox(height: 16),
            CustomAuthTextField(
              icon: Icons.lock,
              obscureText: true,
              hintText: 'Password',
              onChanged: (p0) {
                password = p0;
              },
            ),
            const SizedBox(height: 32),
            CustomAuthButton(
              formKey: formKey,
              text: "SignUp",
            ),
          ],
        ),
      ),
    );
  }
}
