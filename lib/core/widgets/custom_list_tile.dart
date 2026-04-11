import 'package:flutter/material.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/text_style.dart';

class CustomListTile extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final IconData icon;
  const CustomListTile({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: true,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      leading: Icon(icon, size: 22, color: AppColors.bgWhite),
      title: Text(title, style: AppTextStyles.normal14Regular),
      trailing: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chevron_right, size: 22, color: AppColors.bgLightRed),
        ],
      ),
    );
  }
}
