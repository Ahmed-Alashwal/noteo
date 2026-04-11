import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/utils/functions/validators.dart';
import 'package:note_app/core/widgets/custom_text_form_field.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;

  const CustomPasswordField({super.key, required this.controller});

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      isObscureText: !_isVisible,
      hintText: "Password...",
      controller: widget.controller,
      validator: validatePassword,
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
