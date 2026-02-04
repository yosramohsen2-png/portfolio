import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';

class UiUxDesignPage extends StatelessWidget {
  const UiUxDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textColors = AppColors.textColors(Theme.of(context).brightness);

    return PageShell(
      currentRoute: '/ui-ux-design',
      body: Column(
        children: [
          Text(
            'ui_ux.title'.tr(),
            style: AppTypography.headlineLg(color: textColors.primaryDefault),
          ),
          const SizedBox(height: AppDimensions.spacingXl),
          // Waiting for user's content...
        ],
      ),
    );
  }
}
