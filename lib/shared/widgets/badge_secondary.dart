import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/shared/widgets/badge_size.dart';

class BadgeSecondary extends StatelessWidget {
  final String label;
  final BadgeSize size;

  const BadgeSecondary({
    super.key,
    required this.label,
    this.size = BadgeSize.large,
  });

  EdgeInsets get _padding {
    return const EdgeInsets.symmetric(
      horizontal: AppDimensions.spacingXl,
      vertical: AppDimensions.spacingMd,
    );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);

    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: bgColors.primarySecondary,
        borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
      ),
      child: Text(
        label,
        style: AppTypography.bodyXl(
          color: textColors.primaryDisabled,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
