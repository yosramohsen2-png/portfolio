import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/shared/widgets/badge_size.dart';
import 'package:portfolio/features/about/presentation/widgets/skills_section.dart';

class SkillsTabContent extends StatelessWidget {
  const SkillsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;

    // Choose badge size based on screen size
    final badgeSize = isMobile ? BadgeSize.medium : BadgeSize.large;
    final alignment = isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center;
    final wrapAlignment = isMobile ? WrapAlignment.start : WrapAlignment.center;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        // 1. UI/UX & Product Design
        FadeInUp(
          duration: const Duration(milliseconds: 500),
          child: SkillsSection(
            title: isMobile ? 'about.skills.uiux.title'.tr() : null,
            badgeSize: badgeSize,
            wrapAlignment: wrapAlignment,
            labels: [
              'about.skills.uiux.labels.wireframing'.tr(),
              'about.skills.uiux.labels.prototyping'.tr(),
              'about.skills.uiux.labels.ai_prompts'.tr(),
              'about.skills.uiux.labels.design_system'.tr(),
              'about.skills.uiux.labels.design_tokens'.tr(),
            ],
          ),
        ),

        const SizedBox(height: AppDimensions.spacing2xl),

        // 2. Flutter Development
        FadeInUp(
          delay: const Duration(milliseconds: 100),
          duration: const Duration(milliseconds: 500),
          child: SkillsSection(
            title: isMobile ? 'about.skills.flutter.title'.tr() : null,
            badgeSize: badgeSize,
            wrapAlignment: wrapAlignment,
            labels: [
              'about.skills.flutter.labels.dart'.tr(),
              'about.skills.flutter.labels.responsive_layout'.tr(),
              'about.skills.flutter.labels.state_management'.tr(),
              'about.skills.flutter.labels.api_integration'.tr(),
              'about.skills.flutter.labels.reusable_widgets'.tr(),
              'about.skills.flutter.labels.pixel_perfect'.tr(),
            ],
          ),
        ),

        const SizedBox(height: AppDimensions.spacing6xl),

        // 3. Soft Skills
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 500),
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              Text(
                'about.skills.soft_skills.title'.tr(),
                textAlign: isMobile ? TextAlign.start : TextAlign.center,
                style: (isMobile ? AppTypography.headlineSm(color: textColors.primaryDefault) : AppTypography.headlineMd(color: textColors.primaryDefault))
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: AppDimensions.spacingMd),
              Text(
                'about.skills.soft_skills.description'.tr(),
                textAlign: isMobile ? TextAlign.start : TextAlign.center,
                style: (isMobile ? AppTypography.bodyMd(color: textColors.brandDisabled) : AppTypography.bodyXl(color: textColors.brandDisabled))
                    .copyWith(fontWeight: FontWeight.w500, height: 1.6),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
