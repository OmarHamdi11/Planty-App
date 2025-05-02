class UserModel {
  final String userName;
  final String email;
  final String? profilePictureUrl;
  final List<Post> posts;

  UserModel({
    required this.userName,
    required this.email,
    this.profilePictureUrl,
    required this.posts,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      profilePictureUrl: json['profilePictureUrl'] != null
          ? "http://planty.runasp.net${json['profilePictureUrl']}"
          : null,
      posts: List<Post>.from(json['posts'].map((post) => Post.fromJson(post))),
    );
  }
}

class Post {
  final String content;
  final String? postPicture;
  final List<dynamic> comments;

  Post({
    required this.content,
    this.postPicture,
    required this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      content: json['content'],
      postPicture: json['postPicture'] != null
          ? "http://planty.runasp.net${json['postPicture']}"
          : null,
      comments: json['comments'] ?? [],
    );
  }
}
