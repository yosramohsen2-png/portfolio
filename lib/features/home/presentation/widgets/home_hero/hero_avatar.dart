import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';

/// A circular profile avatar widget designed for the Home Hero Section
class HeroAvatar extends StatelessWidget {
  final bool isWeb;

  const HeroAvatar({super.key, required this.isWeb});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);

    final avatarSize = isWeb ? 180.0 : 130.0;

    return Container(
      width: avatarSize,
      height: avatarSize,
      padding: const EdgeInsets.all(AppDimensions.spacingXs),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: bgColors.brandSolid.withValues(alpha: 0.3),
            blurRadius: AppDimensions.effect4xl,
            spreadRadius: AppDimensions.effectLg,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: bgColors.brandSolid,
            width: AppDimensions.borderWidthSm,
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            AppAssets.me,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: bgColors.primarySecondary,
              child: Icon(
                Icons.person,
                size: isWeb ? AppDimensions.icon2xl : AppDimensions.iconXl,
                color: textColors.brandDefault,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
