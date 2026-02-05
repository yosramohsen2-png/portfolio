import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class ValueCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const ValueCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<ValueCard> createState() => _ValueCardState();
}

class _ValueCardState extends State<ValueCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
    final textColors = AppColors.textColors(brightness);
    final iconColors = AppColors.iconColors(brightness);

    // Styling based on mockup
    // Web: primaryDisabled (50% opacity), Mobile: brandLight (100% opacity)
    final backgroundColor = isMobile ? bgColors.brandLight : bgColors.primaryDisabled;
    final borderColor = borderColors.primaryDefault;
    
    // On hover, we can slightly lighten or darken the background
    final hoverColor = isDark ? Colors.white : Colors.black;
    final effectiveBgColor = _isHovered 
        ? Color.lerp(backgroundColor, hoverColor, 0.08) 
        : backgroundColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding: EdgeInsets.all(isMobile ? AppDimensions.spacing2xl : AppDimensions.spacing3xl),
        decoration: BoxDecoration(
          color: effectiveBgColor,
          borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
          border: Border.all(
            color: borderColor,
            width: AppDimensions.borderWidthXs,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: isDark 
                        ? AppColors.darkTextBrandDefault.withValues(alpha: 0.3) 
                        : borderColor.withValues(alpha: 0.25),
                    blurRadius: AppDimensions.effect2xl,
                    spreadRadius: isDark ? 2 : 0,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon
            Icon(
              widget.icon,
              color: iconColors.primaryDefault,
              size: isMobile ? AppDimensions.iconLg : AppDimensions.iconLg, // 32 as per mockup
            ),
            SizedBox(height: isMobile ? AppDimensions.spacingXl : AppDimensions.spacing2xl),
            
            // Title
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: (isMobile ? AppTypography.headlineSm(
                color: textColors.primaryToggle, // Always dark on yellow background
                fontWeight: FontWeight.w700,
              ) : AppTypography.headlineMd(
                color: textColors.primaryToggle, // Always dark on yellow background
                fontWeight: FontWeight.w700,
              )).copyWith(height: 1.2),
            ),
            SizedBox(height: isMobile ? AppDimensions.spacingMd : AppDimensions.spacingLg),
            
            // Description
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: (isMobile ? AppTypography.bodyMd(
                color: isDark ? textColors.primaryDisabled2 : textColors.primaryDisabledCards,
                fontWeight: FontWeight.w500,
              ) : AppTypography.bodyXl(
                color: isDark ? textColors.primaryDisabled2 : textColors.brandDisabled,
                fontWeight: FontWeight.w500,
              )).copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
