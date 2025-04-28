import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        } else if (state is SignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Successfully!')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const NavigationView();
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
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        );
      },
    );
  }
}
