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
import 'package:planty/features/profile/presentation/views/widgets/build_info_tile.dart';
import 'package:planty/features/profile/presentation/views/widgets/build_utility_tile.dart';
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 13),
              ProfileHeader(
                save: () {
                  if (_image != null) {
                    context
                        .read<UploadPictureCubit>()
                        .uploadProfileImage(_image!);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("No image selected.")),
                    );
                  }
                },
              ),
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
                    imageURL = user.profilePictureUrl ?? imageURL;
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
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
                                  setState(
                                      () => _image = File(pickedFile.path));
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            Text(
                              user.userName,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 30),

                            // Personal Info
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Personal Information",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            BuildInfoTile(
                              icon: Icons.email,
                              label: "Email",
                              value: user.email,
                            ),
                            const BuildInfoTile(
                              icon: Icons.phone,
                              label: "Phone",
                              value: "9898712132",
                            ),
                            const SizedBox(height: 20),
                            // Utilities
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Utilities",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const BuildUtilityTile(
                              icon: Icons.feed_sharp,
                              title: "Posts",
                            ),
                            const BuildUtilityTile(
                              icon: Icons.help_outline,
                              title: "Ask Help-Desk",
                            ),
                            BuildUtilityTile(
                              icon: Icons.logout,
                              title: "Log-Out",
                              onTap: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      LogoutConfirmationDialog(
                                    onConfirm: () async {
                                      Navigator.of(context)
                                          .pop(); // Dismiss the dialog first

                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.remove('token');

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Signed out successfully!")),
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
                        ),
                      ),
                    );
                  } else if (state is ProfileError) {
                    return Expanded(
                      child: ErrorView(
                        errorMessage: state.message,
                        onRetry: () {
                          context.read<ProfileCubit>().fetchProfile();
                        },
                      ),
                    );
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
