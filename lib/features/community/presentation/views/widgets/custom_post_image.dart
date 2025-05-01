import 'package:flutter/material.dart';

class CustomPostImage extends StatelessWidget {
  const CustomPostImage({
    super.key,
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: imageUrl != null
          ? Image.network(
              imageUrl!,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          : const SizedBox(),
    );
  }
}
