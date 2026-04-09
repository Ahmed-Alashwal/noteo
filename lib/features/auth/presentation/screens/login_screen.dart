import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/utils/functions/service_locator.dart';
import 'package:note_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:note_app/features/auth/domain/usecases/auth_login_use_case.dart';
import 'package:note_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocProvider(
        create: (context) => LoginCubit(
          authLoginUseCase: AuthLoginUseCase(
            authRepository: di.get<AuthRepositoryImpl>(),
          ),
        ),
        child: const Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.bgSecondary,
          body: CustomLoginScreenBody(),
        ),
      ),
    );
  }
}
