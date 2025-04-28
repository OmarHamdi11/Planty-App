import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/utils/fonts.dart';
import 'package:planty/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:planty/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:planty/features/e-commerce/presentation/manager/cart_provider.dart';
import 'package:planty/features/home/presentation/views/navigation_view.dart';
import 'package:planty/features/splash/presentation/views/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(
        token: token,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.token});
  final String? token;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SignUpCubit()),
        BlocProvider(create: (_) => SignInCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: AppFonts.poppins,
        ),
        home: token != null ? const NavigationView() : const SplashScreen(),
      ),
    );
  }
}
