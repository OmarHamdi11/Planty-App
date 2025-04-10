import 'package:flutter/material.dart';

class CreatePostNavigationCustomButton extends StatelessWidget {
  const CreatePostNavigationCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 12,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 16,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "what's in your mind ?",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
