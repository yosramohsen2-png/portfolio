import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/shared/widgets/logo.dart';
import 'package:portfolio/shared/widgets/icon_button_custom.dart';
import 'package:portfolio/shared/widgets/nav_menu_item.dart';
import 'package:portfolio/shared/widgets/language_toggle.dart';

class MobileNavDrawer extends StatelessWidget {
  final String selectedRoute;
  final String selectedLanguage;
  final ValueChanged<String> onRouteChanged;
  final ValueChanged<String> onLanguageChanged;
  final VoidCallback onThemeToggle;

  const MobileNavDrawer({
    super.key,
    required this.selectedRoute,
    required this.selectedLanguage,
    required this.onRouteChanged,
    required this.onLanguageChanged,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);

    return Container(
      width: 359,
      decoration: BoxDecoration(
        color: bgColors.primaryDefault,
        border: Border(
          left: BorderSide(color: borderColors.primaryDisabled, width: AppDimensions.borderWidthXs),
          right: BorderSide(color: borderColors.primaryDisabled, width: AppDimensions.borderWidthXs),
          bottom: BorderSide(color: borderColors.primaryDisabled, width: AppDimensions.borderWidthXs),
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppDimensions.radius3xl),
          bottomRight: Radius.circular(AppDimensions.radius3xl),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            height: 64,
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.spacingMd,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: borderColors.primaryDisabled,
                  width: AppDimensions.borderWidthXs,
                ),
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Logo(),
                ),
                Row(
                  children: [
                    IconButtonCustom(
                      icon: Icons.brightness_6_outlined,
                      onPressed: onThemeToggle,
                      size: IconButtonSize.small,
                    ),
                    SizedBox(width: AppDimensions.spacingMd),
                    IconButtonCustom(
                      icon: Icons.close,
                      onPressed: () => Navigator.of(context).pop(),
                      size: IconButtonSize.small,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Menu Items
          Padding(
            padding: EdgeInsets.all(AppDimensions.spacingMd),
            child: Column(
              children: [
                NavMenuItem(
                  label: 'Home',
                  isSelected: selectedRoute == '/home',
                  onTap: () => onRouteChanged('/home'),
                ),
                SizedBox(height: AppDimensions.spacingXl),
                NavMenuItem(
                  label: 'UI/UX Design',
                  isSelected: selectedRoute == '/ui-ux',
                  onTap: () => onRouteChanged('/ui-ux'),
                ),
                SizedBox(height: AppDimensions.spacingXl),
                NavMenuItem(
                  label: 'Flutter DEV',
                  isSelected: selectedRoute == '/flutter',
                  onTap: () => onRouteChanged('/flutter'),
                ),
                SizedBox(height: AppDimensions.spacingXl),
                NavMenuItem(
                  label: 'About',
                  isSelected: selectedRoute == '/about',
                  onTap: () => onRouteChanged('/about'),
                ),
                SizedBox(height: AppDimensions.spacingXl),
                NavMenuItem(
                  label: 'Contact',
                  isSelected: selectedRoute == '/contact',
                  onTap: () => onRouteChanged('/contact'),
                ),
                SizedBox(height: AppDimensions.spacingXl),

                // Language Toggle
                Container(
                  padding: EdgeInsets.all(AppDimensions.spacingXs),
                  decoration: BoxDecoration(
                    color: bgColors.primaryDefault,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                  ),
                  child: LanguageToggle(
                    selectedLanguage: selectedLanguage,
                    onLanguageChanged: onLanguageChanged,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
