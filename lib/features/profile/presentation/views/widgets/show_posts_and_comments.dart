import 'package:flutter/material.dart';
import 'package:planty/features/profile/presentation/views/widgets/stat_item.dart';

class ShowPostsAndComments extends StatelessWidget {
  const ShowPostsAndComments({
    super.key,
    required this.postNo,
    required this.commentNo,
  });

  final String postNo;
  final String commentNo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StatItem("Posts", postNo),
        const SizedBox(width: 30),
        StatItem("Comments", commentNo),
      ],
    );
  }
}
