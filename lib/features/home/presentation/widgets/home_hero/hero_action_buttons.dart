import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/features/home/presentation/widgets/home_hero/ui_ux_button.dart';
import 'package:portfolio/features/home/presentation/widgets/home_hero/flutter_button.dart';

class HeroActionButtons extends StatelessWidget {
  final bool isWeb;
  final VoidCallback onViewUiUx;
  final VoidCallback onViewFlutter;

  const HeroActionButtons({
    super.key,
    required this.isWeb,
    required this.onViewUiUx,
    required this.onViewFlutter,
  });

  @override
  Widget build(BuildContext context) {
    if (isWeb) {
      return Wrap(
        spacing: AppDimensions.spacing3xl,
        runSpacing: AppDimensions.spacing2xl,
        alignment: WrapAlignment.center,
        children: [
          UiUxButton(onPressed: onViewUiUx),
          FlutterButton(onPressed: onViewFlutter),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UiUxButton(onPressed: onViewUiUx),
          const SizedBox(height: AppDimensions.spacingXl),
          FlutterButton(onPressed: onViewFlutter),
        ],
      );
    }
  }
}
