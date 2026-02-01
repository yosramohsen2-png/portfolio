import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class CompactLanguageToggle extends StatefulWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  const CompactLanguageToggle({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  State<CompactLanguageToggle> createState() => _CompactLanguageToggleState();
}

class _CompactLanguageToggleState extends State<CompactLanguageToggle> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        height: 40,
        padding: EdgeInsets.all(AppDimensions.spacingXs),
        decoration: BoxDecoration(
          color: _isHovered ? bgColors.primaryHover : bgColors.primaryDefault,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
          border: _isHovered
              ? null
              : Border.all(
                  color: borderColors.primaryDisabled,
                  width: 1,
                ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _LanguageButton(
              label: 'EN',
              isSelected: widget.selectedLanguage == 'en',
              isHovered: _isHovered,
              onTap: () => widget.onLanguageChanged('en'),
            ),
            SizedBox(width: AppDimensions.spacingXs),
            _LanguageButton(
              label: 'DE',
              isSelected: widget.selectedLanguage == 'de',
              isHovered: _isHovered,
              onTap: () => widget.onLanguageChanged('de'),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isHovered;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.label,
    required this.isSelected,
    required this.isHovered,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);

    Color backgroundColor;
    Color textColor;

    if (isSelected) {
      backgroundColor = bgColors.brandSolid;
      textColor = textColors.primaryToggle;
    } else {
      backgroundColor = isHovered 
          ? const Color(0xFFEBEDF0)
          : bgColors.primaryDefault;
      textColor = textColors.primaryDisabledToggle;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          debugPrint("$label button tapped!");
          onTap();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingMd,
            vertical: AppDimensions.spacingXs,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          ),
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: AppTypography.bodyMd(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
