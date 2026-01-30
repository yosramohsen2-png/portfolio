import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/shared/widgets/compact_language_toggle.dart';
import 'package:portfolio/shared/widgets/logo.dart';
import 'package:portfolio/shared/widgets/icon_button_custom.dart';
import 'package:portfolio/shared/widgets/theme_toggle.dart';

class MobileHeader extends StatelessWidget {
  final Future<void> Function()? onThemeToggle;
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  const MobileHeader({
    super.key,
    this.onThemeToggle,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final borderColors = AppColors.borderColors(brightness);

    return Container(
      height: 64,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: borderColors.primaryDisabled,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Logo Section
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Logo(),
              ],
            ),
          ),

          // Actions Section
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Theme Toggle (Icon Button)
                const ThemeToggle(),
                SizedBox(width: AppDimensions.spacingSm),
                
                IconButtonCustom(
                  icon: Icons.menu,
                  onPressed: () {
                     // Open drawer or similar
                  },
                  size: IconButtonSize.medium, // Reverted to medium or kept consistent logic, but user wanted small previously.
                  // CSS says 40x40. IconButtonCustom(size: small) is 40. ThemeToggle is 40 hardcoded.
                  // Let's ensure consistency. ThemeToggle is 40.
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
