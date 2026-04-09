import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/utils/functions/show_snack_bar.dart';
import 'package:note_app/core/utils/functions/validators.dart';
import 'package:note_app/core/widgets/custom_button.dart';
import 'package:note_app/core/widgets/custom_confirm_password_field.dart';
import 'package:note_app/core/widgets/custom_email_text_form_field.dart';
import 'package:note_app/core/widgets/custom_form.dart';
import 'package:note_app/core/widgets/custom_password_text_form_field.dart';
import 'package:note_app/core/widgets/custom_spinner.dart';
import 'package:note_app/core/widgets/custom_text_form_field.dart';
import 'package:note_app/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:note_app/features/auth/presentation/screens/login_screen.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_auth_navigation_link.dart';

class CustomRegisterForm extends StatefulWidget {
  const CustomRegisterForm({super.key});

  @override
  State<CustomRegisterForm> createState() => _CustomRegisterFormState();
}

class _CustomRegisterFormState extends State<CustomRegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          showErrorSnackBar(context, message: state.errMessage);
        }
        if (state is RegisterSuccess) {
          showSucessSnackBar(
            context,
            message: "${AppString.kRegister} success.",
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
        if (state is RegisterLoading) {}
      },
      builder: (context, state) {
        return CustomForm(
          formKey: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              CustomTextFormField(
                textStyle: AppTextStyles.normal14Regular,
                hintText: "Your name...",
                controller: userNameController,
                validator: validateUsername,
              ),
              CustomEmailTextFormField(controller: emailController),
              CustomPasswordField(controller: passwordController),
              CustomConfirmPasswordField(
                controller: confirmPasswordController,
                passwordController: passwordController,
              ),
              const CustomAuthNavigationLink(
                destination: LoginScreen(),
                text: "Do you already have an account?  ",
                hyperLinkText: AppString.kLogin,
              ),
              const Gap(12),
              state is RegisterLoading
                  ? const CustomSpinner()
                  : CustomButton(
                      label: AppString.kRegister.toUpperCase(),
                      backgroundColor: AppColors.bgLightRed,
                      onTap: () {
                        _register(context);
                      },
                    ),
            ],
          ),
        );
      },
    );
  }

  void _register(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<RegisterCubit>().register(
        userName: userNameController.text.trim().replaceAll(' ', "_"),
        email: emailController.text.trim(),
        // email:
        //     "abc@gmail.com", // TEMP: Hardcoded email. Email auth optional for now.
        password: passwordController.text.trim(),
      );
    } else {
      showErrorSnackBar(context, message: "${AppString.kRegister} failed!");
    }
  }
}
