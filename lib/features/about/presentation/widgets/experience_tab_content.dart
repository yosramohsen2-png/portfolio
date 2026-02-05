import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/features/about/presentation/widgets/experience_card.dart';

class ExperienceTabContent extends StatelessWidget {
  const ExperienceTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        
        // Breakpoints based on actual available width within the padded container
        int crossAxisCount = 1;
        if (availableWidth > 750) {
          crossAxisCount = 3;
        } else if (availableWidth > 450) {
          crossAxisCount = 2;
        }

        double spacing = AppDimensions.spacing2xl;
        
        // Calculate card width precisely, subtracting 0.5 to avoid subpixel rendering overflow
        double cardWidth = (availableWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount - 0.5;

        final cards = _buildCards();

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            mainAxisExtent: availableWidth > 750 ? 300 : null, // Fixed height on web for equal cards
          ),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return FadeInUp(
              delay: Duration(milliseconds: 100 * index),
              duration: const Duration(milliseconds: 500),
              child: cards[index],
            );
          },
        );
      },
    );
  }

  List<Widget> _buildCards() {
    return [
      ExperienceCard(
        title: 'about.experience.zimitail.title'.tr(),
        description: 'about.experience.zimitail.description'.tr(),
        icon: Icons.palette_outlined,
      ),
      ExperienceCard(
        title: 'about.experience.smartly.title'.tr(),
        description: 'about.experience.smartly.description'.tr(),
        icon: Icons.palette_outlined,
      ),
      ExperienceCard(
        title: 'about.experience.freelance.title'.tr(),
        description: 'about.experience.freelance.description'.tr(),
        icon: Icons.palette_outlined,
      ),
      ExperienceCard(
        title: 'about.experience.flutter_exp.title'.tr(),
        description: 'about.experience.flutter_exp.description'.tr(),
        icon: Icons.code,
      ),
    ];
  }
}
