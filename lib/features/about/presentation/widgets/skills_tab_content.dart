import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/shared/widgets/badge_group.dart';

class SkillsTabContent extends StatelessWidget {
  const SkillsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. UI/UX & Product Design
        FadeInUp(
          duration: const Duration(milliseconds: 500),
          child: _SkillsSection(
            title: 'about.skills.uiux.title'.tr(),
            labels: [
              'about.skills.uiux.labels.wireframing'.tr(),
              'about.skills.uiux.labels.prototyping'.tr(),
              'about.skills.uiux.labels.ai_prompts'.tr(),
              'about.skills.uiux.labels.design_system'.tr(),
              'about.skills.uiux.labels.design_tokens'.tr(),
            ],
          ),
        ),

        const SizedBox(height: AppDimensions.spacing8xl),

        // 2. Flutter Development
        FadeInUp(
          delay: const Duration(milliseconds: 100),
          duration: const Duration(milliseconds: 500),
          child: _SkillsSection(
            title: 'about.skills.flutter.title'.tr(),
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

        const SizedBox(height: AppDimensions.spacing8xl),

        // 3. Soft Skills
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'about.skills.soft_skills.title'.tr(),
                style: AppTypography.headlineSm(
                  color: textColors.primaryDefault,
                ).copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: AppDimensions.spacingXl),
              Text(
                'about.skills.soft_skills.description'.tr(),
                style: AppTypography.bodyMd(
                  color: textColors.brandDisabled,
                ).copyWith(fontWeight: FontWeight.w500, height: 1.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SkillsSection extends StatelessWidget {
  final String title;
  final List<String> labels;

  const _SkillsSection({
    required this.title,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    final textColors = AppColors.textColors(Theme.of(context).brightness);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.headlineSm(
            color: textColors.primaryDefault,
          ).copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: AppDimensions.spacingXl),
        BadgeGroup(
          labels: labels,
          spacing: AppDimensions.spacingMd,
          runSpacing: AppDimensions.spacingMd,
        ),
      ],
    );
  }
}
