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
    final borderColors = AppColors.borderColors(brightness);

    return Container(
      width: isMobile ? double.infinity : 500,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingXl,
        vertical: AppDimensions.spacingMd,
      ),
      decoration: BoxDecoration(
        color: bgColors.primarySurface,
        borderRadius: BorderRadius.circular(AppDimensions.radius2xl),
        border: Border.all(
          color: borderColors.primaryDefault,
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
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimensions.spacingMd,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? bgColors.brandSolid : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
                ),
                alignment: Alignment.center,
                child: Text(
                  tabs[index],
                  style: AppTypography.labelMd(
                    color: isSelected
                        ? Colors.black // Gold background usually takes dark text
                        : textColors.primaryDisabled,
                    fontWeight: FontWeight.w700,
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
