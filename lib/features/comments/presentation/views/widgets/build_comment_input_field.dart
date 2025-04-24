import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';

class BuildCommentInputField extends StatelessWidget {
  const BuildCommentInputField({
    super.key,
    required TextEditingController commentController,
  }) : _commentController = commentController;

  final TextEditingController _commentController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(right: 5, left: 5, top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          border: Border(
            top: BorderSide(color: Colors.grey.shade300),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: "Write a comment...",
                  filled: true,
                  fillColor: const Color(0xFFF2F2F2),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(
                Icons.send,
                color: AppColors.primaryColor,
                size: 35,
              ),
              onPressed: () {
                print("User typed: ${_commentController.text}");
                _commentController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
