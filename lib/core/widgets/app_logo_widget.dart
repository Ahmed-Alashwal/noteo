import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/core/constants/strings.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppString.kNoteoLogo,
      width: width ?? 42,
      height: height ?? 42,
    );
  }
}
