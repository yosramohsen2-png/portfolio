import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

enum ServiceCardSize { small, large }
enum ServiceCardState { normal, hover, selected, active }

class ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final ServiceCardSize size;
  final bool isSelected;
  final VoidCallback? onTap;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.size = ServiceCardSize.large,
    this.isSelected = false,
    this.onTap,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  ServiceCardState get _currentState {
    if (widget.isSelected) return ServiceCardState.selected;
    if (_isHovered) return ServiceCardState.hover;
    return ServiceCardState.normal;
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
    final textColors = AppColors.textColors(brightness);
    final iconColors = AppColors.iconColors(brightness);

    // Determine colors based on state
    Color backgroundColor;
    Color borderColor;
    Color iconColor;
    Color titleColor;
    final descriptionColor = textColors.brandDisabled;

    switch (_currentState) {
      case ServiceCardState.normal:
        backgroundColor = bgColors.primaryDefault;
        borderColor = borderColors.primaryDisabled;
        iconColor = iconColors.primaryHover;
        titleColor = textColors.primaryDefault;
        break;
      case ServiceCardState.hover:
        backgroundColor = bgColors.primarySecondary;
        borderColor = borderColors.primaryDisabled;
        iconColor = iconColors.primaryHover;
        titleColor = textColors.primaryDefault;
        break;
      case ServiceCardState.selected:
        backgroundColor = bgColors.primaryDisabled;
        borderColor = borderColors.primaryDefault;
        iconColor = iconColors.primaryHover;
        titleColor = textColors.primaryDefault;
        break;
      case ServiceCardState.active:
        backgroundColor = bgColors.brandLight;
        borderColor = borderColors.primaryDefault;
        iconColor = iconColors.primaryDefault;
        titleColor = textColors.primaryDefault;
        break;
    }

    // Determine alignment based on state
    final alignment = widget.isSelected
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
    final textAlign = widget.isSelected ? TextAlign.center : TextAlign.start;

    // Determine text styles based on size
    final titleStyle = widget.size == ServiceCardSize.large
        ? AppTypography.headlineMd(
            color: titleColor,
            fontWeight: FontWeight.w700,
          )
        : AppTypography.headlineSm(
            color: titleColor,
            fontWeight: FontWeight.w700,
          );

    final descriptionStyle = widget.size == ServiceCardSize.large
        ? AppTypography.bodyXl(
            color: descriptionColor,
            fontWeight: FontWeight.w500,
          )
        : AppTypography.bodyMd(
            color: descriptionColor,
            fontWeight: FontWeight.w500,
          );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(AppDimensions.spacingXl),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
            border: Border.all(
              color: borderColor,
              width: AppDimensions.borderWidthXs,
            ),
          ),
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              // Icon
              SizedBox(
                height: AppDimensions.iconLg,
                child: Icon(
                  widget.icon,
                  size: AppDimensions.iconLg,
                  color: iconColor,
                ),
              ),

              SizedBox(height: AppDimensions.spacing3xl),

              // Title
              Text(
                widget.title,
                textAlign: textAlign,
                style: titleStyle,
              ),
              SizedBox(height: AppDimensions.spacing3xl),

              // Description
              Text(
                widget.description,
                textAlign: textAlign,
                style: descriptionStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
