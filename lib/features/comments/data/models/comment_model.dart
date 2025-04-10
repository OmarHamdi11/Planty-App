// class CommentModel {
//   final String id;
//   final String userId;
//   final String postId;
//   final String content;
//   final DateTime createdAt;

//   CommentModel({
//     required this.id,
//     required this.userId,
//     required this.postId,
//     required this.content,
//     required this.createdAt,
//   });

//   // Factory method to create a CommentModel from JSON
//   factory CommentModel.fromJson(Map<String, dynamic> json) {
//     return CommentModel(
//       id: json['id'] as String,
//       userId: json['userId'] as String,
//       postId: json['postId'] as String,
//       content: json['content'] as String,
//       createdAt: DateTime.parse(json['createdAt'] as String),
//     );
//   }

//   // Method to convert CommentModel to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'userId': userId,
//       'postId': postId,
//       'content': content,
//       'createdAt': createdAt.toIso8601String(),
//     };
//   }
// }

class CommentModel {
  final String userImage;
  final String userName;
  final String content;

  CommentModel({
    required this.userImage,
    required this.userName,
    required this.content,
  });
}
