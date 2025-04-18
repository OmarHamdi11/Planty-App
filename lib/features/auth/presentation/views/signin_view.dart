import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/utils/internet_checker.dart';
import 'package:planty/features/auth/presentation/views/functions/email_validator.dart';
import 'package:planty/features/auth/presentation/views/functions/password_validator.dart';
import 'package:planty/features/auth/presentation/views/signup_view.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_background.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_change_auth_way_button.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_forgot_button.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_page_header.dart';
import 'package:planty/features/home/presentation/views/navigation_view.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key}); // Removed const because formKey is mutable

  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); // Form Key

  @override
  Widget build(BuildContext context) {
    // final _emailController = TextEditingController();
    // final _passwordController = TextEditingController();
    String? email;
    String? password;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          const CustomAuthBackground(),

          // Sign In Form
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey, // Assign the key to the Form
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomPageHeader(
                        title: "Sign In",
                      ),
                      const SizedBox(height: 30),

                      // Email Field
                      CustomAuthTextField(
                        //controller: _emailController,
                        icon: Icons.mail,
                        hintText: "Email Address",
                        onChanged: (value) {
                          email = value;
                        },
                        validator: emailValidator,
                      ),
                      const SizedBox(height: 20),

                      // Password Field
                      CustomAuthTextField(
                        //controller: _passwordController,
                        icon: Icons.lock,
                        hintText: "Password",
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                        validator: passwordValidator,
                      ),
                      const SizedBox(height: 5),

                      // Forgot Password
                      const CustomForgotButton(),
                      const SizedBox(height: 50),

                      // Sign In Button
                      CustomAuthButton(
                        title: "Sign In",
                        onPressed: () async {
                          bool isConnected =
                              await InternetChecker.checkConnection();
                          if (!isConnected) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No internet connection'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          if (formKey.currentState!.validate()) {
                            // Form is valid, proceed with login
                            print("Email: $email, Password: $password");
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const NavigationView();
                                },
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 10),

                      // Sign Up Link
                      CustomChangeAuthWayButton(
                        text: "Don’t have an account? ",
                        title: "Sign Up",
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignUpView();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
