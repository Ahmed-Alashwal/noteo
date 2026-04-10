import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:note_app/core/api/api_endpoints.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/utils/functions/service_locator.dart';
import 'package:note_app/core/widgets/app_logo_widget.dart';
import 'package:note_app/features/auth/presentation/screens/login_screen.dart';
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

void _navigate() async {
  await Future.delayed(const Duration(seconds: 2));

  if (!mounted) return;

  String? token = await di.get<FlutterSecureStorage>().read(
    key: ApiKey.accessToken,
  );

  if (!mounted) return;

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) =>
          token != null ? const HomeScreen() : const LoginScreen(),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSecondary,
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(AppString.kTopCircles),
          ),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLogoWidget(width: 64, height: 64),
                Gap(12),
                Text(
                  "Write your notes down...",
                  style: AppTextStyles.verySmall10Regular,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppString.kBottomCircles),
          ),
        ],
      ),
    );
  }
}
