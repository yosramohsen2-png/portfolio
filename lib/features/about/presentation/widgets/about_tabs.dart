import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class AboutTabs extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;
    final brightness = Theme.of(context).brightness;
    
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);

    return Container(
      width: isMobile ? double.infinity : 400,
      height: 48,
      padding: const EdgeInsets.all(AppDimensions.spacingXs), // 4px based on design system
      decoration: BoxDecoration(
        color: bgColors.primarySecondary,
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: isSelected ? bgColors.brandSolid : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                ),
                alignment: Alignment.center,
                child: Text(
                  tabs[index],
                  style: AppTypography.labelMd(
                    color: isSelected
                        ? textColors.primaryToggle // Design system color for text on brand background
                        : textColors.primaryDisabled2, // Design system color for inactive elements
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
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
