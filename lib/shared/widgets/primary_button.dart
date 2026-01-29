import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

enum ButtonVariant { filled, outlined, light }

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double? width;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.filled,
    this.leadingIcon,
    this.trailingIcon,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
    final iconColors = AppColors.iconColors(brightness);

    Color backgroundColor;
    Color textColor;
    Border? border;

    switch (variant) {
      case ButtonVariant.filled:
        backgroundColor = bgColors.brandSolid;
        textColor = textColors.primaryToggle;
        border = null;
        break;
      case ButtonVariant.outlined:
        backgroundColor = Colors.transparent;
        textColor = textColors.primaryDefault;
        border = Border.all(
          color: borderColors.primaryDefault,
          width: 2,
        );
        break;
      case ButtonVariant.light:
        backgroundColor = bgColors.brandLight;
        textColor = textColors.primaryToggle;
        border = null;
        break;
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMd,
          vertical: AppDimensions.spacingLg,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
          border: border,
        ),
        child: Row(
          mainAxisSize: width == null ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingIcon != null) ...[
              Icon(
                leadingIcon,
                size: AppDimensions.iconSm,
                color: iconColors.primaryDefaultChange,
              ),
              SizedBox(width: AppDimensions.spacingLg),
            ],
            Flexible(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: AppTypography.bodyXl(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (trailingIcon != null) ...[
              SizedBox(width: AppDimensions.spacingXl),
              Icon(
                trailingIcon,
                size: AppDimensions.iconSm,
                color: iconColors.primaryDefaultChange,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
