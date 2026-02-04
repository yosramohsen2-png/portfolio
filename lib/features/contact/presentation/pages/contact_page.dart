import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textColors = AppColors.textColors(Theme.of(context).brightness);

    return PageShell(
      currentRoute: '/contact',
      body: Column(
        children: [
          Text(
            'contact.title'.tr(),
            style: AppTypography.headlineLg(color: textColors.primaryDefault),
          ),
          const SizedBox(height: AppDimensions.spacingXl),
          // Waiting for user's content...
        ],
      ),
    );
  }
}
