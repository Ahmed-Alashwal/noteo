import 'package:flutter/material.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_auth_screen_body.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_register_form.dart';

class CustomRegisterScreenBody extends StatelessWidget {
  const CustomRegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAuthBody(
      authForm: CustomRegisterForm(),
      pageTitle: AppString.kRegister,
    );
  }
}
