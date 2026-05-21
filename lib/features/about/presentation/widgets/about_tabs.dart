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

    // Build list of tab items
    final tabItems = List.generate(widget.tabs.length, (index) {
      final isSelected = widget.selectedIndex == index;
      final isHovered = _hoveredIndex == index;

      Color itemColor;
      Color textColor;
      FontWeight fontWeight;

      if (isSelected) {
        itemColor = bgColors.brandSolid;
        textColor = textColors.primaryToggle;
        fontWeight = FontWeight.w700;
      } else if (isHovered) {
        if (isDark) {
          itemColor = Color.lerp(
            bgColors.primarySecondary,
            Colors.white,
            0.12,
          )!;
          textColor = textColors.primaryDefault;
        } else {
          itemColor = Color.lerp(
            bgColors.primarySecondary,
            Colors.black,
            0.08,
          )!;
          textColor = textColors.primaryDefault;
        }
        fontWeight = FontWeight.w600;
      } else {
        itemColor = bgColors.primarySecondary;
        textColor = textColors.primaryDisabledToggle;
        fontWeight = FontWeight.w500;
      }

      return MouseRegion(
        onEnter: (_) => setState(() => _hoveredIndex = index),
        onExit: (_) => setState(() => _hoveredIndex = null),
        child: GestureDetector(
          onTap: () => widget.onTabSelected(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacingXxs,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacingXl,
              vertical: AppDimensions.spacingMd,
            ),
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
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
          ),
        ),
      );
    });

    final inner = Container(
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
      child: isMobile
          // Mobile: scrollable horizontally so tabs never overflow
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(children: tabItems),
            )
          // Desktop / Tablet: fixed-width row, each tab expands equally
          : Row(children: tabItems.map((t) => Expanded(child: t)).toList()),
    );

    // On mobile, let the container take full width; on desktop cap it
    if (isMobile) {
      return inner;
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 400, maxWidth: 640),
      child: inner,
    );
  }
}
