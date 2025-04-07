import 'package:flutter/material.dart';

class PostContent extends StatelessWidget {
  const PostContent({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }
}
