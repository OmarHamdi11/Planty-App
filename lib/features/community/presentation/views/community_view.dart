import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/community/data/models/post_model.dart';
import 'package:planty/features/community/presentation/views/widgets/community_custom_app_bar.dart';
import 'package:planty/features/community/presentation/views/widgets/create_post_navigation_custom_button.dart';
import 'package:planty/features/community/presentation/views/widgets/custom_build_post.dart';
import 'package:planty/features/home/presentation/views/navigation_view.dart';

class CommunityView extends StatelessWidget {
  CommunityView({super.key});

  final List<PostModel> posts = [
    const PostModel(
      name: "Ibrahim Ali",
      userImage: "assets/images/user.jpg",
      imageUrl: "assets/images/community.jpg",
      content: "Help me !",
      authorId: "1",
      comments: 3,
    ),
    const PostModel(
      name: "Omar Hamdi",
      userImage: "assets/images/user.jpg",
      imageUrl: "assets/images/community.jpg",
      content: "How do i care of an aloe vera !",
      authorId: "2",
      comments: 1,
    ),
    const PostModel(
      name: "Ibrahim Ali",
      userImage: "assets/images/user.jpg",
      imageUrl: "assets/images/community.jpg",
      content: "Help me !",
      authorId: "1",
      comments: 3,
    ),
    const PostModel(
      name: "Omar Hamdi",
      userImage: "assets/images/user.jpg",
      imageUrl: "assets/images/community.jpg",
      content:
          "Plants are the green architects of nature, converting sunlight into life through photosynthesis.\nThey provide oxygen, food, and beauty, sustaining ecosystems and human well-being.",
      authorId: "2",
      comments: 1,
    ),
    const PostModel(
      name: "Omar Hamdi",
      userImage: "assets/images/user.jpg",
      imageUrl: "assets/images/community.jpg",
      content:
          "Plants are the green architects of nature, converting sunlight into life through photosynthesis.\nThey provide oxygen, food, and beauty, sustaining ecosystems and human well-being.",
      authorId: "2",
      comments: 1,
    ),
    const PostModel(
      name: "Ibrahim Ali",
      userImage: "assets/images/user.jpg",
      imageUrl: "assets/images/community.jpg",
      content: "Help me !",
      authorId: "1",
      comments: 3,
    ),
    const PostModel(
      name: "Omar Hamdi",
      userImage: "assets/images/user.jpg",
      imageUrl: "assets/images/community.jpg",
      content: "How do i care of an aloe vera !",
      authorId: "2",
      comments: 1,
    ),
    const PostModel(
      name: "Ibrahim Ali",
      userImage: "assets/images/user.jpg",
      imageUrl: "assets/images/community.jpg",
      content: "Help me !",
      authorId: "1",
      comments: 3,
    ),
    const PostModel(
      name: "Omar Hamdi",
      userImage: "assets/images/user.jpg",
      imageUrl: "assets/images/community.jpg",
      content: "How do i care of an aloe vera !",
      authorId: "2",
      comments: 1,
    ),
    const PostModel(
      name: "Ibrahim Ali",
      userImage: "assets/images/user.jpg",
      imageUrl: "assets/images/community.jpg",
      content: "Help me !",
      authorId: "1",
      comments: 3,
    ),
    const PostModel(
      name: "Omar Hamdi",
      userImage: "assets/images/user.jpg",
      imageUrl: "assets/images/community.jpg",
      content: "How do i care of an aloe vera !",
      authorId: "2",
      comments: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CommunityCustomAppBar(
                icon: Icons.person_outline_rounded,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationView(
                        myCurrentIndex: 3,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const CreatePostNavigationCustomButton(),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: CustomBuildPost(
                        post: posts[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






// ListView(
//                   children: const [
//                     CustomBuildPost(
//                         name: "Ibrahim Ali",
//                         message: "Help me !",
//                         imageUrl:
//                             "https://images.pexels.com/photos/776656/pexels-photo-776656.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                         comments: 3,
//                         avatarColor: Colors.teal),
//                     SizedBox(height: 16),
//                     CustomBuildPost(
//                       name: "Ahmed Amar",
//                       message: "How do i care of an aloe vera !",
//                       imageUrl:
//                           "https://images.pexels.com/photos/776656/pexels-photo-776656.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                       comments: 1,
//                       avatarColor: Colors.green,
//                     ),
//                     SizedBox(height: 16),
//                     CustomBuildPost(
//                       name: "Ahmed Amar",
//                       message: "How do i care of an aloe vera !",
//                       imageUrl:
//                           "https://images.pexels.com/photos/776656/pexels-photo-776656.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                       comments: 1,
//                       avatarColor: Colors.green,
//                     ),
//                   ],
//                 ),