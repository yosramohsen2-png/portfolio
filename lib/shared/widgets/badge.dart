import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

enum BadgeSize { small, medium, large }

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
        return const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMd,
          vertical: AppDimensions.spacingXs,
        );
      case BadgeSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingLg,
          vertical: AppDimensions.spacingSm,
        );
      case BadgeSize.large:
        return const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingXl,
          vertical: AppDimensions.spacingMd,
        );
    }
  }

  TextStyle _getTextStyle(BuildContext context, TextColors textColors) {
    // Brand design shows brownish text on yellow bg
    Color color = textColors.primaryDisabled;
    
    // If hovered, maybe make text a bit more prominent
    if (_isHovered) {
      color = textColors.primaryDefault;
    }

    switch (widget.size) {
      case BadgeSize.small:
        return AppTypography.labelSm(color: color, fontWeight: FontWeight.bold);
      case BadgeSize.medium:
        return AppTypography.labelMd(color: color, fontWeight: FontWeight.bold);
      case BadgeSize.large:
        return AppTypography.bodyMd(
          color: color,
          fontWeight: FontWeight.bold,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);

    final baseColor = bgColors.brandLight;
    final hoverColor = bgColors.brandHover;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.basic, // Badges are usually not clickable unless they are tags
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: _padding,
        decoration: BoxDecoration(
          color: _isHovered ? hoverColor : baseColor,
          borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
        ),
        child: Text(
          widget.label,
          style: _getTextStyle(context, textColors),
        ),
      ),
    );
  }
}

class BadgeSecondary extends StatelessWidget {
  final String label;
  final BadgeSize size;

  const BadgeSecondary({
    super.key,
    required this.label,
    this.size = BadgeSize.large,
  });

  EdgeInsets get _padding {
    return EdgeInsets.symmetric(
      horizontal: AppDimensions.spacingXl,
      vertical: AppDimensions.spacingMd,
    );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);

    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: bgColors.primarySecondary,
        borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
      ),
      child: Text(
        label,
        style: AppTypography.bodyXl(
          color: textColors.primaryDisabled,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
