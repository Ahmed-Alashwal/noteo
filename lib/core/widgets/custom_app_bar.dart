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
  Size get preferredSize => const Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          backgroundColor: AppColors.bgPrimary,
          iconTheme: const IconThemeData(color: AppColors.textPrimary),
          title: title != null
              ? Text(title!, style: AppTextStyles.h1)
              : const Padding(padding: AppSizes.pH8, child: AppLogoWidget()),
        ),
      ),
    );
  }
}
