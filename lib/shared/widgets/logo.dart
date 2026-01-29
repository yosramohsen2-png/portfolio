import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);

    return RichText(
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
    );
  }
}
