import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/theme_cubit.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Watch ThemeCubit to rebuild on state change
    final isDarkState = context.watch<ThemeCubit>().state.isDarkMode;
    final String iconPath = isDarkState ? AppAssets.light : AppAssets.dark;

    final brightness = Theme.of(context).brightness;
    final isDarkTheme = brightness == Brightness.dark;
    final bgColors = AppColors.backgroundColors(brightness);

    Color backgroundColor;
    if (_isHovered) {
      backgroundColor = isDarkTheme
          ? Color.lerp(bgColors.primarySecondary, Colors.white, 0.12)!
          : Color.lerp(bgColors.primarySecondary, Colors.black, 0.08)!;
    } else {
      backgroundColor = bgColors.primarySecondary;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.read<ThemeCubit>().toggleTheme();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: AppDimensions.spacing5xl,
          height: AppDimensions.spacing5xl,
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
          ),
          child: Center(
            child: Image.asset(
              iconPath,
              width: AppDimensions.iconSm,
              height: AppDimensions.iconSm,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
