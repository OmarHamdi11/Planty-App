import 'package:flutter/material.dart';
import 'package:planty/features/community/data/models/post_model.dart';
import 'package:planty/features/community/presentation/views/widgets/custom_comment_navigation.dart';
import 'package:planty/features/community/presentation/views/widgets/custom_post_header.dart';
import 'package:planty/features/community/presentation/views/widgets/custom_post_image.dart';
import 'package:planty/features/community/presentation/views/widgets/post_content.dart';

class CustomBuildPost extends StatelessWidget {
  const CustomBuildPost({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPostHeader(
            userName: post.name,
            userImage: post.userImage,
          ),
          const SizedBox(height: 8),
          PostContent(content: post.content),
          const SizedBox(height: 20),
          CustomPostImage(imageUrl: post.imageUrl),
          const SizedBox(height: 8),
          CustomCommentNavigation(comments: post.comments),
        ],
      ),
    );
  }
}
