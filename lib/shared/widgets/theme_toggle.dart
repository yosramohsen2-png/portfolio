import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/shared/theme_cubit.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch ThemeCubit to rebuild on state change
    final isDark = context.watch<ThemeCubit>().state.brightness == Brightness.dark;
    
    // Determine which icon and assets to use
    // If Dark -> Show Light Icon (to switch to light) or Show Dark Icon (indicating state)?
    // Usually "Mode Switcher" shows the target mode or current mode.
    // Based on "statedark" and "statelight" in HTML, it might represent the *current* state.
    // However, for a single button toggle, highlighting the *result* or *action* is common.
    // Let's assume we show the icon of the mode we are *in* or *going to*?
    // Let's try standard behavior: Button shows the *opposite* icon to indicates "Switch to X".
    // Light Mode -> Show Moon (Dark)
    // Dark Mode -> Show Sun (Light)
    
    // Assets from the user request
    final String iconPath = isDark ? AppAssets.light2 : AppAssets.dark;

    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);

    return GestureDetector(
      onTap: () {
        context.read<ThemeCubit>().toggleTheme();
      },
      child: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColors.primarySecondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
             // Apply color if needed, or use original image colors. 
             // Icons like these often have their own colors (Yellow sun, etc).
             // If they are monochrome, we might want color: AppColors.iconColors(brightness).primaryDefault.
             // But "light (2).png" and "dark.png" suggest pre-colored or specific assets.
             // I will leave them as original images unless they look wrong.
          ),
        ),
      ),
    );
  }
}
