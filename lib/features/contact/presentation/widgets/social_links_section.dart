import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinksSection extends StatelessWidget {
  const SocialLinksSection({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final isDark = brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SocialItem(
          iconAsset: AppAssets.message,
          title: 'Email',
          value: 'yosra.mohsen@example.com',
          onTap: () => _launchUrl('mailto:yosra.mohsen@example.com'),
          textColors: textColors,
          isDark: isDark,
        ),
        const SizedBox(height: AppDimensions.spacing3xl),
        _SocialItem(
          iconAsset: AppAssets.linkedin,
          title: 'LinkedIn',
          value: 'linkedin.com/in/yosramohsen',
          onTap: () => _launchUrl('https://linkedin.com/in/yosramohsen'),
          textColors: textColors,
          isDark: isDark,
        ),
        const SizedBox(height: AppDimensions.spacing3xl),
        _SocialItem(
          iconAsset: AppAssets.github,
          title: 'GitHub',
          value: 'github.com/yosramohsen',
          onTap: () => _launchUrl('https://github.com/yosramohsen'),
          textColors: textColors,
          isDark: isDark,
        ),
        const SizedBox(height: AppDimensions.spacing3xl),
        _SocialItem(
          iconAsset: AppAssets.whatsapp,
          title: 'WhatsApp',
          value: '+20 123 456 789',
          onTap: () => _launchUrl('https://wa.me/20123456789'),
          textColors: textColors,
          isDark: isDark,
        ),
      ],
    );
  }
}

class _SocialItem extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String value;
  final VoidCallback onTap;
  final TextColors textColors;
  final bool isDark;

  const _SocialItem({
    required this.iconAsset,
    required this.title,
    required this.value,
    required this.onTap,
    required this.textColors,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.spacingSm,
          horizontal: AppDimensions.spacingMd,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(AppDimensions.spacingMd),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.backgroundColors(
                        Brightness.dark,
                      ).primarySecondary
                    : AppColors.backgroundColors(Brightness.light).brandLight,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                iconAsset,
                color: isDark
                    ? textColors.brandDefault
                    : textColors.primaryDefault,
              ),
            ),
            const SizedBox(width: AppDimensions.spacingXl),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.bodySm(
                    color: textColors.brandDisabled,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: AppTypography.bodyLg(
                    color: textColors.primaryDefault,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
