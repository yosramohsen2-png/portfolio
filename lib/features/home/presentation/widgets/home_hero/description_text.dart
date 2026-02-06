import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/colors/text_colors.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class DescriptionText extends StatelessWidget {
  final bool isWeb;
  final TextColors textColors;

  const DescriptionText({super.key, required this.isWeb, required this.textColors});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.light
        ? textColors.primaryDefault.withValues(alpha: 0.8)
        : textColors.primaryDefault.withValues(alpha: 0.9);

    return Container(
      constraints: BoxConstraints(maxWidth: isWeb ? 800 : 350),
      child: Text(
        'home.description'.tr(),
        style: isWeb
            ? AppTypography.bodyXl(color: color, fontWeight: FontWeight.w500)
            : AppTypography.bodyLg(color: color, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }
}
