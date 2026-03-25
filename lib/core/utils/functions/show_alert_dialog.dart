import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/widgets/custom_button.dart';

Future<dynamic> showAlertDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.bgPrimary,
        title: const Row(
          spacing: 8,
          children: [
            Icon(Icons.delete, color: AppColors.bgLightRed, size: 28),
            Text("Confirm Deletion", style: AppTextStyles.h1),
          ],
        ),
        content: const Text(
          "Are you sure you want to delete this note? This action cannot be undone.",
          style: AppTextStyles.normal16Regular,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                label: "Cancel",
                backgroundColor: AppColors.bgSecondary,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              CustomButton(
                label: "Deletion",
                backgroundColor: AppColors.error,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
