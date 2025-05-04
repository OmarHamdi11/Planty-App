import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:planty/features/auth/presentation/views/functions/email_validator.dart';
import 'package:planty/features/auth/presentation/views/functions/password_validator.dart';
import 'package:planty/features/auth/presentation/views/signin_view.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_background.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_change_auth_way_button.dart';
import 'package:planty/features/auth/presentation/views/widgets/custom_page_header.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
    required this.formKey,
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController reEnterPassController,
  })  : _firstNameController = firstNameController,
        _lastNameController = lastNameController,
        _emailController = emailController,
        _passwordController = passwordController,
        _reEnterPassController = reEnterPassController;

  final GlobalKey<FormState> formKey;
  final TextEditingController _firstNameController;
  final TextEditingController _lastNameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _reEnterPassController;

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
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            final username =
                                "${_firstNameController.text.trim()}${_lastNameController.text.trim()}";
                            final email = _emailController.text.trim();
                            final password = _passwordController.text.trim();
                            final confirmPassword =
                                _reEnterPassController.text.trim();

                            BlocProvider.of<SignUpCubit>(context).signUp(
                              username: username,
                              email: email,
                              password: password,
                              confirmPassword: confirmPassword,
                            );
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
