import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/shared/widgets/logo.dart';
import 'package:portfolio/shared/widgets/compact_language_toggle.dart';
import 'package:portfolio/shared/widgets/icon_button_custom.dart';
import 'package:portfolio/shared/widgets/theme_toggle.dart';

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
      height: 88, // 24px padding top/bottom + 40px content approx
      padding: EdgeInsets.symmetric(
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
          // 1. Logo Section
          Expanded(
            child: Row(
              children: [
                const Logo(showIcon: true),
              ],
            ),
          ),

          // 2. Navigation Links Section
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _WebNavItem(
                  label: 'nav.home'.tr(),
                  route: '/',
                  isSelected: selectedRoute == '/',
                  onTap: () => onRouteChanged('/'),
                ),
                SizedBox(width: AppDimensions.spacing5xl),
                _WebNavItem(
                  label: 'nav.ui_ux_design'.tr(),
                  route: '/ui-ux-design',
                  isSelected: selectedRoute == '/ui-ux-design',
                  onTap: () => onRouteChanged('/ui-ux-design'),
                ),
                SizedBox(width: AppDimensions.spacing5xl),
                _WebNavItem(
                  label: 'nav.flutter_dev'.tr(),
                  route: '/flutter-dev',
                  isSelected: selectedRoute == '/flutter-dev',
                  onTap: () => onRouteChanged('/flutter-dev'),
                ),
                SizedBox(width: AppDimensions.spacing5xl),
                _WebNavItem(
                  label: 'nav.about'.tr(),
                  route: '/about',
                  isSelected: selectedRoute == '/about',
                  onTap: () => onRouteChanged('/about'),
                ),
                SizedBox(width: AppDimensions.spacing5xl),
                _WebNavItem(
                  label: 'nav.contact'.tr(),
                  route: '/contact',
                  isSelected: selectedRoute == '/contact',
                  onTap: () => onRouteChanged('/contact'),
                ),
              ],
            ),
          ),

          // 3. Actions Section
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CompactLanguageToggle(
                  selectedLanguage: selectedLanguage,
                  onLanguageChanged: onLanguageChanged,
                ),
                SizedBox(width: AppDimensions.spacingXl),
                const ThemeToggle(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WebNavItem extends StatefulWidget {
  final String label;
  final String route;
  final bool isSelected;
  final VoidCallback onTap;

  const _WebNavItem({
    required this.label,
    required this.route,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_WebNavItem> createState() => _WebNavItemState();
}

class _WebNavItemState extends State<_WebNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final borderColors = AppColors.borderColors(brightness);

    // final isSelectedOrHovered = widget.isSelected || _isHovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: AppDimensions.spacingXs),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: widget.isSelected
                    ? AppTypography.headlineXs(
                        color: textColors.brandDefault,
                        fontWeight: FontWeight.w700,
                      )
                    : AppTypography.bodyXl(
                        color: _isHovered 
                            ? textColors.brandDefault 
                            : textColors.brandDisabled,
                        fontWeight: FontWeight.w500,
                      ),
              ),
              // Underline for selected state
              if (widget.isSelected) ...[
                SizedBox(height: AppDimensions.spacingXs),
                Container(
                  height: AppDimensions.borderWidthSm,
                  width: widget.label.length * 10.0, // Approximation or full width
                  color: borderColors.primaryDefault, // Brand color (Yellow)
                ),
              ] else ...[
                 // Invisible spacer to prevent layout shift if needed, or just nothing
                 // Design shows underline specifically for selected.
                 // To keep height consistent implies we might need a spacer or handle alignment.
                 SizedBox(height: AppDimensions.spacingXs + AppDimensions.borderWidthSm), // 4px gap + 2px line
              ],
            ],
          ),
        ),
      ),
    );
  }
}
