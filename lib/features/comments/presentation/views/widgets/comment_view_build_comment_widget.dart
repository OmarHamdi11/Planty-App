import 'package:flutter/material.dart';

class CommentViewBuildCommentWidget extends StatelessWidget {
  const CommentViewBuildCommentWidget({
    super.key,
    required this.profilePic,
    required this.name,
    required this.comment,
    required this.onPressed,
  });

  final String? profilePic;
  final String name;
  final String comment;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: profilePic != null
                ? NetworkImage(profilePic!)
                : const AssetImage("assets/images/user.png"),
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
          const SizedBox(width: 5),
          IconButton(
            icon: const Icon(
              Icons.disabled_by_default_rounded,
              color: Colors.red,
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
