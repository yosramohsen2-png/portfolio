import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/core/localization/locale_cubit.dart';
import 'package:portfolio/shared/widgets/logo.dart';
import 'package:portfolio/shared/widgets/theme_toggle.dart';

class CustomDrawer extends StatelessWidget {
  final String currentRoute;

  const CustomDrawer({
    super.key,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
    final textColors = AppColors.textColors(brightness);
    final localeState = context.watch<LocaleCubit>().state;
    final selectedLanguage = localeState.locale.languageCode;

    return Drawer(
      backgroundColor: bgColors.primaryDefault,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppDimensions.radius3xl),
          bottomRight: Radius.circular(AppDimensions.radius3xl),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Header inside Drawer
              _buildHeader(context, bgColors, borderColors),
              
              const SizedBox(height: AppDimensions.spacingXl),
              
              // Navigation Items
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _DrawerItem(
                        label: 'nav.home'.tr(),
                        route: '/home',
                        isSelected: currentRoute == '/home',
                        onTap: () => _navigate(context, '/home'),
                      ),
                      _DrawerItem(
                        label: 'nav.ui_ux_design'.tr(),
                        route: '/ui-ux-design',
                        isSelected: currentRoute == '/ui-ux-design',
                        onTap: () => _navigate(context, '/ui-ux-design'),
                      ),
                      _DrawerItem(
                        label: 'nav.flutter_dev'.tr(),
                        route: '/flutter-dev',
                        isSelected: currentRoute == '/flutter-dev',
                        onTap: () => _navigate(context, '/flutter-dev'),
                      ),
                      _DrawerItem(
                        label: 'nav.about'.tr(),
                        route: '/about',
                        isSelected: currentRoute == '/about',
                        onTap: () => _navigate(context, '/about'),
                      ),
                      _DrawerItem(
                        label: 'nav.contact'.tr(),
                        route: '/contact',
                        isSelected: currentRoute == '/contact',
                        onTap: () => _navigate(context, '/contact'),
                      ),
                    ],
                  ),
                ),
              ),

              // Language Switcher - Matches the design in User Request
              _LanguageSwitcher(
                selectedLanguage: selectedLanguage,
                onLanguageChanged: (lang) {
                  if (lang == 'en') {
                    context.read<LocaleCubit>().setEnglish();
                  } else {
                    context.read<LocaleCubit>().setGerman();
                  }
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, BackgroundColors bgColors, BorderColors borderColors) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: borderColors.primaryDisabled,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Logo(),
          Row(
            children: [
              const ThemeToggle(),
              const SizedBox(width: 8),
              _CloseButton(
                onPressed: () => Navigator.pop(context),
                bgColor: bgColors.primarySecondary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigate(BuildContext context, String route) {
    if (currentRoute == route) {
      Navigator.pop(context);
    } else {
      context.go(route);
    }
  }
}

class _DrawerItem extends StatelessWidget {
  final String label;
  final String route;
  final bool isSelected;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.label,
    required this.route,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textColors = AppColors.textColors(Theme.of(context).brightness);
    final brandColor = AppColors.lightTextBrandDefault;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? brandColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            style: AppTypography.bodyMd(
              color: isSelected ? Colors.black : textColors.brandDisabled,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageSwitcher extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  const _LanguageSwitcher({
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final brandColor = AppColors.lightTextBrandDefault;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: bgColors.primaryDefault,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: _LanguageOption(
              label: 'Deutsch',
              isSelected: selectedLanguage == 'de',
              onTap: () => onLanguageChanged('de'),
              brandColor: brandColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _LanguageOption(
              label: 'English',
              isSelected: selectedLanguage == 'en',
              onTap: () => onLanguageChanged('en'),
              brandColor: brandColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color brandColor;

  const _LanguageOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.brandColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 36,
        decoration: BoxDecoration(
          color: isSelected ? brandColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: AppTypography.bodyMd(
            color: Colors.black, // Matching design where both are black-ish
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color bgColor;

  const _CloseButton({
    required this.onPressed,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.close, size: 20),
      ),
    );
  }
}
