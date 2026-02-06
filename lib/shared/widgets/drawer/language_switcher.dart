import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/colors/color_palette.dart';
import 'package:portfolio/shared/widgets/drawer/language_option.dart';

class LanguageSwitcher extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  const LanguageSwitcher({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final brandColor = ColorPalette.lightTextBrandDefault;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: bgColors.primaryDefault,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: LanguageOption(
              label: 'Deutsch',
              isSelected: selectedLanguage == 'de',
              onTap: () => onLanguageChanged('de'),
              brandColor: brandColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: LanguageOption(
              label: 'English',
              isSelected: selectedLanguage == 'en',
              onTap: () => onLanguageChanged('en'),
              brandColor: brandColor,
            ),
          ),
        ],
      ),
    );
  }
}
