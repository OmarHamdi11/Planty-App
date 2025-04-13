import 'package:flutter/material.dart';

class PostsWidget extends StatelessWidget {
  const PostsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(
          Icons.camera_alt_outlined,
          size: 60,
        ),
        SizedBox(height: 10),
        Text(
          "No Posts Yet",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
