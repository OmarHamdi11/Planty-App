import 'package:flutter/material.dart';

class CustomCommentNavigation extends StatelessWidget {
  const CustomCommentNavigation({
    super.key,
    required this.comments,
  });

  final int comments;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.comment,
            size: 20,
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
