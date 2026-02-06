import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/localization/locale_cubit.dart';
import 'package:portfolio/core/theme/colors/background_colors.dart';
import 'package:portfolio/core/theme/colors/border_colors.dart';
import 'package:portfolio/shared/widgets/logo.dart';
import 'package:portfolio/shared/widgets/theme_toggle.dart';
import 'package:portfolio/shared/widgets/drawer/drawer_item.dart';
import 'package:portfolio/shared/widgets/drawer/language_switcher.dart';
import 'package:portfolio/shared/widgets/drawer/drawer_close_button.dart';

class CustomDrawer extends StatelessWidget {
  final String currentRoute;

  const CustomDrawer({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
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
              _buildHeader(context, bgColors, borderColors),
              const SizedBox(height: AppDimensions.spacingXl),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DrawerItem(
                        label: 'nav.home'.tr(),
                        route: '/',
                        isSelected: currentRoute == '/',
                        onTap: () => _navigate(context, '/'),
                      ),
                      DrawerItem(
                        label: 'nav.ui_ux_design'.tr(),
                        route: '/ui-ux-design',
                        isSelected: currentRoute == '/ui-ux-design',
                        onTap: () => _navigate(context, '/ui-ux-design'),
                      ),
                      DrawerItem(
                        label: 'nav.flutter_dev'.tr(),
                        route: '/flutter-dev',
                        isSelected: currentRoute == '/flutter-dev',
                        onTap: () => _navigate(context, '/flutter-dev'),
                      ),
                      DrawerItem(
                        label: 'nav.about'.tr(),
                        route: '/about',
                        isSelected: currentRoute == '/about',
                        onTap: () => _navigate(context, '/about'),
                      ),
                      DrawerItem(
                        label: 'nav.contact'.tr(),
                        route: '/contact',
                        isSelected: currentRoute == '/contact',
                        onTap: () => _navigate(context, '/contact'),
                      ),
                    ],
                  ),
                ),
              ),
              LanguageSwitcher(
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
          bottom: BorderSide(color: borderColors.primaryDisabled, width: 1),
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
              DrawerCloseButton(
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
