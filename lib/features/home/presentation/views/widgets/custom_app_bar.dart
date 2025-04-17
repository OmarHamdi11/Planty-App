import 'package:flutter/material.dart';
import 'package:planty/features/home/presentation/views/navigation_view.dart';
import 'package:planty/features/home/presentation/views/widgets/app_bar_button.dart';
import 'package:planty/features/home/presentation/views/widgets/custom_logo_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomLogoIcon(),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppBarButton(
                icon: Icons.person_outline_rounded,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationView(
                        myCurrentIndex: 3,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
