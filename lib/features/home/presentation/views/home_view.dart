import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/diagnose/presentation/views/diagnose_view.dart';
import 'package:planty/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:planty/features/home/presentation/views/widgets/custom_home_button.dart';
import 'package:planty/features/identify/presentation/views/identify_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CustomAppBar(),
              const SizedBox(height: 50),
              CustomHomeButton(
                icon: Icons.camera_alt_outlined,
                title: "Identify",
                subTitle: "plant",
                imagePath: "assets/images/Diagnose.png",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IdentifyView(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              CustomHomeButton(
                icon: Icons.headset_mic_outlined,
                title: "Diagnose",
                subTitle: "plant",
                imagePath: "assets/images/Diagnose.png",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DiagnoseView(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              CustomHomeButton(
                icon: Icons.shopping_cart_outlined,
                title: "Buy",
                subTitle: "plant",
                imagePath: "assets/images/buyPlant.png",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
