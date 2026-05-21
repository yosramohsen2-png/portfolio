import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/features/home/presentation/widgets/home_hero_section.dart';
import 'package:portfolio/features/reviews/presentation/sections/reviews_section.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;

    return PageShell(
      currentRoute: '/',
      body: Column(
        children: [
          SizedBox(height: isMobile ? AppDimensions.spacing5xl : AppDimensions.spacing7xl),
          HomeHeroSection(
            isWeb: !isMobile,
            onViewUiUx: () => context.go('/ui-ux-design'),
            onViewFlutter: () => context.go('/flutter-dev'),
          ),
          const SizedBox(height: AppDimensions.spacing7xl),
          const ReviewsSection(),
          const SizedBox(height: AppDimensions.spacing7xl),
        ],
      ),
    );
  }
}
