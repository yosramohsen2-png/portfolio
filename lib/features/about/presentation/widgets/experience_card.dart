import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class ExperienceCard extends StatelessWidget {
  final String title;
  final String description;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spacingXl),
      decoration: BoxDecoration(
        color: bgColors.primarySurface,
        borderRadius: BorderRadius.circular(AppDimensions.radius2xl),
        border: Border.all(
          color: borderColors.primaryCards,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon placeholder as seen in HTML (about-icon)
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: AppColors.brandGold.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
            ),
            child: const Icon(
              Icons.work_outline,
              color: AppColors.brandGold,
              size: 20,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXl),
          Text(
            title,
            style: AppTypography.headlineXs(
              color: textColors.primaryDefault,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMd),
          Text(
            description,
            style: AppTypography.bodyMd(
              color: textColors.primaryDisabled,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
