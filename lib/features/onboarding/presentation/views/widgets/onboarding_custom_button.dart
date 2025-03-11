import 'package:flutter/material.dart';
import 'package:planty/features/auth/presentation/views/signin_view.dart';

class OnboardingCustomButton extends StatelessWidget {
  const OnboardingCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Color(0xffF5F5DC),
          ),
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SignInView();
              },
            ),
          );
        },
        child: const Icon(
          Icons.arrow_forward_rounded,
          color: Color(0xff49640F),
        ),
      ),
    );
  }
}
