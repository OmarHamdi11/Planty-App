import 'package:flutter/material.dart';

class CommentViewBuildCommentWidget extends StatelessWidget {
  const CommentViewBuildCommentWidget({
    super.key,
    required this.profilePic,
    required this.name,
    required this.comment,
  });

  final String profilePic;
  final String name;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(profilePic),
          onBackgroundImageError: (_, __) {},
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                comment,
                style: TextStyle(
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
