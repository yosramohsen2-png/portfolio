import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class UiUxHero extends StatelessWidget {
  final bool isWeb;
  const UiUxHero({super.key, required this.isWeb});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final bgColors = AppColors.backgroundColors(brightness);

    return Column(
      children: [
        // Text(
        //   'ui_ux.title'.tr(),
        //   style: AppTypography.headline3xl(color: textColors.primaryDefault)
        //       .copyWith(fontWeight: FontWeight.w700, fontSize: isWeb ? 82 : 48),
        //   textAlign: TextAlign.center,
        // ),
        // if (isWeb) const SizedBox(height: 8),
        // Text(
        //   'ui_ux.subtitle'.tr(),
        //   style: AppTypography.headlineXl(color: bgColors.brandSolid)
        //       .copyWith(fontWeight: FontWeight.w700, fontSize: isWeb ? 36 : 30),
        //   textAlign: TextAlign.center,
        // ),
        // const SizedBox(height: 16),
        // Text(
        //   'ui_ux.description'.tr(),
        //   style: AppTypography.bodyLg(color: textColors.brandDisabled)
        //       .copyWith(fontWeight: FontWeight.w500, fontSize: isWeb ? 20 : 18),
        //   textAlign: TextAlign.center,
        // ),
        const SizedBox(height: 24),
        // The yellow line from the design
        Container(
          width: 134,
          height: 2,
          color: bgColors.brandSolid,
        ),
      ],
    );
  }
}
