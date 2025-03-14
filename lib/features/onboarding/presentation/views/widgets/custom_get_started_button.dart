import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/auth/presentation/views/signin_view.dart';
import 'package:planty/features/onboarding/presentation/views/widgets/get_started.dart';

class CustomGetStartedButton extends StatelessWidget {
  const CustomGetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 0,
      child: Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInView()),
              );
            },
            child: const Row(
              children: [
                GetStarted(),
                Icon(
                  Icons.arrow_circle_right_outlined,
                  color: AppColors.secondaryColor,
                  size: 50,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
