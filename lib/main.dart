import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/service/upload_post_service.dart';
import 'package:planty/core/service/upload_profile_picture_service.dart';
import 'package:planty/core/utils/fonts.dart';
import 'package:planty/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:planty/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:planty/features/comments/presentation/manager/comment_cubit/comment_cubit.dart';
import 'package:planty/features/comments/presentation/manager/delete_cubit/delete_comment_cubit.dart';
import 'package:planty/features/community/presentation/manager/community_cubit/community_cubit.dart';
import 'package:planty/features/community/presentation/manager/post_cubit/post_cubit.dart';
import 'package:planty/features/e-commerce/presentation/manager/cart_provider.dart';
import 'package:planty/features/e-commerce/presentation/manager/product_cubit/product_cubit.dart';
import 'package:planty/features/home/presentation/views/navigation_view.dart';
import 'package:planty/features/identify/data/models/identify_service.dart';
import 'package:planty/features/identify/presentation/manager/identify_cubit/identify_cubit.dart';
import 'package:planty/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:planty/features/profile/presentation/manager/upload_picture_cubit/upload_picture_cubit.dart';
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
        BlocProvider(create: (_) => ProfileCubit()),
        BlocProvider(
          create: (_) => UploadPictureCubit(UploadProfilePictureService()),
        ),
        BlocProvider(create: (_) => CommunityCubit()),
        BlocProvider(create: (_) => CreatePostCubit(UploadPostService())),
        BlocProvider(create: (_) => CommentCubit()),
        BlocProvider(create: (_) => DeleteCommentCubit()),
        BlocProvider(create: (_) => ProductCubit()..fetchProducts()),
        BlocProvider(
          create: (_) => IdentifyCubit(
            IdentifyService(Dio()),
          ),
        ),
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
