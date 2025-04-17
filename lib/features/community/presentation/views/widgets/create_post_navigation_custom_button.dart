import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/community/presentation/views/create_post_view.dart';

class CreatePostNavigationCustomButton extends StatelessWidget {
  const CreatePostNavigationCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreatePostView(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 4, color: Colors.black12),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1.5,
          ),
        ),
        child: const Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primaryColor,
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
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
