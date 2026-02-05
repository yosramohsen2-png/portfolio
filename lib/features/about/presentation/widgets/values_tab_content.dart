import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/features/about/presentation/widgets/value_card.dart';

class ValuesTabContent extends StatelessWidget {
  const ValuesTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        
        // Breakpoints for the values cards
        int crossAxisCount = 1;
        if (availableWidth > 900) {
          crossAxisCount = 3;
        } else if (availableWidth > 600) {
          crossAxisCount = 2;
        }

        double spacing = AppDimensions.spacing2xl;
        
        // Calculate card width precisely
        double cardWidth = (availableWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount - 1;

        final cards = _buildCards();

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            mainAxisExtent: availableWidth > 600 ? 380 : null, // Equal height on large screens without overflow
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
      ValueCard(
        title: 'about.values.quality.title'.tr(),
        description: 'about.values.quality.description'.tr(),
        icon: Icons.emoji_events_outlined,
      ),
      ValueCard(
        title: 'about.values.collaboration.title'.tr(),
        description: 'about.values.collaboration.description'.tr(),
        icon: Icons.groups_outlined,
      ),
      ValueCard(
        title: 'about.values.innovation.title'.tr(),
        description: 'about.values.innovation.description'.tr(),
        icon: Icons.favorite_border, // Heart icon as seen in mockup for "Innovation"
      ),
    ];
  }
}
