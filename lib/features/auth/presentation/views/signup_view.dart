import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/utils/internet_checker.dart';
import 'package:planty/features/auth/presentation/views/functions/email_validator.dart';
import 'package:planty/features/auth/presentation/views/functions/password_validator.dart';
import 'package:planty/features/auth/presentation/views/signin_view.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_background.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_change_auth_way_button.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_page_header.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key}); // Removed const because formKey is mutable

  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); // Form Key

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _reEnterPassController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        title: "Sign Up",
                      ),
                      const SizedBox(height: 30),

                      // Fname Field
                      CustomAuthTextField(
                        controller: _firstNameController,
                        icon: Icons.person_outline_rounded,
                        hintText: "First Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required Field';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Lname Field
                      CustomAuthTextField(
                        controller: _lastNameController,
                        icon: Icons.person_outline_rounded,
                        hintText: "Last Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required Field';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Email Field
                      CustomAuthTextField(
                        controller: _emailController,
                        icon: Icons.mail_outline_rounded,
                        hintText: "Email Address",
                        validator: emailValidator,
                      ),
                      const SizedBox(height: 20),

                      // Password Field
                      CustomAuthTextField(
                        controller: _passwordController,
                        icon: Icons.lock_outline_rounded,
                        hintText: "Password",
                        obscureText: true,
                        validator: passwordValidator,
                      ),
                      const SizedBox(height: 20),

                      // Confirm Password Field
                      CustomAuthTextField(
                        controller: _reEnterPassController,
                        icon: Icons.lock_outline_rounded,
                        hintText: "Confirm Password",
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required Field';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 50),

                      // Sign In Button
                      CustomAuthButton(
                        title: "Sign Up",
                        onPressed: () async {
                          bool isConnected =
                              await InternetChecker.checkConnection();

                          if (formKey.currentState!.validate() && isConnected) {
                            formKey.currentState!.save();
                            String fName = _firstNameController.text.trim();
                            String lName = _lastNameController.text.trim();
                            String email = _emailController.text.trim();
                            String password = _passwordController.text.trim();
                            String cPassword =
                                _reEnterPassController.text.trim();
                            // Form is valid, proceed with login
                            print(
                                "SignUp Data: FirstName: $fName,LastName: $lName, Email: $email, Password: $password, Comfirm Password: $cPassword");
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignInView();
                                },
                              ),
                            );
                          } else if (!formKey.currentState!.validate() &&
                              isConnected) {
                            return;
                          } else if (formKey.currentState!.validate() &&
                              !isConnected) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No internet connection'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }
                        },
                      ),
                      const SizedBox(height: 10),

                      // Sign Up Link
                      CustomChangeAuthWayButton(
                        text: "Already have an account? ",
                        title: "Sign In",
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignInView();
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
