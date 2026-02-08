import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';

class ContactHeader extends StatelessWidget {
  const ContactHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;
    final theme = Theme.of(context);
    final textColors = AppColors.textColors(theme.brightness);

    return Column(
      children: [
        Text(
          context.tr('contact.title'),
          style: (isMobile 
            ? AppTypography.headlineMd(color: textColors.primaryDefault)
            : AppTypography.headline3xl(color: textColors.primaryDefault))
            .copyWith(
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(
          context.tr('contact.description'),
          style: (isMobile
            ? AppTypography.bodyMd(color: textColors.primaryDisabled2)
            : AppTypography.bodyXl(color: textColors.primaryDisabled2))
            .copyWith(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
