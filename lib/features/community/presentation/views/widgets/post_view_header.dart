import 'package:flutter/material.dart';

class PostViewHeader extends StatelessWidget {
  const PostViewHeader({
    super.key,
    required this.authorImage,
    required this.authorName,
  });

  final String? authorImage;
  final String authorName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: authorImage != null
              ? NetworkImage(authorImage!)
              : const AssetImage(
                  "assets/images/user.png",
                ),
          radius: 20,
        ),
        const SizedBox(width: 10),
        Text(
          authorName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
