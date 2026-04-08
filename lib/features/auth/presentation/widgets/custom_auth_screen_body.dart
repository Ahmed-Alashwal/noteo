import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/widgets/app_logo_widget.dart';

class CustomAuthBody extends StatelessWidget {
  final Widget authForm;
  final String pageTitle;
  const CustomAuthBody({
    super.key,
    required this.authForm,
    required this.pageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset(AppString.kTopCircles),
        ),
        const AppLogoWidget(width: 85, height: 85),
        const Gap(35),
        Expanded(
          child: Padding(
            padding: AppSizes.pAll12,
            child: SizedBox(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text(pageTitle, style: AppTextStyles.h1)],
                  ),
                  const Gap(4),
                  authForm,
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(AppString.kBottomCircles),
        ),
      ],
    );
  }
}
