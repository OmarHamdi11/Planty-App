import 'package:flutter/material.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/features/community/presentation/views/community_view.dart';
import 'package:planty/features/e-commerce/presentation/views/commerce_view.dart';
import 'package:planty/features/home/presentation/views/home_view.dart';
import 'package:planty/features/profile/presentation/views/profile_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key, this.myCurrentIndex = 0});
  final int myCurrentIndex;

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  late int myCurrentIndex = widget.myCurrentIndex;
  List pages = [
    const HomeView(),
    CommunityView(),
    const CommerceView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: AppColors.gradient2,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
          ),
        ),
        BottomNavigationBar(
          currentIndex: myCurrentIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              myCurrentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: "Community",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: "Commerce",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              label: "Profile",
            ),
          ],
        ),
      ]),
      body: pages[myCurrentIndex],
    );
  }
}
