import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/widgets/dialog/upload_status.dart';
import 'package:planty/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:planty/features/auth/presentation/views/signin_view.dart';
import 'package:planty/features/auth/presentation/views/widgets/sign_up_body.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _reEnterPassController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          );
        } else if (state is SignUpSuccess) {
          Navigator.pop(context); // Remove loading dialog
          showDialog(
            context: context,
            builder: (_) => ResultStatusDialog(
              status: UploadStatus.success,
              title: 'Signed up successfully',
              message: state.message,
              buttonText: 'Ok',
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInView()),
              ),
            ),
          );
        } else if (state is SignUpFailure) {
          Navigator.pop(context); // Remove loading dialog
          showDialog(
            context: context,
            builder: (_) => ResultStatusDialog(
              status: UploadStatus.error,
              title: 'Error',
              message: state.error,
              buttonText: 'Try again',
              onPressed: () {
                Navigator.pop(context); // Close error dialog
              },
            ),
          );
        }
      },
      child: SignUpBody(
        formKey: formKey,
        firstNameController: _firstNameController,
        lastNameController: _lastNameController,
        emailController: _emailController,
        passwordController: _passwordController,
        reEnterPassController: _reEnterPassController,
      ),
    );
  }
}
