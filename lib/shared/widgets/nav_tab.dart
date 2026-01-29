import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class NavTab extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavTab({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final borderColors = AppColors.borderColors(brightness);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.spacingXs),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: isActive
                  ? AppTypography.headlineXs(
                      color: textColors.brandDefault,
                      fontWeight: FontWeight.w700,
                    )
                  : AppTypography.bodyXl(
                      color: textColors.brandDisabled,
                      fontWeight: FontWeight.w500,
                    ),
            ),
            if (isActive) ...[
              SizedBox(height: AppDimensions.spacingXs),
              Container(
                height: 2,
                decoration: BoxDecoration(
                  color: borderColors.primaryDefault,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class NavTabSmall extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavTabSmall({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.spacingXs),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: AppTypography.bodyXl(
            color: isActive ? textColors.brandDefault : textColors.brandDisabled,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
