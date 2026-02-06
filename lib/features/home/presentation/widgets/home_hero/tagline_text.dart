import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/colors/text_colors.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class TaglineText extends StatelessWidget {
  final bool isWeb;
  final TextColors textColors;

  const TaglineText({super.key, required this.isWeb, required this.textColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Text(
        'home.tagline'.tr(),
        style: isWeb
            ? AppTypography.headlineMd(color: textColors.brandDefault, fontWeight: FontWeight.w700)
            : AppTypography.headlineSm(color: textColors.brandDefault, fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
      ),
    );
  }
}
