import 'package:flutter/material.dart';
import 'package:planty/core/utils/fonts.dart';
import 'package:planty/features/e-commerce/presentation/manager/cart_provider.dart';
import 'package:planty/features/e-commerce/presentation/views/commerce_view.dart';
import 'package:planty/features/home/presentation/views/navigation_view.dart';
import 'package:planty/features/profile/presentation/views/profile_view.dart';
import 'package:planty/features/splash/presentation/views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppFonts.poppins,
      ),
      home: const NavigationView(),
    );
  }
}
