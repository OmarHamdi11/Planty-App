import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:planty/features/comments/data/models/comment_model.dart';
import 'package:planty/features/comments/presentation/views/widgets/post_comments_body.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({super.key});

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  final TextEditingController _commentController = TextEditingController();
  bool hasInternet = true;

  final List<CommentModel> comments = [
    CommentModel(
      userImage: "assets/images/user.jpg",
      userName: "islam Mohammed",
      content:
          "Place aloe vera in bright, indirect sunlight. Water every 2–3 weeks...",
    ),
    CommentModel(
      userImage: "assets/images/user.jpg",
      userName: "islam Mohammed",
      content:
          "Place aloe vera in bright, indirect sunlight. Water every 2–3 weeks...",
    ),
    CommentModel(
      userImage: "assets/images/user.jpg",
      userName: "islam Mohammed",
      content:
          "Place aloe vera in bright, indirect sunlight. Water every 2–3 weeks...",
    ),
    CommentModel(
      userImage: "assets/images/user.jpg",
      userName: "islam Mohammed",
      content:
          "Place aloe vera in bright, indirect sunlight. Water every 2–3 weeks...",
    ),
    CommentModel(
      userImage: "assets/images/user.jpg",
      userName: "islam Mohammed",
      content:
          "Place aloe vera in bright, indirect sunlight. Water every 2–3 weeks...",
    ),
    CommentModel(
      userImage: "assets/images/user.jpg",
      userName: "islam Mohammed",
      content:
          "Place aloe vera in bright, indirect sunlight. Water every 2–3 weeks...",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _checkConnection();
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Ahmed Amar',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: hasInternet
          ? PostCommentsBody(
              comments: comments,
              commentController: _commentController,
            )
          : _buildNoInternetWidget(),
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
