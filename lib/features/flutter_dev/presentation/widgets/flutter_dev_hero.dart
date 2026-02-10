import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class FlutterDevHero extends StatelessWidget {
  const FlutterDevHero({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final bgColors = AppColors.backgroundColors(brightness);

    return Column(
      children: [
        Text(
          'flutter_dev.title'.tr(),
          style: AppTypography.headline3xl(color: textColors.primaryDefault)
              .copyWith(fontWeight: FontWeight.w900),
        ),
        Text(
          'flutter_dev.subtitle'.tr(),
          style: AppTypography.headlineXl(color: bgColors.brandSolid)
              .copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        Text(
          'flutter_dev.description'.tr(),
          style: AppTypography.bodyLg(color: textColors.primaryDisabled2)
              .copyWith(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        // The yellow underline from Figma
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
