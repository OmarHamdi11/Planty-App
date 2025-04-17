import 'package:flutter/material.dart';

class CustomLogoIcon extends StatelessWidget {
  const CustomLogoIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 1.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
        //shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.0),
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/Logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
