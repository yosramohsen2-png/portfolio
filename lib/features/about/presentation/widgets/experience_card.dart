import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class ExperienceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;
    final textColors = AppColors.textColors(brightness);
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spacing2xl),
      decoration: BoxDecoration(
        color: isDark ? bgColors.primarySecondary : Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radius2xl),
        border: Border.all(
          color: isDark ? borderColors.primaryCards : Colors.grey.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon with circular background as seen in image
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.backgroundColors(brightness).brandLight.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: textColors.brandDefault,
              size: 24,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXl),
          Text(
            title,
            style: AppTypography.headlineSm(
              color: textColors.primaryDefault,
            ).copyWith(fontWeight: FontWeight.w800, height: 1.2),
          ),
          const SizedBox(height: AppDimensions.spacingLg),
          Text(
            description,
            style: AppTypography.bodyMd(
              color: isDark ? textColors.primaryDefault : Colors.grey[600],
            ).copyWith(fontWeight: FontWeight.w500, height: 1.5),
          ),
        ],
      ),
    );
  }
}
