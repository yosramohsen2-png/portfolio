import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class ExperienceCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;
    
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
    final textColors = AppColors.textColors(brightness);
    final iconColors = AppColors.iconColors(brightness);

    // Following ServiceCard logic for colors
    final backgroundColor = _isHovered ? bgColors.primarySecondary : bgColors.primaryDefault;
    final borderColor = isDark ? borderColors.primaryCards : borderColors.primaryDisabled;
    final iconColor = iconColors.primaryHover;
    final descriptionColor = textColors.primaryDisabled2;

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? AppDimensions.spacingLg : AppDimensions.spacing2xl,
          vertical: isMobile ? AppDimensions.spacingXl : AppDimensions.spacing2xl,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
          border: Border.all(
            color: borderColor,
            width: AppDimensions.borderWidthXs,
          ),
          boxShadow: (!isDark && _isHovered)
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: AppDimensions.effect2xl,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            // Icon with circular background
            Container(
              height: isMobile ? AppDimensions.spacing4xl : AppDimensions.spacing5xl + AppDimensions.spacingMd,
              width: isMobile ? AppDimensions.spacing4xl : AppDimensions.spacing5xl + AppDimensions.spacingMd,
              decoration: BoxDecoration(
                color: bgColors.brandLight.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(
                widget.icon,
                color: iconColor,
                size: isMobile ? AppDimensions.iconSm : AppDimensions.iconMd,
              ),
            ),

            SizedBox(height: isMobile ? AppDimensions.spacingMd : AppDimensions.spacingXl),
            Text(
              widget.title,
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
              style: (isMobile ? AppTypography.headlineXs(
                color: textColors.primaryDefault,
              ) : AppTypography.headlineSm(
                color: textColors.primaryDefault,
              )).copyWith(fontWeight: FontWeight.w800, height: 1.2),
            ),
            SizedBox(height: isMobile ? AppDimensions.spacingXs : AppDimensions.spacingLg),
            Text(
              widget.description,
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
              style: (isMobile ? AppTypography.bodySm(
                color: descriptionColor,
              ) : AppTypography.bodyMd(
                color: descriptionColor,
              )).copyWith(fontWeight: FontWeight.w500, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
