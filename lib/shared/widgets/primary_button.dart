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
  final String? leadingIconAsset;
  final String? trailingIconAsset;
  final double? width;
  final double? minWidth;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.filled,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingIconAsset,
    this.trailingIconAsset,
    this.width,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);
    // Use brandDefault for the yellow border and background
    final brandColor = AppColors.lightTextBrandDefault; 

    Color backgroundColor;
    Color textColor;
    BoxBorder? boxBorder;

    switch (variant) {
      case ButtonVariant.filled:
        backgroundColor = brandColor;
        textColor = Colors.black; // Text is black on yellow background in design
        boxBorder = null;
        break;
      case ButtonVariant.outlined:
        backgroundColor = Colors.transparent;
        textColor = textColors.primaryDefault; // Black or white depending on theme
        boxBorder = Border.all(
          color: brandColor,
          width: 2,
        );
        break;
      case ButtonVariant.light:
        backgroundColor = brandColor.withOpacity(0.1);
        textColor = brandColor;
        boxBorder = null;
        break;
    }

    // Common Icon Properties
    final double iconSize = AppDimensions.iconSm;
    final Color iconColor = textColor; // Match icon color to text color

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          constraints: BoxConstraints(
            minWidth: minWidth ?? 0,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingXl, // Increased padding for better look
            vertical: AppDimensions.spacingLg,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: boxBorder,
          ),
          child: Row(
            mainAxisSize: (width != null || minWidth != null) ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Leading Icon
              if (leadingIconAsset != null) ...[
                Image.asset(
                  leadingIconAsset!,
                  width: iconSize,
                  height: iconSize,
                  color: iconColor,
                ),
                const SizedBox(width: 8),
              ] else if (leadingIcon != null) ...[
                Icon(
                  leadingIcon,
                  size: iconSize,
                  color: iconColor,
                ),
                const SizedBox(width: 8),
              ],
 
              // Label
              Flexible(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  softWrap: false, // Prevent wrapping to keep the shape consistent
                  overflow: TextOverflow.visible, // But allow it to take space if needed
                  style: AppTypography.bodyXl(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
 
              // Trailing Icon (Arrow)
              if (trailingIconAsset != null) ...[
                const SizedBox(width: 12),
                Image.asset(
                  trailingIconAsset!,
                  width: iconSize,
                  height: iconSize,
                  color: iconColor,
                ),
              ] else if (trailingIcon != null) ...[
                const SizedBox(width: 12),
                Icon(
                  trailingIcon,
                  size: iconSize,
                  color: iconColor,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
