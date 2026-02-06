import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/features/home/presentation/widgets/home_hero_section.dart';
import 'package:portfolio/features/home/presentation/widgets/services_section.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return PageShell(
      currentRoute: '/',
      body: Column(
        children: [
          HomeHeroSection(
            isWeb: width > AppDimensions.breakpointTablet,
            onViewUiUx: () {},
            onViewFlutter: () {},
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _getHorizontalPadding(width),
              vertical: AppDimensions.spacing10xl,
            ),
            child: const ServicesSection(),
          ),
        ],
      ),
    );
  }

  double _getHorizontalPadding(double width) {
    if (width > AppDimensions.breakpointDesktop) return width * 0.15;
    if (width >= AppDimensions.breakpointTablet) return AppDimensions.spacing6xl;
    return AppDimensions.spacingXl;
  }
}
