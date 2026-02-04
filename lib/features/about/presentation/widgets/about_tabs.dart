import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class AboutTabs extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final List<String> tabs;

  const AboutTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.tabs,
  });

  @override
  State<AboutTabs> createState() => _AboutTabsState();
}

class _AboutTabsState extends State<AboutTabs> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;
    
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
    final textColors = AppColors.textColors(brightness);

    return Container(
      width: isMobile ? double.infinity : 400,
      height: 56,
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      decoration: BoxDecoration(
        color: bgColors.primaryDefault,
        borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
        border: Border.all(
          color: borderColors.primaryDisabled,
          width: AppDimensions.borderWidthXs,
        ),
      ),
      child: Row(
        children: List.generate(widget.tabs.length, (index) {
          final isSelected = widget.selectedIndex == index;
          final isHovered = _hoveredIndex == index;

          // Determine background and text color based on state
          Color itemColor;
          Color textColor;
          FontWeight fontWeight;

          if (isSelected) {
            itemColor = bgColors.brandSolid;
            textColor = textColors.primaryToggle;
            fontWeight = FontWeight.w700;
          } else if (isHovered) {
            // Hover state: light grey becomes a bit darker, or dark grey becomes a bit lighter
            if (isDark) {
              itemColor = Color.lerp(bgColors.primarySecondary, Colors.white, 0.12)!;
              textColor = textColors.primaryDefault;
            } else {
              itemColor = Color.lerp(bgColors.primarySecondary, Colors.black, 0.08)!;
              textColor = textColors.primaryDefault;
            }
            fontWeight = FontWeight.w600;
          } else {
            itemColor = bgColors.primarySecondary;
            textColor = textColors.primaryDisabledToggle;
            fontWeight = FontWeight.w500;
          }

          return Expanded(
            child: MouseRegion(
              onEnter: (_) => setState(() => _hoveredIndex = index),
              onExit: (_) => setState(() => _hoveredIndex = null),
              child: GestureDetector(
                onTap: () => widget.onTabSelected(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.symmetric(horizontal: AppDimensions.spacingXxs),
                  decoration: BoxDecoration(
                    color: itemColor,
                    borderRadius: BorderRadius.circular(AppDimensions.radius2xl),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.tabs[index],
                    style: AppTypography.labelMd(
                      color: textColor,
                      fontWeight: fontWeight,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
