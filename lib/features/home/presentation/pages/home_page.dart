import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/features/home/presentation/widgets/home_background.dart';
import 'package:portfolio/features/home/presentation/widgets/home_hero_section.dart';
import 'package:portfolio/features/home/presentation/widgets/mobile_header.dart';
import 'package:portfolio/features/home/presentation/widgets/home_content.dart';
import 'package:portfolio/shared/widgets/web_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);

    return Scaffold(
      backgroundColor: bgColors.primaryDefault,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWeb = constraints.maxWidth > 900;
          return HomeContent(isWeb: isWeb, constraints: constraints);
        },
      ),
    );
  }
}
