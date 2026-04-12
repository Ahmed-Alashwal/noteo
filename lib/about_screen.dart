import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/widgets/custom_app_bar.dart';
// import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const _linkedin =
      'https://www.linkedin.com/in/ahmed-al-ashwal-586a01398';
  static const _github = 'https://github.com/Ahmed-Alashwal';
  static const _email = 'mailto:ahmedalashwal000@gmail.com';

  Future<void> _open(String url) async {
    // await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSecondary,
      appBar: const CustomAppBar(title: AppString.kAbout),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),

            SvgPicture.asset(AppString.kHappyCircle, width: 64, height: 64),

            const SizedBox(height: 16),

            const Text(
              AppString.kAppName,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),

            const SizedBox(height: 4),

            const Text(AppString.kVersion, style: AppTextStyles.small12Regular),

            const SizedBox(height: 32),
            const Divider(color: AppColors.bgWhite, height: 1),
            const SizedBox(height: 32),

            // Description
            const Text(
              '${AppString.kAppName} is a simple and minimal note-taking app. '
              'Capture your thoughts, ideas, and tasks — '
              'quickly and without distraction.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.5,
                color: AppColors.textPrimary,
                height: 1.7,
              ),
            ),

            const SizedBox(height: 32),

            // Info Cards
            _buildInfoCard(
              Icons.person_outline,
              'Developer',
              AppString.kDeveloperName,
            ),
            _buildInfoCard(Icons.flutter_dash, 'Platform', 'Flutter & Dart'),

            const SizedBox(height: 24),

            // Social Links Row
            _buildSocialLinks(),

            const SizedBox(height: 32),
            const Divider(color: AppColors.bgWhite, height: 1),
            const SizedBox(height: 24),

            // Footer
            Text(
              '© ${DateTime.now().year} ${AppString.kDeveloperName}. All rights reserved.',
              style: AppTextStyles.verySmall10Regular,
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      children: [
        Expanded(
          child: _buildSocialButton(
            icon: Icons.work_outline_rounded,
            label: 'LinkedIn',
            onTap: () => _open(_linkedin),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildSocialButton(
            icon: Icons.code_rounded,
            label: 'GitHub',
            onTap: () => _open(_github),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildSocialButton(
            icon: Icons.mail_outline_rounded,
            label: 'Email',
            onTap: () => _open(_email),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.bgPrimary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.bgLightRed.withAlpha(175)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.bgLightRed.withAlpha(205), size: 18),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(color: AppColors.textPrimary, fontSize: 8),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.bgPrimary,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.bgLightRed.withAlpha(175)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.bgLightRed.withAlpha(205), size: 20),
          const SizedBox(width: 14),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
