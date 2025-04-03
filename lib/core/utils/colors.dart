import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF509137);
  static const Color secondaryColor = Color(0xFFF6F6E5);
  static const Color secondaryColor2 = Color(0xFFF5F5DC);
  static const Color shadowColor = Color(0xFF888888);
  static const Color startColor = Color(0xFF9DCD43);
  static const Color endColor = Color(0xFF478A36);

  static const LinearGradient gradient = LinearGradient(
    colors: [startColor, endColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient gradient2 = LinearGradient(
    colors: [Color(0xff88C542), Color(0xff55B140), Color(0xff219C3D)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
