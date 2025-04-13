import 'package:flutter/material.dart';

class PostContentTextField extends StatelessWidget {
  const PostContentTextField({
    super.key,
    required this.onChanged,
    required this.controller,
  });

  final void Function(String)? onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: 'Write Here',
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
