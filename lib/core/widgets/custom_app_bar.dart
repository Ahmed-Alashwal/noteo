import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/widgets/app_logo_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title});

  final String? title;

  @override
  //
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 65),
      child: AppBar(
        backgroundColor: AppColors.bgPrimary,
        title: Padding(
          padding: AppSizes.pH4,
          child: title != null
              ? Text(title!, style: AppTextStyles.h1)
              : const AppLogoWidget(),
        ),
      ),
    );
  }
}
