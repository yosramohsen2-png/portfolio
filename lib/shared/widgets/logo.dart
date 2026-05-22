import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class Logo extends StatelessWidget {
  final bool showIcon;
  final double iconSize;

  const Logo({
    super.key,
    this.showIcon = true,
    this.iconSize = AppDimensions.iconMd,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final isDark = brightness == Brightness.dark;
    final logoAsset = isDark ? AppAssets.logoDark : AppAssets.logo;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showIcon) ...[
          Image.asset(
            logoAsset,
            width: iconSize,
            height: iconSize,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: AppDimensions.spacingMd),
        ],

        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Port',
                style: AppTypography.headlineXs(
                  color: textColors.primaryDefault,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'folio',
                style: AppTypography.headlineXs(
                  color: textColors.brandDefault,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
