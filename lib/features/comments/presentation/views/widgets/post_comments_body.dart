import 'package:flutter/material.dart';
import 'package:planty/features/comments/presentation/views/widgets/comment_view_build_comment_widget.dart';
import 'package:planty/features/community/data/models/post_model.dart';

class PostCommentsBody extends StatelessWidget {
  final List<CommentModel> comments;
  final void Function(int commentId)? deleteComment;

  const PostCommentsBody({
    super.key,
    required this.comments,
    this.deleteComment,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: comments.length,
          padding: const EdgeInsets.only(bottom: 12),
          itemBuilder: (context, index) {
            final comment = comments[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CommentViewBuildCommentWidget(
                profilePic: comment.authorPicture,
                name: comment.authorName,
                comment: comment.content,
                onPressed: () => deleteComment?.call(comment.id),
              ),
            );
          },
        ),
      ),
    );
  }
}
