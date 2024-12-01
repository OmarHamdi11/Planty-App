import 'package:flutter/material.dart';
import 'package:planty/features/auth/presentation/widgets/custom_auth_button.dart';
import 'package:planty/features/auth/presentation/widgets/custom_auth_text_field.dart';
import 'package:planty/features/auth/presentation/widgets/custom_reset_button.dart';
import 'package:planty/features/auth/presentation/widgets/page_view_header.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    String? email;
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
              currentPage: 0,
            ),
            const SizedBox(height: 32),
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
              text: "SignIn",
            ),
            const SizedBox(height: 8),
            const CustomResetButton(),
          ],
        ),
      ),
    );
  }
}
