import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/colors/text_colors.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class HelloText extends StatelessWidget {
  final bool isWeb;
  final TextColors textColors;

  const HelloText({super.key, required this.isWeb, required this.textColors});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.light
        ? textColors.primaryDefault.withOpacity(0.7)
        : textColors.primaryDefault.withOpacity(0.8);

    return Text(
      'home.hello'.tr(),
      style: isWeb
          ? AppTypography.bodyXl(color: color, fontWeight: FontWeight.w500)
          : AppTypography.bodyLg(color: color, fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
    );
  }
}
