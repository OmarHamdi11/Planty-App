import 'package:flutter/material.dart';
import 'package:planty/core/utils/fonts.dart';
import 'package:planty/features/home/presentation/views/navigation_view.dart';
import 'package:planty/features/home/presentation/views/widgets/app_bar_button.dart';

class IdentifyCustomAppBar extends StatelessWidget {
  const IdentifyCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "File Upload",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: AppFonts.montserrat,
          ),
        ),
        AppBarButton(
            onTap: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const NavigationView()),
              );
            },
            icon: Icons.home_outlined)
      ],
    );
  }
}
