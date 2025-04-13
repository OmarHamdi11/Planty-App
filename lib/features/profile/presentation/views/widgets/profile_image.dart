import 'dart:io';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required File? image,
    required this.onTap,
  }) : _image = image;

  final File? _image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.grey[300],
        radius: 50,
        backgroundImage: _image != null ? FileImage(_image) : null,
        child: _image == null ? const Icon(Icons.person, size: 50) : null,
      ),
    );
  }
}
