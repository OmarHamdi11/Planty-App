import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/widgets/error_view.dart';
import 'package:planty/features/comments/presentation/manager/comment_cubit/comment_cubit.dart';
import 'package:planty/features/comments/presentation/views/widgets/build_comment_input_field.dart';
import 'package:planty/features/comments/presentation/views/widgets/post_comments_body.dart';
import 'package:planty/features/community/presentation/manager/community_cubit/community_cubit.dart';
import 'package:planty/features/community/presentation/manager/community_cubit/community_state.dart';
import 'package:planty/features/home/presentation/views/navigation_view.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({super.key, required this.postId});

  final int postId;

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  final TextEditingController _commentController = TextEditingController();
  bool hasInternet = true;

  @override
  void initState() {
    super.initState();
    _checkConnection();
    context.read<CommunityCubit>().fetchPosts(); // Fetch initial data
  }

  Future<void> _checkConnection() async {
    final result = await Connectivity().checkConnectivity();
    setState(() {
      hasInternet = result != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDE7),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NavigationView(myCurrentIndex: 1),
            ),
          ),
        ),
        title: const Text(
          'Comments',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<CommentCubit, CommentState>(
        listener: (context, state) async {
          if (state is CommentSuccess) {
            await context.read<CommunityCubit>().fetchPosts();
          } else if (state is CommentFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Column(
          children: [
            BlocBuilder<CommunityCubit, CommunityState>(
              builder: (context, state) {
                if (state is CommunityLoading) {
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is CommunityFailure) {
                  return Expanded(
                    child: ErrorView(
                      errorMessage: state.error,
                      onRetry: () {
                        context.read<CommunityCubit>().fetchPosts();
                      },
                    ),
                  );
                } else if (state is CommunitySuccess) {
                  final post = state.posts.firstWhere(
                    (post) => post.id == widget.postId,
                  );

                  return post.comments.isNotEmpty
                      ? PostCommentsBody(
                          comments: post.comments,
                        )
                      : const Expanded(
                          child: Center(
                            child: Text(
                              "No comments yet",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            BuildCommentInputField(
              commentController: _commentController,
              onPressed: () {
                final content = _commentController.text.trim();
                if (content.isNotEmpty) {
                  context.read<CommentCubit>().addComment(
                        postId: widget.postId,
                        content: content,
                      );
                  context.read<CommunityCubit>().fetchPosts();
                  _commentController.clear();
                  FocusScope.of(context).unfocus();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
