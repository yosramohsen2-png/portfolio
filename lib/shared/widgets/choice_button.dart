import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class ChoiceButton extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String> onOptionSelected;

  const ChoiceButton({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
    final textColors = AppColors.textColors(brightness);

    return Container(
      padding: EdgeInsets.all(AppDimensions.spacingMd),
      decoration: BoxDecoration(
        color: bgColors.primaryDefault,
        borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
        border: Border.all(
          color: borderColors.primaryDisabled,
          width: AppDimensions.borderWidthXs,
        ),
      ),
      child: Wrap(
        spacing: AppDimensions.spacingXl,
        runSpacing: AppDimensions.spacingXl,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: options.map((option) {
          final isSelected = option == selectedOption;
          
          return GestureDetector(
            onTap: () => onOptionSelected(option),
            child: Container(
              height: 36,
              padding: EdgeInsets.all(AppDimensions.spacingMd),
              decoration: BoxDecoration(
                color: isSelected 
                    ? bgColors.brandSolid
                    : bgColors.primarySecondary,
                borderRadius: BorderRadius.circular(AppDimensions.spacingXl),
              ),
              child: Center(
                child: Text(
                  option,
                  textAlign: TextAlign.center,
                  style: AppTypography.bodyMd(
                    color: isSelected
                        ? textColors.primaryToggle
                        : textColors.primaryDisabledToggle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
