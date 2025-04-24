import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/auth/presentation/views/functions/email_validator.dart';
import 'package:planty/features/auth/presentation/views/signin_view.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_navigate_widget.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); // Form Key
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/reset-password.png'),
                  const Text(
                    'Forgot\nPassword',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomAuthTextField(
                    hintText: 'Enter Email',
                    icon: Icons.alternate_email,
                    validator: emailValidator,
                    controller: _emailController,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomAuthButton(
                    title: 'Reset Password',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print("Email: ${_emailController.text}");
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password reset link sent!'),
                          ),
                        );
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => SignInView()),
                        );
                      }
                    },
                  ),
                  CustomNavigateWidget(
                    text1: 'Have an Account? ',
                    text2: 'Sign In',
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => SignInView()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
