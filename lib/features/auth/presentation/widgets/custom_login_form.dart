import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/utils/functions/show_snack_bar.dart';
import 'package:note_app/core/utils/functions/validators.dart';
import 'package:note_app/core/widgets/custom_button.dart';
import 'package:note_app/core/widgets/custom_form.dart';
import 'package:note_app/core/widgets/custom_password_text_form_field.dart';
import 'package:note_app/core/widgets/custom_spinner.dart';
import 'package:note_app/core/widgets/custom_text_form_field.dart';
import 'package:note_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:note_app/features/auth/presentation/screens/register_screen.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_auth_navigation_link.dart';
import 'package:note_app/features/note/presentation/screens/home_screen.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      formKey: _formKey,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            showErrorSnackBar(context, message: state.errMessage);
          }
          if (state is LoginSuccess) {
            showSucessSnackBar(
              context,
              message: "${AppString.kLogin} success.",
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
          if (state is LoginLoading) {}
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              CustomTextFormField(
                textStyle: AppTextStyles.normal14Regular,
                hintText: "Your name...",
                controller: userNameController,
                validator: validateUsername,
              ),
              CustomPasswordField(controller: passwordController),
              const CustomAuthNavigationLink(
                destination: RegisterScreen(),
                text: "Don't have an account?  ",
                hyperLinkText: AppString.kRegister,
              ),
              const Gap(12),
              state is LoginLoading
                  ? const CustomSpinner()
                  : CustomButton(
                      label: AppString.kLogin.toUpperCase(),
                      backgroundColor: AppColors.bgLightRed,
                      onTap: () {
                        _login(context);
                      },
                    ),
            ],
          );
        },
      ),
    );
  }

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
        username: userNameController.text.trim().replaceAll(' ', "_"),
        password: passwordController.text.trim(),
      );
    } else {
      showErrorSnackBar(context, message: "${AppString.kLogin} failed!");
    }
  }
}
