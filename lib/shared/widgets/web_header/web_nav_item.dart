import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class WebNavItem extends StatefulWidget {
  final String label;
  final String route;
  final bool isSelected;
  final VoidCallback onTap;

  const WebNavItem({
    super.key,
    required this.label,
    required this.route,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<WebNavItem> createState() => _WebNavItemState();
}

class _WebNavItemState extends State<WebNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final borderColors = AppColors.borderColors(brightness);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppDimensions.spacingXs),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: widget.isSelected
                    ? AppTypography.headlineXs(
                        color: textColors.brandDefault,
                        fontWeight: FontWeight.w700,
                      )
                    : AppTypography.bodyXl(
                        color: _isHovered 
                            ? textColors.brandDefault 
                            : textColors.brandDisabled,
                        fontWeight: FontWeight.w500,
                      ),
              ),
              if (widget.isSelected) ...[
                const SizedBox(height: AppDimensions.spacingXs),
                Container(
                  height: AppDimensions.borderWidthSm,
                  width: widget.label.length * 10.0,
                  color: borderColors.primaryDefault,
                ),
              ] else ...[
                 const SizedBox(height: AppDimensions.spacingXs + AppDimensions.borderWidthSm),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
