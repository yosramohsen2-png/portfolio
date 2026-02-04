import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class ChoiceButton extends StatefulWidget {
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
  State<ChoiceButton> createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  String? _hoveredOption;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
    final textColors = AppColors.textColors(brightness);

    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
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
        children: widget.options.map((option) {
          final isSelected = option == widget.selectedOption;
          final isHovered = _hoveredOption == option;
          
          Color itemColor;
          Color textColor;
          FontWeight fontWeight;

          if (isSelected) {
            itemColor = bgColors.brandSolid;
            textColor = textColors.primaryToggle;
            fontWeight = FontWeight.w700;
          } else if (isHovered) {
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

          return MouseRegion(
            onEnter: (_) => setState(() => _hoveredOption = option),
            onExit: (_) => setState(() => _hoveredOption = null),
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => widget.onOptionSelected(option),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacingXl),
                decoration: BoxDecoration(
                  color: itemColor,
                  borderRadius: BorderRadius.circular(AppDimensions.spacingXl),
                ),
                child: Center(
                  child: Text(
                    option,
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyMd(
                      color: textColor,
                      fontWeight: fontWeight,
                    ),
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
