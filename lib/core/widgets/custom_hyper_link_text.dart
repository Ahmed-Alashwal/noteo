import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';

class CustomHyperLinkText extends StatelessWidget {
  final String hyperLinkText;
  const CustomHyperLinkText({super.key, required this.hyperLinkText});

  @override
  Widget build(BuildContext context) {
    return Text(
      hyperLinkText,
      style: const TextStyle(
        color: AppColors.bgLightRed,
        fontSize: 12,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.bgLightRed,
      ),
    );
  }
}
