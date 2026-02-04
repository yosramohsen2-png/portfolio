import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/shared/widgets/logo.dart';
import 'package:portfolio/shared/widgets/icon_button_custom.dart';

class MobileHeader extends StatelessWidget {
  final VoidCallback onMenuTap;
  final VoidCallback onThemeToggle;

  const MobileHeader({
    super.key,
    required this.onMenuTap,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final borderColors = AppColors.borderColors(brightness);

    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingMd,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: borderColors.primaryDisabled,
            width: AppDimensions.borderWidthXs,
          ),
        ),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Logo(),
          ),
          Row(
            children: [
              IconButtonCustom(
                icon: Icons.brightness_6_outlined,
                onPressed: onThemeToggle,
                size: IconButtonSize.small,
              ),
              SizedBox(width: AppDimensions.spacingMd),
              IconButtonCustom(
                icon: Icons.menu,
                onPressed: onMenuTap,
                size: IconButtonSize.small,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
