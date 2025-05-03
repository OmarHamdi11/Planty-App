class PostModel {
  final int id;
  final String content;
  final String authorName;
  final String? userImage;
  final String? postImage;
  final List<CommentModel> comments;

  const PostModel({
    required this.id,
    required this.content,
    required this.authorName,
    this.userImage,
    this.postImage,
    required this.comments,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      content: json['content'],
      authorName: json['authorName'],
      userImage: json['user_Picture'] != null
          ? "http://planty.runasp.net${json['user_Picture']}"
          : null,
      postImage: json['post_Picture'] != null
          ? "http://planty.runasp.net${json['post_Picture']}"
          : null,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e))
          .toList(),
    );
  }
}

class CommentModel {
  int id;
  final String content;
  final String authorName;
  final String? authorPicture;

  CommentModel({
    required this.id,
    required this.content,
    required this.authorName,
    this.authorPicture,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      content: json['content'],
      authorName: json['authorName'],
      authorPicture: json['authorPicture'] != null
          ? "http://planty.runasp.net${json['authorPicture']}"
          : null,
    );
  }
}
