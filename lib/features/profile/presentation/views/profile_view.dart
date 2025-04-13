import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/auth/presentation/views/signin_view.dart';
import 'package:planty/features/profile/presentation/views/widgets/editable_field.dart';
import 'package:planty/features/profile/presentation/views/widgets/posts_widget.dart';
import 'package:planty/features/profile/presentation/views/widgets/profile_custom_buttons.dart';
import 'package:planty/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:planty/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:planty/features/profile/presentation/views/widgets/show_posts_and_comments.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final nameController = TextEditingController(text: "Omar Hamdi");
  final emailController = TextEditingController(text: "omar@example.com");
  final passwordController = TextEditingController(text: "password123");
  bool _obscurePassword = true;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _image = File(pickedFile.path));
    }
  }

  void _save() {
    String updatedName = nameController.text;
    String updatedEmail = emailController.text;
    String updatedPassword = passwordController.text;
    String imagePath = _image?.path ?? "No image selected";

    // Replace this with your real save logic or API call
    print("Saving Profile:");
    print("Name: $updatedName");
    print("Email: $updatedEmail");
    print("Password: $updatedPassword");
    print("Image Path: $imagePath");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile saved successfully!")),
    );
  }

  void _signOut() async {
    // TODO: Clear user session or token here

    // TODO: Navigate to the login screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Signed out successfully!")),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignInView(),
      ),
    ); // or your login route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const ProfileHeader(),
              const SizedBox(height: 20),
              ProfileImage(
                image: _image,
                onTap: _pickImage,
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
              EditableField(
                label: "Password",
                controller: passwordController,
                obscureText: _obscurePassword,
                onToggle: () {
                  setState(
                    () {
                      _obscurePassword = !_obscurePassword;
                    },
                  );
                },
                isPassword: true,
              ),
              const SizedBox(height: 20),
              const ShowPostsAndComments(
                postNo: '0',
                commentNo: '0',
              ),
              const SizedBox(height: 40),
              const PostsWidget(),
              const SizedBox(height: 30),
              ProfileCustomButtons(
                save: _save,
                signOut: _signOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
