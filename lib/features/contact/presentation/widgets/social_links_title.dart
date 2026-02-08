import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class SocialLinksTitle extends StatelessWidget {
  const SocialLinksTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final textColors = AppColors.textColors(Theme.of(context).brightness);
    
    return Text(
      context.tr('contact.social_title'),
      style: AppTypography.bodyMd(color: textColors.primaryDisabled2)
          .copyWith(fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
    );
  }
}
