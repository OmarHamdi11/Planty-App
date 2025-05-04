import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/widgets/dialog/upload_status.dart';
import 'package:planty/core/widgets/error_view.dart';
import 'package:planty/features/community/presentation/manager/post_cubit/post_cubit.dart';
import 'package:planty/features/community/presentation/manager/post_cubit/post_state.dart';
import 'package:planty/features/community/presentation/views/widgets/post_content_text_field.dart';
import 'package:planty/features/community/presentation/views/widgets/post_custom_button.dart';
import 'package:planty/features/community/presentation/views/widgets/post_view_header.dart';
import 'package:planty/features/community/presentation/views/widgets/select_image_custom_button.dart';
import 'package:planty/features/home/presentation/views/navigation_view.dart';
import 'package:planty/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:planty/features/profile/presentation/manager/profile_cubit/profile_state.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  File? _selectedImage;
  String? _postContent;
  final TextEditingController _postController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().fetchProfile(); // Load user profile
  }

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const NavigationView(
                  myCurrentIndex: 1,
                ),
              ),
            );
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
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, profileState) {
          if (profileState is ProfileLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ));
          } else if (profileState is ProfileError) {
            return ErrorView(
              errorMessage: profileState.message,
              onRetry: () {
                context.read<ProfileCubit>().fetchProfile();
              },
            );
          } else if (profileState is ProfileLoaded) {
            final user = profileState.user;

            return BlocConsumer<CreatePostCubit, CreatePostState>(
              listener: (context, state) {
                if (state is CreatePostSuccess) {
                  showDialog(
                    context: context,
                    builder: (_) => ResultStatusDialog(
                      status: UploadStatus.success, // or UploadStatus.error
                      title: 'Done',
                      message: 'Your post Uploaded successfully',
                      buttonText: 'Ok',
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const NavigationView(myCurrentIndex: 1),
                        ),
                      ),
                    ),
                  );
                } else if (state is CreatePostFailure) {
                  showDialog(
                    context: context,
                    builder: (_) => ResultStatusDialog(
                      status: UploadStatus.error,
                      title: 'Error',
                      message: state.error,
                      buttonText: 'Try again',
                      onPressed: () {
                        Navigator.pop(context);
                        // Retry logic here
                      },
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          PostViewHeader(
                            authorImage: user.profilePictureUrl,
                            authorName: user.userName,
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
                              if (_postContent != null &&
                                  _postContent!.trim().isNotEmpty) {
                                context.read<CreatePostCubit>().createPost(
                                      content: _postContent!,
                                      imageFile: _selectedImage, // can be null
                                    );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Post content can't be empty"),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    if (state is CreatePostLoading)
                      Container(
                        color: Colors.black.withOpacity(0.3),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ],
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
