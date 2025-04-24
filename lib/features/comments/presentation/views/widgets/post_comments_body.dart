import 'package:flutter/material.dart';
import 'package:planty/features/comments/data/models/comment_model.dart';
import 'package:planty/features/comments/presentation/views/widgets/build_comment_input_field.dart';
import 'package:planty/features/comments/presentation/views/widgets/comment_view_build_comment_widget.dart';
import 'package:planty/features/comments/presentation/views/widgets/comment_view_build_post_widget.dart';

class PostCommentsBody extends StatelessWidget {
  const PostCommentsBody({
    super.key,
    required this.comments,
    required TextEditingController commentController,
  }) : _commentController = commentController;

  final List<CommentModel> comments;
  final TextEditingController _commentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CommentViewBuildPostWidget(),
                const SizedBox(height: 20),
                const Divider(
                  height: 20,
                ),
                // const Text(
                //   'All Comments',
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black,
                //   ),
                // ),
                const SizedBox(height: 20),
                ...comments.map(
                  (comment) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CommentViewBuildCommentWidget(
                      profilePic: comment.userImage,
                      name: comment.userName,
                      comment: comment.content,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        BuildCommentInputField(
          commentController: _commentController,
        ),
      ],
    );
  }
}
