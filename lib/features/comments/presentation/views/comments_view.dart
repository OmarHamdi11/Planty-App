import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/features/comments/presentation/views/widgets/build_comment_input_field.dart';
import 'package:planty/features/comments/presentation/views/widgets/post_comments_body.dart';
import 'package:planty/features/community/presentation/manager/community_cubit/community_cubit.dart';
import 'package:planty/features/community/presentation/manager/community_cubit/community_state.dart';

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
    context.read<CommunityCubit>().fetchPosts();
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
          onPressed: () {
            Navigator.pop(context);
          },
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
      body: Column(
        children: [
          hasInternet
              ? BlocBuilder<CommunityCubit, CommunityState>(
                  builder: (context, state) {
                    if (state is CommunityLoading) {
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    } else if (state is CommunityFailure) {
                      return Center(child: Text(state.error));
                    } else if (state is CommunitySuccess) {
                      final post = state.posts.firstWhere(
                        (post) => post.id == widget.postId,
                      );

                      if (post.comments.isNotEmpty) {
                        return PostCommentsBody(
                          comments: post.comments,
                        );
                      } else {
                        return const Expanded(
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
                      }
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                )
              : _buildNoInternetWidget(),
          BuildCommentInputField(
            commentController: _commentController,
            onPressed: () {
              print("User typed: ${_commentController.text}");
              _commentController.clear();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNoInternetWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 60, color: Colors.red),
            const SizedBox(height: 16),
            const Text(
              "No internet connection.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _checkConnection,
              child: const Text("Retry"),
            )
          ],
        ),
      ),
    );
  }
}
