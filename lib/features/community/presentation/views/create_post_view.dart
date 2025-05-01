import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/community/presentation/views/widgets/post_content_text_field.dart';
import 'package:planty/features/community/presentation/views/widgets/post_custom_button.dart';
import 'package:planty/features/community/presentation/views/widgets/post_view_header.dart';
import 'package:planty/features/community/presentation/views/widgets/select_image_custom_button.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  File? _selectedImage;
  String? _postContent;
  final TextEditingController _postController = TextEditingController();
  final String authorName = 'Omar Hamdi';
  final String authorImage = 'assets/images/user.jpg';

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a photo'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Choose from gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'New Post',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            PostViewHeader(
              authorImage: authorImage,
              authorName: authorName,
            ),
            const SizedBox(height: 16),
            PostContentTextField(
              controller: _postController,
              onChanged: (value) {
                setState(() {
                  _postContent = value;
                });
              },
            ),
            const SizedBox(height: 16),
            SelectImageCustomButton(
              selectedImage: _selectedImage,
              onTap: () {
                _showImageSourceActionSheet(context);
              },
            ),
            const SizedBox(height: 24),
            PostCustomButton(
              onPressed: () {
                // Handle post submission
                if (_selectedImage != null && _postContent != null) {
                  // Here you would typically send the post data to your backend
                  Navigator.pop(context); // Close the CreatePostView
                  setState(
                    () {
                      _selectedImage = null; // Reset the image after posting
                      _postContent = null; // Reset the content after posting
                      _postController.clear();
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
