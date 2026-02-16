import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class FlutterDevHero extends StatelessWidget {
  const FlutterDevHero({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final bgColors = AppColors.backgroundColors(brightness);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;


    return Column(
      children: [
        // "Flutter" Title
        Text(
          'flutter_dev.title'.tr(),
          style: isMobile 
              ? AppTypography.headlineXl(
                  color: textColors.primaryDefault,
                  fontWeight: FontWeight.w900,
                )
              : AppTypography.headline3xl(
                  color: textColors.primaryDefault,
                  fontWeight: FontWeight.w900,
                ),
          textAlign: TextAlign.center,
        ),
        
        // "Development" Subtitle
        Text(
          'flutter_dev.subtitle'.tr(),
          style: isMobile
              ? AppTypography.headlineMd(
                  color: bgColors.brandSolid,
                  fontWeight: FontWeight.w700,
                )
              : AppTypography.headlineLg(
                  color: bgColors.brandSolid,
                  fontWeight: FontWeight.w700,
                ),
          textAlign: TextAlign.center,
        ),
        
        SizedBox(height: AppDimensions.spacingXl),
        
        // Decorative Line
        Container(
          width: AppDimensions.spacing8xl,
          height: AppDimensions.spacingXs,
          decoration: BoxDecoration(
            color: bgColors.brandSolid,
            borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
          ),
        ),

        SizedBox(height: AppDimensions.spacing3xl),
        
        // Description
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: AppDimensions.breakpointTablet),
          child: Text(
            'flutter_dev.description'.tr(),
            style: AppTypography.bodyLg(
              color: textColors.primaryDisabled,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
