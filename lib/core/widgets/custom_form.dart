import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final Widget child;
  const CustomForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.child,
  }) : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteractionIfError,
      child: child,
    );
  }
}
