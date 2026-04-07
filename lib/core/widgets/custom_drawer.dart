import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:note_app/about_screen.dart';
import 'package:note_app/core/api/api_endpoints.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/sizes.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/utils/functions/service_locator.dart';
import 'package:note_app/core/utils/functions/show_alert_dialog.dart';
import 'package:note_app/core/widgets/custom_drawer_header.dart';
import 'package:note_app/core/widgets/custom_list_tile.dart';
import 'package:note_app/features/auth/presentation/screens/login_screen.dart';
import 'package:note_app/features/auth/presentation/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  final List<String> linksTitles = const ["Profile", "About", "Logout"];
  final List<IconData> linksIcons = const [
    Icons.person,
    Icons.info,
    Icons.logout_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.bgPrimary,
      child: Column(
        children: [
          const CustomDrawerHeader(),
          Expanded(
            child: Padding(
              padding: AppSizes.pV12,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CustomListTile(
                    title: linksTitles[index],
                    icon: linksIcons[index],
                    onTap: () {
                      if (linksTitles[index] == AppString.kProfile) {
                        _goToProfileScreen(context);
                      }
                      if (linksTitles[index] == AppString.kAbout) {
                        _goToAboutScreen(context);
                      }
                      if (linksTitles[index] == AppString.kLogout) {
                        _logout(context);
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _logout(BuildContext context) {
    return showAlertDialog(
      context,
      title: AppString.kLogout.toUpperCase(),
      icon: Icons.logout,
      description:
          "Are you sure you want to logout from ${AppString.kAppName}?",
      confirmText: AppString.kLogout,
      onConfirm: () async {
        await di.get<FlutterSecureStorage>().delete(key: ApiKey.accessToken);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (router) => false,
        );
      },
    );
  }

  void _goToAboutScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutScreen()),
    );
  }

  void _goToProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }
}
