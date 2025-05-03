import 'package:flutter/material.dart';
import 'package:planty/features/comments/presentation/views/comments_view.dart';
import 'package:planty/features/community/data/models/post_model.dart';

class CustomCommentNavigation extends StatelessWidget {
  const CustomCommentNavigation({
    super.key,
    required this.comments,
    required this.post,
  });

  final int comments;
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
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
          child: const Icon(
            Icons.comment,
            size: 24,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          comments.toString(),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
