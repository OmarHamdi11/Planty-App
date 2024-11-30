import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Text(
        'Get Started',
        style: TextStyle(
          color: Color(0xffF5F5DC),
          fontFamily: 'Montserrat',
          fontSize: 38,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
