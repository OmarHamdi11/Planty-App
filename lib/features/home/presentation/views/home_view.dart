import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:planty/features/home/presentation/views/widgets/custom_home_button.dart';

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
              const SizedBox(height: 30),
              const CustomAppBar(),
              const SizedBox(height: 50),
              CustomHomeButton(
                icon: Icons.camera_alt_outlined,
                title: "Identify",
                subTitle: "plant",
                imagePath: "assets/images/Diagnose.png",
                onTap: () {},
              ),
              const SizedBox(height: 30),
              CustomHomeButton(
                icon: Icons.headset_mic_outlined,
                title: "Diagnose",
                subTitle: "plant",
                imagePath: "assets/images/Diagnose.png",
                onTap: () {},
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

    //   return Scaffold(
    //     backgroundColor: AppColors.secondaryColor,
    //     body: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: ListView(
    //         children: [
    //           _buildCard(
    //               Icons.camera_alt, "Identify", "plant", Colors.green, context),
    //           SizedBox(height: 16),
    //           _buildCard(Icons.health_and_safety, "Diagnose", "plant",
    //               Colors.green, context),
    //           SizedBox(height: 16),
    //           _buildCard(
    //               Icons.shopping_cart, "Buy", "plant", Colors.green, context),
    //         ],
    //       ),
    //     ),
    //     bottomNavigationBar: BottomNavigationBar(
    //       selectedItemColor: Colors.green,
    //       unselectedItemColor: Colors.grey,
    //       items: [
    //         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.camera_alt), label: "Identify"),
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.local_hospital), label: "Diagnose"),
    //         BottomNavigationBarItem(icon: Icon(Icons.group), label: "Community"),
    //         BottomNavigationBarItem(icon: Icon(Icons.help), label: "Ask Expert"),
    //       ],
    //     ),
    //   );
  }

  // Widget _buildCard(IconData icon, String title, String subtitle, Color color,
  //     BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.lightGreen.shade50,
  //       borderRadius: BorderRadius.circular(12),
  //       border: Border.all(color: Colors.grey.shade300),
  //     ),
  //     child: Row(
  //       children: [
  //         Icon(icon, size: 40, color: color),
  //         SizedBox(width: 16),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(title,
  //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //             Text(subtitle,
  //                 style: TextStyle(fontSize: 14, color: Colors.green)),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
