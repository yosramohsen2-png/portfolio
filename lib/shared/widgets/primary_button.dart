import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

enum ButtonVariant { filled, outlined, light }

class PrimaryButton extends StatefulWidget {
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
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final brandColor = AppColors.lightTextBrandDefault;

    // Determine the active variant based on hover
    ButtonVariant activeVariant = widget.variant;
    if (_isHovered) {
      if (widget.variant == ButtonVariant.filled) {
        activeVariant = ButtonVariant.outlined;
      } else if (widget.variant == ButtonVariant.outlined) {
        activeVariant = ButtonVariant.filled;
      }
    }

    Color backgroundColor;
    Color textColor;
    BoxBorder? boxBorder;

    switch (activeVariant) {
      case ButtonVariant.filled:
        backgroundColor = brandColor;
        textColor = Colors.black;
        boxBorder = Border.all(color: brandColor, width: 2); // Border exists but matches background
        break;
      case ButtonVariant.outlined:
        backgroundColor = Colors.transparent;
        textColor = brightness == Brightness.light ? Colors.black : Colors.white;
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

    final double iconSize = AppDimensions.iconSm;
    final Color iconColor = textColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          constraints: BoxConstraints(
            minWidth: widget.minWidth ?? 0,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingXl,
            vertical: AppDimensions.spacingLg,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: boxBorder,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.leadingIconAsset != null) ...[
                Image.asset(
                  widget.leadingIconAsset!,
                  width: iconSize,
                  height: iconSize,
                  color: iconColor,
                ),
                const SizedBox(width: 8),
              ] else if (widget.leadingIcon != null) ...[
                Icon(
                  widget.leadingIcon,
                  size: iconSize,
                  color: iconColor,
                ),
                const SizedBox(width: 8),
              ],
 
              Text(
                widget.label,
                textAlign: TextAlign.center,
                style: AppTypography.bodyXl(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
 
              if (widget.trailingIconAsset != null) ...[
                const SizedBox(width: 12),
                Image.asset(
                  widget.trailingIconAsset!,
                  width: iconSize,
                  height: iconSize,
                  color: iconColor,
                ),
              ] else if (widget.trailingIcon != null) ...[
                const SizedBox(width: 12),
                Icon(
                  widget.trailingIcon,
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
