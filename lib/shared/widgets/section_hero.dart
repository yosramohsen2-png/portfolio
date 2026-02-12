import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';

/// A reusable hero section for internal pages (UI/UX, Flutter Dev, etc.)
/// Handles responsive font sizing and centering.
class SectionHero extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;

  const SectionHero({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final bgColors = AppColors.backgroundColors(brightness);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: (isMobile 
                  ? AppTypography.headlineLg(color: textColors.primaryDefault)
                  : AppTypography.headline3xl(color: textColors.primaryDefault))
              .copyWith(fontWeight: FontWeight.w900),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: (isMobile
                  ? AppTypography.headlineSm(color: bgColors.brandSolid)
                  : AppTypography.headlineXl(color: bgColors.brandSolid))
              .copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Text(
            description,
            style: AppTypography.bodyLg(color: textColors.primaryDisabled2)
                .copyWith(fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            color: bgColors.brandSolid,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
