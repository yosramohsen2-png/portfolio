import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/colors/text_colors.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class NameText extends StatelessWidget {
  final bool isWeb;
  final TextColors textColors;

  const NameText({super.key, required this.isWeb, required this.textColors});

  @override
  Widget build(BuildContext context) {
    return Text(
      'home.name'.tr(),
      style: isWeb
          ? AppTypography.headline3xl(color: textColors.primaryDefault, fontWeight: FontWeight.w700)
          : AppTypography.headlineLg(color: textColors.primaryDefault, fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    );
  }
}
