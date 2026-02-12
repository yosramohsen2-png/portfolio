import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/shared/widgets/badge_size.dart';
import 'package:portfolio/shared/widgets/badge_group.dart';

class SkillsSection extends StatelessWidget {
  final String? title;
  final List<String> labels;
  final BadgeSize badgeSize;
  final WrapAlignment wrapAlignment;

  const SkillsSection({
    super.key,
    this.title,
    required this.labels,
    required this.badgeSize,
    required this.wrapAlignment,
  });

  @override
  Widget build(BuildContext context) {
    final textColors = AppColors.textColors(Theme.of(context).brightness);

    return Column(
      crossAxisAlignment: wrapAlignment == WrapAlignment.center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: AppTypography.headlineSm(
              color: textColors.primaryDefault,
            ).copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: AppDimensions.spacingMd),
        ],
        BadgeGroup(
          labels: labels,
          size: badgeSize,
          alignment: wrapAlignment,
          spacing: wrapAlignment == WrapAlignment.center ? AppDimensions.spacingXl : AppDimensions.spacingMd,
          runSpacing: AppDimensions.spacingMd,
        ),
      ],
    );
  }
}
