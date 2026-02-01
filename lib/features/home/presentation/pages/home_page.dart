import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/features/home/presentation/widgets/home_content.dart';
import 'package:portfolio/shared/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWeb = constraints.maxWidth > 900;
        
        return Scaffold(
          backgroundColor: bgColors.primaryDefault,
          drawer: isWeb ? null : const CustomDrawer(currentRoute: '/home'),
          body: HomeContent(isWeb: isWeb, constraints: constraints),
        );
      },
    );
  }
}
