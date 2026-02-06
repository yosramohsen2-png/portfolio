import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/core/theme/colors/background_colors.dart';
import 'package:portfolio/core/theme/colors/text_colors.dart';

class LanguageToggle extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  const LanguageToggle({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _LanguageButton(
          label: 'Deutsch',
          isSelected: selectedLanguage == 'de',
          onTap: () => onLanguageChanged('de'),
          bgColors: bgColors,
          textColors: textColors,
        ),
        SizedBox(width: AppDimensions.spacingXl),
        _LanguageButton(
          label: 'English',
          isSelected: selectedLanguage == 'en',
          onTap: () => onLanguageChanged('en'),
          bgColors: bgColors,
          textColors: textColors,
        ),
      ],
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final BackgroundColors bgColors;
  final TextColors textColors;

  const _LanguageButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.bgColors,
    required this.textColors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 169.33,
        padding: EdgeInsets.symmetric(vertical: AppDimensions.spacingMd),
        decoration: BoxDecoration(
          color: isSelected ? bgColors.brandSolid : bgColors.primaryDefault,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTypography.bodyLg(
              color: textColors.primaryHover,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
