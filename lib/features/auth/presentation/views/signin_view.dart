import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/widgets/dialog/upload_status.dart';
import 'package:planty/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:planty/features/auth/presentation/views/widgets/sign_in_body.dart';
import 'package:planty/features/home/presentation/views/navigation_view.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          showDialog(
            context: context,
            builder: (_) => ResultStatusDialog(
              status: UploadStatus.error,
              title: 'Login Failed',
              message: state.errorMessage,
              buttonText: 'Try Again',
              onPressed: () => Navigator.pop(context),
            ),
          );
        } else if (state is SignInSuccess) {
          showDialog(
            context: context,
            builder: (_) => ResultStatusDialog(
              status: UploadStatus.success,
              title: 'Login Successful',
              message: 'You are now logged in.',
              buttonText: 'Continue',
              onPressed: () {
                FocusScope.of(context).unfocus(); // Dismiss keyboard
                Navigator.pop(context); // Close dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NavigationView(),
                  ),
                );
              },
            ),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<SignInCubit>();

        return Stack(
          children: [
            SignInBody(
              formKey: formKey,
              emailController: _emailController,
              passwordController: _passwordController,
              cubit: cubit,
            ),
            if (state is SignInLoading)
              Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
