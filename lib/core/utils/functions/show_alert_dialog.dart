import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/widgets/custom_button.dart';

Future<dynamic> showAlertDialog(
  BuildContext context, {
  required final String title,
  required IconData icon,
  required final String description,
  required final String confirmText,
  required void Function()? onConfirm,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.bgPrimary,
        title: Row(
          spacing: 8,
          children: [
            Icon(icon, color: AppColors.bgLightRed, size: 20),
            Text("Confirm $title", style: AppTextStyles.h3),
          ],
        ),
        content: Text(description, style: AppTextStyles.small12Bold),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                label: AppString.kCancel,
                backgroundColor: AppColors.bgSecondary,
                onTap: () {
                  Feedback.forTap(context); // Triggers sound/vibration
                  Navigator.pop(context);
                },
              ),
              CustomButton(
                label: confirmText,
                backgroundColor: AppColors.error,
                onTap: onConfirm,
              ),
            ],
          ),
        ],
      );
    },
  );
}
