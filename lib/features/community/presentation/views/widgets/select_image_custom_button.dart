import 'dart:io';
import 'package:flutter/material.dart';

class SelectImageCustomButton extends StatelessWidget {
  const SelectImageCustomButton({
    super.key,
    required File? selectedImage,
    required this.onTap,
  }) : _selectedImage = selectedImage;

  final File? _selectedImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F0F0),
          borderRadius: BorderRadius.circular(12),
        ),
        child: _selectedImage == null
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Upload image',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  _selectedImage,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}











































































































































































// GestureDetector(
//               onTap: () => _showImageSourceActionSheet(context),
//               child: Container(
//                 width: double.infinity,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF3F0F0),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: _selectedImage == null
//                     ? const Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.image_outlined,
//                               size: 40,
//                               color: Colors.grey,
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Upload image',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     : ClipRRect(
//                         borderRadius: BorderRadius.circular(12),
//                         child: Image.file(
//                           _selectedImage!,
//                           width: double.infinity,
//                           height: 120,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//               ),
//             ),