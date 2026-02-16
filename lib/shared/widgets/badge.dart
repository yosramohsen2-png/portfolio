import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/shared/widgets/badge_size.dart';

class Badge extends StatefulWidget {
  final String label;
  final BadgeSize size;

  const Badge({
    super.key,
    required this.label,
    this.size = BadgeSize.medium,
  });

  @override
  State<Badge> createState() => _BadgeState();
}

class _BadgeState extends State<Badge> {
  bool _isHovered = false;

  EdgeInsets get _padding {
    switch (widget.size) {
      case BadgeSize.small:
        return const EdgeInsetsDirectional.symmetric(
          horizontal: AppDimensions.spacingMd,
          vertical: AppDimensions.spacingXs,
        );
      case BadgeSize.medium:
        return const EdgeInsetsDirectional.symmetric(
          horizontal: AppDimensions.spacingLg,
          vertical: AppDimensions.spacingSm,
        );
      case BadgeSize.large:
        return const EdgeInsetsDirectional.symmetric(
          horizontal: AppDimensions.spacingXl,
          vertical: AppDimensions.spacingMd,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);

    // Design System colors for Badge:
    // Default: bg = brandLight, text = textPrimaryDisabled
    // Hover:   bg = brandHover, text = textPrimaryDefault
    final Color backgroundColor = _isHovered
        ? bgColors.brandHover
        : bgColors.brandLight;

    final Color textColor = _isHovered
        ? textColors.primaryDefault
        : textColors.primaryDisabled;

    // Typography based on size
    TextStyle textStyle;
    switch (widget.size) {
      case BadgeSize.small:
        textStyle = AppTypography.labelSm(
          color: textColor,
          fontWeight: FontWeight.w400,
        );
        break;
      case BadgeSize.medium:
        textStyle = AppTypography.labelMd(
          color: textColor,
          fontWeight: FontWeight.w500,
        );
        break;
      case BadgeSize.large:
        textStyle = AppTypography.bodyMd(
          color: textColor,
          fontWeight: FontWeight.w500,
        );
        break;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: _padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
        ),
        child: Text(
          widget.label,
          style: textStyle,
        ),
      ),
    );
  }
}
