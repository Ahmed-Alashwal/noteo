import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/text_style.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 7, 7, 8),
            Color.fromARGB(255, 6, 6, 7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: DrawerHeader(
        margin: EdgeInsets.zero,
        child: Row(
          spacing: 20,
          children: [
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.bgWhite,
                    blurRadius: 24,
                    spreadRadius: -12.5,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 32,
                backgroundColor: AppColors.bgPrimary,
                child: Icon(Icons.person, size: 36, color: AppColors.bgWhite),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Osama Elzero", style: AppTextStyles.normal14Bold),
                Text(
                  "osama_elzero@gmail.com",
                  style: AppTextStyles.verySmall10Regular,
                ),
                Gap(8),
                Row(
                  spacing: 2,
                  children: [
                    Icon(Icons.verified, size: 16, color: AppColors.bgLightRed),
                    Text(
                      "verified user",
                      style: AppTextStyles.verySmall10Regular,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
