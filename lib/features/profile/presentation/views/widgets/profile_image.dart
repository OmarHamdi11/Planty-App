import 'dart:io';
import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required File? image,
    required this.onTap,
    this.imageURL,
  }) : _image = image;

  final File? _image;
  final String? imageURL;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
          backgroundImage:
              _image != null ? FileImage(_image) : NetworkImage(imageURL ?? ''),
          child: _image == null && imageURL == null
              ? const Icon(
                  Icons.person,
                  size: 50,
                  color: AppColors.primaryColor,
                )
              : null,
        ),
      ),
    );
  }
}
