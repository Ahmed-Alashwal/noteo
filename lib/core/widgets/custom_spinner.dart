import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/text_style.dart';

class CustomSpinner extends StatelessWidget {
  final String? title;
  const CustomSpinner({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(
            color: AppColors.bgLightRed,
            backgroundColor: AppColors.bgDarkRed,
            strokeWidth: 1.5,
          ),
          const Gap(12),
          Text(title ?? "", style: AppTextStyles.verySmall10Regular),
        ],
      ),
    );
  }
}
