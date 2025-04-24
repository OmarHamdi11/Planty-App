class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String? image;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.image,
  });

  // Factory method to create a UserModel from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      image: json['image'] as String?,
    );
  }

  // Method to convert a UserModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'image': image,
    };
  }
}
