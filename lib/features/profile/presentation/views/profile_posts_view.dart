import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/profile/data/models/user_model.dart';

class ProfilePostsView extends StatelessWidget {
  final List<Post> posts;

  const ProfilePostsView({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: const Text(
          'Your Posts',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: posts.isEmpty
          ? const Center(
              child: Text(
                'No posts found.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ListView.builder(
              itemCount: posts.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.content,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (post.postPicture != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              post.postPicture!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        const SizedBox(height: 10),
                        if (post.comments.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Comments:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ...post.comments.map(
                                (comment) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        comment.profilePictureUrl != null
                                            ? NetworkImage(
                                                comment.profilePictureUrl!)
                                            : null,
                                    child: comment.profilePictureUrl == null
                                        ? const Icon(Icons.person)
                                        : null,
                                  ),
                                  title: Text(comment.authorName),
                                  subtitle: Text(comment.content),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
