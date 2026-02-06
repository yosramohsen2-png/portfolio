import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/shared/widgets/logo.dart';
import 'package:portfolio/shared/widgets/compact_language_toggle.dart';
import 'package:portfolio/shared/widgets/theme_toggle.dart';
import 'package:portfolio/shared/widgets/web_header/web_nav_item.dart';

class WebHeader extends StatelessWidget {
  final String selectedRoute;
  final ValueChanged<String> onRouteChanged;
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;
  final VoidCallback onThemeToggle;

  const WebHeader({
    super.key,
    required this.selectedRoute,
    required this.onRouteChanged,
    required this.selectedLanguage,
    required this.onLanguageChanged,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);

    return Container(
      height: 88,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing3xl,
        vertical: AppDimensions.spacingXl,
      ),
      decoration: BoxDecoration(
        color: bgColors.primaryDefault,
        border: Border(
          bottom: BorderSide(
            color: borderColors.primaryDisabled,
            width: AppDimensions.borderWidthXs,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Logo(showIcon: true),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WebNavItem(
                  label: 'nav.home'.tr(),
                  route: '/',
                  isSelected: selectedRoute == '/',
                  onTap: () => onRouteChanged('/'),
                ),
                const SizedBox(width: AppDimensions.spacing3xl),
                WebNavItem(
                  label: 'nav.ui_ux_design'.tr(),
                  route: '/ui-ux-design',
                  isSelected: selectedRoute == '/ui-ux-design',
                  onTap: () => onRouteChanged('/ui-ux-design'),
                ),
                const SizedBox(width: AppDimensions.spacing3xl),
                WebNavItem(
                  label: 'nav.flutter_dev'.tr(),
                  route: '/flutter-dev',
                  isSelected: selectedRoute == '/flutter-dev',
                  onTap: () => onRouteChanged('/flutter-dev'),
                ),
                const SizedBox(width: AppDimensions.spacing3xl),
                WebNavItem(
                  label: 'nav.about'.tr(),
                  route: '/about',
                  isSelected: selectedRoute == '/about',
                  onTap: () => onRouteChanged('/about'),
                ),
                const SizedBox(width: AppDimensions.spacing3xl),
                WebNavItem(
                  label: 'nav.contact'.tr(),
                  route: '/contact',
                  isSelected: selectedRoute == '/contact',
                  onTap: () => onRouteChanged('/contact'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CompactLanguageToggle(
                  selectedLanguage: selectedLanguage,
                  onLanguageChanged: onLanguageChanged,
                ),
                const SizedBox(width: AppDimensions.spacingXl),
                const ThemeToggle(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
