import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/widgets/custom_text_form_field.dart';

class CustomConfirmPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;

  const CustomConfirmPasswordField({
    super.key,
    required this.controller,
    required this.passwordController,
  });

  @override
  State<CustomConfirmPasswordField> createState() =>
      _CustomConfirmPasswordFieldState();
}

class _CustomConfirmPasswordFieldState
    extends State<CustomConfirmPasswordField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      isObscureText: !_isVisible,
      hintText: "Confirm password...",
      controller: widget.controller,
      validator: (value) {
        if (value.trim() != widget.passwordController.text.trim()) {
          return "Passwords must match";
        }
        return null;
      },
      icon: IconButton(
        onPressed: () {
          setState(() {
            _isVisible = !_isVisible;
          });
        },
        icon: _isVisible
            ? SvgPicture.asset(AppString.kSadCircle, width: 24, height: 24)
            : SvgPicture.asset(AppString.kHappyCircle, width: 24, height: 24),
      ),
    );
  }
}
