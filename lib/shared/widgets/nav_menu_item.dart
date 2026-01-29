import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class NavMenuItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavMenuItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingXl,
          vertical: AppDimensions.spacingLg,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? textColors.brandDefault
              : bgColors.primaryDefault,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        ),
        child: Text(
          label,
          style: AppTypography.bodyMd(
            color: isSelected
                ? textColors.primaryToggle
                : textColors.brandDisabled,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
