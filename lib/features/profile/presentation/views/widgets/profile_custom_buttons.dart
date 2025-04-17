import 'package:flutter/material.dart';
import 'package:planty/features/profile/presentation/views/widgets/save_custom_button.dart';
import 'package:planty/features/profile/presentation/views/widgets/sign_out_custom_button.dart';

class ProfileCustomButtons extends StatelessWidget {
  const ProfileCustomButtons({
    super.key,
    required this.save,
    required this.signOut,
  });

  final void Function()? save;
  final void Function()? signOut;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SaveCustomButton(
          onPressed: save,
        ),
        const SizedBox(height: 10),
        SignOutCustomButton(
          onPressed: signOut,
        ),
      ],
    );
  }
}
