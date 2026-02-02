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
    final borderColors = AppColors.borderColors(brightness);
    final textColors = AppColors.textColors(brightness);

    return Container(
      width: isMobile ? double.infinity : 400,
      height: 56, // Slightly taller for better touch target and spacing
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      decoration: BoxDecoration(
        color: bgColors.primaryDefault,
        borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
        border: Border.all(
          color: borderColors.primaryDisabled,
          width: 1,
        ),
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
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: isSelected ? bgColors.brandSolid : bgColors.primarySecondary,
                  borderRadius: BorderRadius.circular(AppDimensions.radius2xl),
                ),
                alignment: Alignment.center,
                child: Text(
                  tabs[index],
                  style: AppTypography.labelMd(
                    color: isSelected
                        ? textColors.primaryToggle 
                        : textColors.primaryDisabledToggle,
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
