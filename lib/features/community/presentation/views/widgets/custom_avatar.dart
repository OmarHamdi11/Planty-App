import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.redAccent,
      radius: 12,
      child: ClipOval(
        child: image != null
            ? Image.network(
                image!,
                fit: BoxFit.cover,
                width: 24,
                height: 24,
              )
            : Image.asset(
                "assets/images/user.png",
                fit: BoxFit.cover,
                width: 24,
                height: 24,
              ),
      ),
    );
  }
}
