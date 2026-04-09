import 'package:flutter/material.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_auth_screen_body.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_login_form.dart';

class CustomLoginScreenBody extends StatelessWidget {
  const CustomLoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAuthBody(
      authForm: CustomLoginForm(),
      pageTitle: AppString.kLogin,
    );
  }
}
