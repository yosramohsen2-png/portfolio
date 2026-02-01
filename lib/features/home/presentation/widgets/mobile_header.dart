import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/shared/widgets/logo.dart';
import 'package:portfolio/shared/widgets/theme_toggle.dart';
import 'package:portfolio/shared/widgets/compact_language_toggle.dart';

/// Mobile Header Widget - Height: 64px, Padding: 8px
/// Contains: Logo (left), Language Toggle + Theme Toggle + Menu Button (right)
class MobileHeader extends StatelessWidget {
  final VoidCallback? onMenuPressed;
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  const MobileHeader({
    super.key,
    this.onMenuPressed,
    this.selectedLanguage = 'en',
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final borderColors = AppColors.borderColors(brightness);
    final bgColors = AppColors.backgroundColors(brightness);

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: borderColors.primaryDisabled,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo Section (Left)
          const Logo(),

          // Actions Section (Right)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Theme Toggle - 40x40
              const ThemeToggle(),
              const SizedBox(width: 8), // gap: 8px as per CSS
              
              // Menu/Drawer Button - 40x40
              _MenuButton(
                onPressed: onMenuPressed,
                bgColor: bgColors.primarySecondary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Menu Button Widget - 40x40, radius 12
class _MenuButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color bgColor;

  const _MenuButton({
    this.onPressed,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Image.asset(
            AppAssets.drawer,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
