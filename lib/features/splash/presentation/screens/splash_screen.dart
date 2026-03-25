import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/widgets/app_logo_widget.dart';
import 'package:note_app/features/note/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigate(); //
    super.initState();
  }

  void _navigate() {
    //
    Future.delayed(
      const Duration(seconds: 3), //
      () {
        if (!mounted) return; //
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()), //
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: Center(
        child: Padding(
          padding: AppSizes.pV16,
          child: Column(
            children: [
              Spacer(), //
              AppLogoWidget(width: 64, height: 64),
              Gap(12),
              Text(
                "Write your notes down...",
                style: AppTextStyles.verySmall12Regular,
              ),
              Spacer(), //
              Text(
                "Created By Ahmed Alashwal",
                style: AppTextStyles.verySmall12Bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
