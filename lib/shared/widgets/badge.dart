import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

enum BadgeSize { small, medium, large }

class Badge extends StatelessWidget {
  final String label;
  final BadgeSize size;

  const Badge({
    super.key,
    required this.label,
    this.size = BadgeSize.medium,
  });

  EdgeInsets get _padding {
    switch (size) {
      case BadgeSize.small:
        return EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMd,
          vertical: AppDimensions.spacingXs,
        );
      case BadgeSize.medium:
        return EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMd,
          vertical: AppDimensions.spacingXs,
        );
      case BadgeSize.large:
        return EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingXl,
          vertical: AppDimensions.spacingMd,
        );
    }
  }

  TextStyle _getTextStyle(BuildContext context, TextColors textColors) {
    final color = textColors.primaryDisabled;
    
    switch (size) {
      case BadgeSize.small:
        return AppTypography.labelSm(color: color);
      case BadgeSize.medium:
        return AppTypography.labelSm(color: color);
      case BadgeSize.large:
        return AppTypography.bodyXl(
          color: color,
          fontWeight: FontWeight.w700,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);

    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: bgColors.brandLight,
        borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
      ),
      child: Text(
        label,
        style: _getTextStyle(context, textColors),
      ),
    );
  }
}

class BadgeSecondary extends StatelessWidget {
  final String label;
  final BadgeSize size;

  const BadgeSecondary({
    super.key,
    required this.label,
    this.size = BadgeSize.large,
  });

  EdgeInsets get _padding {
    return EdgeInsets.symmetric(
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
