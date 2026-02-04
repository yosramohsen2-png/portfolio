import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';

enum IconButtonSize { small, medium, large }

class IconButtonCustom extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final IconButtonSize size;
  final bool isHighlighted;

  const IconButtonCustom({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = IconButtonSize.medium,
    this.isHighlighted = false,
  });

  double get _containerSize {
    switch (size) {
      case IconButtonSize.small:
        return AppDimensions.spacing5xl;
      case IconButtonSize.medium:
        return AppDimensions.spacing6xl;
      case IconButtonSize.large:
        return AppDimensions.spacing6xl;
    }
  }

  double get _iconSize {
    switch (size) {
      case IconButtonSize.small:
        return AppDimensions.iconSm;
      case IconButtonSize.medium:
        return AppDimensions.iconSm;
      case IconButtonSize.large:
        return AppDimensions.iconSm;
    }
  }

  double get _borderRadius {
    switch (size) {
      case IconButtonSize.small:
        return AppDimensions.radiusLg;
      case IconButtonSize.medium:
        return AppDimensions.radiusFull;
      case IconButtonSize.large:
        return AppDimensions.radiusFull;
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final iconColors = AppColors.iconColors(brightness);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: _containerSize,
        height: _containerSize,
        decoration: BoxDecoration(
          color: isHighlighted
              ? bgColors.brandLight
              : bgColors.primarySecondary,
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Center(
          child: Icon(
            icon,
            size: _iconSize,
            color: iconColors.primaryDefault,
          ),
        ),
      ),
    );
  }
}
