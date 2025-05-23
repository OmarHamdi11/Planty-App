import 'package:flutter/material.dart';
import 'package:planty/features/comments/presentation/views/comments_view.dart';
import 'package:planty/features/community/data/models/post_model.dart';
import 'package:planty/features/community/presentation/views/widgets/custom_comment_navigation.dart';
import 'package:planty/features/community/presentation/views/widgets/custom_post_header.dart';
import 'package:planty/features/community/presentation/views/widgets/custom_post_image.dart';
import 'package:planty/features/community/presentation/views/widgets/post_content.dart';

class CustomBuildPost extends StatelessWidget {
  const CustomBuildPost({
    super.key,
    required this.post,
    required this.deletePost,
  });

  final PostModel post;
  final void Function()? deletePost;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CommentsView(
              postId: post.id,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black12,
              offset: Offset(0, 2),
            ),
            BoxShadow(
              blurRadius: 4,
              color: Colors.black12,
              offset: Offset(0, -2),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPostHeader(
              userName: post.authorName,
              userImage: post.userImage,
            ),
            const SizedBox(height: 8),
            PostContent(content: post.content),
            const SizedBox(height: 20),
            CustomPostImage(imageUrl: post.postImage),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCommentNavigation(
                  comments: post.comments.length,
                  post: post,
                ),
                IconButton(
                  onPressed: deletePost,
                  icon: const Icon(
                    Icons.delete,
                    size: 24,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
