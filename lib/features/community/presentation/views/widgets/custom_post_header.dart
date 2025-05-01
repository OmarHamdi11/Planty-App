import 'package:flutter/material.dart';
import 'package:planty/features/community/presentation/views/widgets/custom_avatar.dart';

class CustomPostHeader extends StatelessWidget {
  const CustomPostHeader({
    super.key,
    required this.userImage,
    required this.userName,
  });

  final String? userImage;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomAvatar(image: userImage),
        const SizedBox(width: 8),
        Text(
          userName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
