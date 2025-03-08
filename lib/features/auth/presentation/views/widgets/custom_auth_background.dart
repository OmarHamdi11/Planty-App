import 'package:flutter/material.dart';
import 'package:planty/core/utils/images.dart';

class CustomAuthBackground extends StatelessWidget {
  const CustomAuthBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Image.asset(
        AppImages.authBackground,
        fit: BoxFit.cover,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
      ),
    );
  }
}
