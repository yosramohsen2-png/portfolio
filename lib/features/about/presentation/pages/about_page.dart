import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';
import 'package:portfolio/features/about/presentation/widgets/about_hero.dart';
import 'package:portfolio/features/about/presentation/widgets/about_tabs.dart';
import 'package:portfolio/features/about/presentation/widgets/experience_tab_content.dart';
import 'package:portfolio/features/about/presentation/widgets/skills_tab_content.dart';
import 'package:portfolio/features/about/presentation/widgets/values_tab_content.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    // This key ensures the whole page rebuilds when locale changes if automatic rebuild fails
    return KeyedSubtree(
      key: ValueKey(context.locale.languageCode),
      child: PageShell(
        currentRoute: '/about',
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _getHorizontalPadding(context),
            vertical: AppDimensions.spacing6xl,
          ),
          child: Column(
            children: [
              // Hero Section
              AboutHero(
                title: 'about.title'.tr(),
                role: 'about.role'.tr(),
                description: 'about.description'.tr(),
              ),
              
              const SizedBox(height: AppDimensions.spacing5xl),

              // Tabs Section
              AboutTabs(
                selectedIndex: _selectedTabIndex,
                tabs: [
                  'about.tabs.experience'.tr(),
                  'about.tabs.skills'.tr(),
                  'about.tabs.values'.tr(),
                ],
                onTabSelected: (index) {
                  setState(() {
                    _selectedTabIndex = index;
                  });
                },
              ),

              const SizedBox(height: AppDimensions.spacing3xl),

              // Content Section
              _buildTabContent(),
            ],
          ),
        ),
      ),
    );
  }

  double _getHorizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > AppDimensions.breakpointDesktop) return width * 0.15;
    if (width >= AppDimensions.breakpointTablet) return AppDimensions.spacing6xl;
    return AppDimensions.spacingXl;
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return const ExperienceTabContent();
      case 1:
        return const SkillsTabContent();
      case 2:
        return const ValuesTabContent();
      default:
        return const SizedBox.shrink();
    }
  }

}
