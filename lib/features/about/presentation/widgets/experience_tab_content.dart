import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/features/about/presentation/widgets/experience_card.dart';

class ExperienceTabContent extends StatelessWidget {
  const ExperienceTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    // Determine the number of columns based on width
    int crossAxisCount = 1;
    if (width > 1200) {
      crossAxisCount = 2;
    } else if (width > 768) {
      crossAxisCount = 2;
    }

    // Horizontal padding from AboutPage logic to calculate available width
    double horizontalPadding = width > 1200 ? width * 0.15 : (width > 768 ? AppDimensions.spacing6xl : AppDimensions.spacingXl);
    double availableWidth = width - (horizontalPadding * 2);
    
    // Spacing between cards
    double spacing = AppDimensions.spacing2xl;
    
    // Calculate width for each card if more than 1 column
    double cardWidth = crossAxisCount > 1 
        ? (availableWidth - spacing) / crossAxisCount 
        : availableWidth;

    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      children: _buildCards().map((card) => SizedBox(
        width: cardWidth,
        child: card,
      )).toList(),
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
