import 'package:flutter/material.dart';

class CommentViewBuildPostWidget extends StatelessWidget {
  const CommentViewBuildPostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: const NetworkImage(
                'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              ),
              onBackgroundImageError: (_, __) {},
            ),
            const SizedBox(width: 10),
            const Text(
              'Ahmed Amar',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text('How do I care of an aloe vera!'),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://images.pexels.com/photos/776656/pexels-photo-776656.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey[200],
              height: 200,
              child: const Center(child: Text("Image failed to load")),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            Icon(Icons.comment, color: Colors.grey),
            SizedBox(width: 5),
            Text('1'),
          ],
        ),
      ],
    );
  }
}
