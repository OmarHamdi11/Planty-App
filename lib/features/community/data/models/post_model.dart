//import 'package:equatable/equatable.dart';

// class PostModel extends Equatable {
//   final String id;
//   final String title;
//   final String content;
//   final String authorId;
//   final String imageUrl;
//   final DateTime createdAt;
//   final List<String> likes;

//   const PostModel({
//     required this.id,
//     required this.title,
//     required this.content,
//     required this.authorId,
//     required this.imageUrl,
//     required this.createdAt,
//     this.likes = const [],
//   });

//   factory PostModel.fromJson(Map<String, dynamic> json) {
//     return PostModel(
//       id: json['id'] as String,
//       title: json['title'] as String,
//       content: json['content'] as String,
//       authorId: json['authorId'] as String,
//       imageUrl: json['imageUrl'] as String,
//       createdAt: DateTime.parse(json['createdAt'] as String),
//       likes: List<String>.from(json['likes'] ?? []),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'content': content,
//       'authorId': authorId,
//       'imageUrl': imageUrl,
//       'createdAt': createdAt.toIso8601String(),
//       'likes': likes,
//     };
//   }

//   @override
//   List<Object?> get props =>
//       [id, title, content, authorId, imageUrl, createdAt, likes];
// }

class PostModel {
  final String name;
  final String userImage;
  final String imageUrl;
  final String content;
  final String authorId;
  final int comments;

  const PostModel({
    required this.name,
    required this.userImage,
    required this.comments,
    required this.content,
    required this.authorId,
    required this.imageUrl,
  });
}
