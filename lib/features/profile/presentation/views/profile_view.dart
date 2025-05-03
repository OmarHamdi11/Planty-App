// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/widgets/dialog/logout_confirmation_dialog.dart';
import 'package:planty/core/widgets/error_view.dart';
import 'package:planty/features/auth/presentation/views/signin_view.dart';
import 'package:planty/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:planty/features/profile/presentation/manager/profile_cubit/profile_state.dart';
import 'package:planty/features/profile/presentation/manager/upload_picture_cubit/upload_picture_cubit.dart';
import 'package:planty/features/profile/presentation/manager/upload_picture_cubit/upload_picture_state.dart';
import 'package:planty/features/profile/presentation/views/widgets/editable_field.dart';
import 'package:planty/features/profile/presentation/views/widgets/profile_custom_buttons.dart';
import 'package:planty/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:planty/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().fetchProfile();
  }

  File? _image;
  final ImagePicker _picker = ImagePicker();
  String? imageURL;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadPictureCubit, UploadPictureState>(
      listener: (context, state) {
        if (state is UploadPictureLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Uploading...")),
          );
        } else if (state is UploadPictureSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Profile saved successfully!")),
          );
          context.read<ProfileCubit>().fetchProfile();

          setState(() {
            _image = null;
          });
        } else if (state is UploadPictureError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${state.message}")),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor2,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 13),
              const ProfileHeader(),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const Expanded(
                        child: Center(
                      child: CircularProgressIndicator(
                          color: AppColors.primaryColor),
                    ));
                  } else if (state is ProfileLoaded) {
                    final user = state.user;
                    nameController.text = user.userName;
                    emailController.text = user.email;
                    imageURL = user.profilePictureUrl ?? imageURL;
                    return SingleChildScrollView(
                        child: Column(
                      children: [
                        const SizedBox(height: 20),
                        ProfileImage(
                          image: _image,
                          imageURL: imageURL,
                          onTap: () async {
                            final pickedFile = await _picker.pickImage(
                                source: ImageSource.gallery);
                            if (pickedFile != null) {
                              setState(() => _image = File(pickedFile.path));
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                        EditableField(
                          label: "Name",
                          controller: nameController,
                          obscureText: _obscurePassword,
                        ),
                        EditableField(
                          label: "Email",
                          controller: emailController,
                          obscureText: _obscurePassword,
                        ),
                        const SizedBox(height: 20),
                        const SizedBox(height: 100),
                        ProfileCustomButtons(
                          save: () {
                            if (_image != null) {
                              context
                                  .read<UploadPictureCubit>()
                                  .uploadProfileImage(_image!);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("No image selected.")),
                              );
                            }
                          },
                          signOut: () async {
                            showDialog(
                              context: context,
                              builder: (context) => LogoutConfirmationDialog(
                                onConfirm: () async {
                                  Navigator.of(context)
                                      .pop(); // Dismiss the dialog first

                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.remove('token');

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Signed out successfully!")),
                                  );

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInView(),
                                    ),
                                  );
                                },
                                onCancel: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ));
                  } else if (state is ProfileError) {
                    return Expanded(
                      child: ErrorView(
                        errorMessage: state.message,
                        onRetry: () {
                          context.read<ProfileCubit>().fetchProfile();
                        },
                      ),
                    );
                    //return Expanded(child: Center(child: Text(state.message)));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
