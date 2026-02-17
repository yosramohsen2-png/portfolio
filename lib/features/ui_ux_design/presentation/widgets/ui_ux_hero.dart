import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class UiUxHero extends StatelessWidget {
  const UiUxHero({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;
    
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final bgColors = AppColors.backgroundColors(brightness);

    return Column(
      children: [
        Text(
          'ui_ux.hero.title'.tr(),
          style: isMobile
              ? AppTypography.headlineLg(color: textColors.primaryDefault).copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                )
              : AppTypography.headline3xl(color: textColors.primaryDefault).copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: isMobile ? 0 : AppDimensions.spacingSm),
        Text(
          'ui_ux.hero.subtitle'.tr(),
          style: isMobile
              ? AppTypography.headlineSm(color: textColors.primaryDefault).copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                )
              : AppTypography.headlineMd(color: textColors.primaryDefault).copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: isMobile ? AppDimensions.spacingSm : AppDimensions.spacingMd),
        Text(
          'ui_ux.hero.description'.tr(),
          style: isMobile
              ? AppTypography.bodyLg(color: textColors.brandDisabled).copyWith(
                  fontWeight: FontWeight.w500,
                )
              : AppTypography.bodyXl(color: textColors.brandDisabled).copyWith(
                  fontWeight: FontWeight.w500,
                ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppDimensions.spacingXl),
        // The yellow line from the design
        Container(
          width: AppDimensions.spacing8xl + AppDimensions.spacingLg, // 120 + 12 = 132
          height: AppDimensions.borderWidthSm, // 2
          color: bgColors.brandSolid,
        ),
      ],
    );
  }
}
