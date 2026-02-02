import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/features/about/presentation/widgets/experience_card.dart';

class ExperienceTabContent extends StatelessWidget {
  const ExperienceTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    // Laptop/Desktop (>992px): 3 columns, Tablet: 2 columns, Mobile: 1 column
    int crossAxisCount = 1;
    if (width > 992) {
      crossAxisCount = 3;
    } else if (width > 600) {
      crossAxisCount = 2;
    }

    // Adjusting margins to be more flexible for 3 columns
    double horizontalPadding = width > 1200 ? width * 0.08 : (width > 768 ? AppDimensions.spacing4xl : AppDimensions.spacingXl);
    double availableWidth = width - (horizontalPadding * 2);
    
    double spacing = AppDimensions.spacing2xl;
    
    // Calculating exact card width with precision
    double cardWidth = (availableWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      alignment: WrapAlignment.start,
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
