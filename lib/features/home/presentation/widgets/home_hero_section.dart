import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/features/home/presentation/widgets/home_hero/hello_text.dart';
import 'package:portfolio/features/home/presentation/widgets/home_hero/name_text.dart';
import 'package:portfolio/features/home/presentation/widgets/home_hero/tagline_text.dart';
import 'package:portfolio/features/home/presentation/widgets/home_hero/description_text.dart';
import 'package:portfolio/features/home/presentation/widgets/home_hero/hero_action_buttons.dart';

/// Hero Section for Home Page
class HomeHeroSection extends StatelessWidget {
  final bool isWeb;
  final VoidCallback onViewUiUx;
  final VoidCallback onViewFlutter;

  const HomeHeroSection({
    super.key,
    this.isWeb = false,
    required this.onViewUiUx,
    required this.onViewFlutter,
  });

  @override
  Widget build(BuildContext context) {
    final textColors = AppColors.textColors(Theme.of(context).brightness);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadeInDown(
          from: 50,
          duration: const Duration(milliseconds: 1000),
          child: HelloText(isWeb: isWeb, textColors: textColors),
        ),
        SizedBox(height: isWeb ? AppDimensions.spacing3xl : AppDimensions.spacingXl),

        FadeInDown(
          from: 80,
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 1000),
          child: NameText(isWeb: isWeb, textColors: textColors),
        ),
        SizedBox(height: isWeb ? AppDimensions.spacing3xl : AppDimensions.spacingXl),

        FadeIn(
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 1500),
          child: TaglineText(isWeb: isWeb, textColors: textColors),
        ),
        SizedBox(height: isWeb ? AppDimensions.spacing3xl : AppDimensions.spacingLg),

        FadeInUp(
          from: 60,
          delay: const Duration(milliseconds: 600),
          duration: const Duration(milliseconds: 1000),
          child: DescriptionText(isWeb: isWeb, textColors: textColors),
        ),
        SizedBox(height: isWeb ? AppDimensions.spacing6xl : AppDimensions.spacing5xl),

        FadeInUp(
          from: 40,
          delay: const Duration(milliseconds: 800),
          duration: const Duration(milliseconds: 1000),
          child: HeroActionButtons(
            isWeb: isWeb,
            onViewUiUx: onViewUiUx,
            onViewFlutter: onViewFlutter,
          ),
        ),
      ],
    );
  }
}
