import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/utils/fonts.dart';
import 'package:planty/core/utils/images.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_background.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_change_auth_way_button.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_forgot_button.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_page_header.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key}); // Removed const because formKey is mutable

  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); // Form Key

  @override
  Widget build(BuildContext context) {
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
                      /*const Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.avenir,
                          color: AppColors.primaryColor,
                        ),
                      ),*/
                      CustomAuthTextField(
                        icon: Icons.mail,
                        hintText: "Email Address",
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Password Field
                      /*const Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.avenir,
                          color: AppColors.primaryColor,
                        ),
                      ),*/
                      CustomAuthTextField(
                        icon: Icons.lock,
                        hintText: "Password",
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      const SizedBox(height: 5),

                      // Forgot Password
                      const CustomForgotButton(),
                      const SizedBox(height: 100),

                      // Sign In Button
                      CustomAuthButton(
                        title: "Sign In",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // Form is valid, proceed with login
                            print("Email: $email, Password: $password");
                          }
                        },
                      ),
                      const SizedBox(height: 10),

                      // Sign Up Link
                      CustomChangeAuthWayButton(
                        text: "Don’t have an account? ",
                        title: "Sign Up",
                        onPressed: () {},
                      ),

                      // Social Media Logins
                      /*
                      const SizedBox(height: 10),
                      const Center(child: Text("OR")),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.logo,
                              width: 40, height: 40), // Facebook icon
                          const SizedBox(width: 15),
                          Image.asset(AppImages.logo,
                              width: 40, height: 40), // Google icon
                          const SizedBox(width: 15),
                          Image.asset(AppImages.logo,
                              width: 40, height: 40), // Twitter icon
                        ],
                      ),
                      */
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
