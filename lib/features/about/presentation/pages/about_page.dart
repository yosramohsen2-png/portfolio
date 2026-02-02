import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';
import 'package:portfolio/features/about/presentation/widgets/about_hero.dart';
import 'package:portfolio/features/about/presentation/widgets/about_tabs.dart';
import 'package:portfolio/features/about/presentation/widgets/experience_card.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;

    return PageShell(
      currentRoute: '/about',
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? AppDimensions.spacingXl : AppDimensions.spacing6xl,
          vertical: AppDimensions.spacing6xl,
        ),
        child: Column(
          children: [
            // Hero Section
            FadeInDown(
              duration: const Duration(milliseconds: 800),
              child: AboutHero(
                title: 'about.title'.tr(),
                role: 'about.role'.tr(),
                description: 'about.description'.tr(),
              ),
            ),
            
            const SizedBox(height: AppDimensions.spacing8xl),

            // Tabs Section
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              duration: const Duration(milliseconds: 600),
              child: AboutTabs(
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
            ),

            const SizedBox(height: AppDimensions.spacing5xl),

            // Content Section based on selected tab
            _buildTabContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildExperienceGrid();
      case 1:
        return _buildPlaceholder('Skills Content Coming Soon...');
      case 2:
        return _buildPlaceholder('Values Content Coming Soon...');
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildExperienceGrid() {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 1200 ? 2 : 1;

    return FadeInUp(
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 600),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (crossAxisCount == 1) {
            return Column(
              children: [
                ExperienceCard(
                  title: 'about.experience.zimitail.title'.tr(),
                  description: 'about.experience.zimitail.description'.tr(),
                ),
                const SizedBox(height: AppDimensions.spacingXl),
                ExperienceCard(
                  title: 'about.experience.smartly.title'.tr(),
                  description: 'about.experience.smartly.description'.tr(),
                ),
                const SizedBox(height: AppDimensions.spacingXl),
                ExperienceCard(
                  title: 'about.experience.freelance.title'.tr(),
                  description: 'about.experience.freelance.description'.tr(),
                ),
                const SizedBox(height: AppDimensions.spacingXl),
                ExperienceCard(
                  title: 'about.experience.flutter_exp.title'.tr(),
                  description: 'about.experience.flutter_exp.description'.tr(),
                ),
              ],
            );
          } else {
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.8,
              crossAxisSpacing: AppDimensions.spacingXl,
              mainAxisSpacing: AppDimensions.spacingXl,
              children: [
                ExperienceCard(
                  title: 'about.experience.zimitail.title'.tr(),
                  description: 'about.experience.zimitail.description'.tr(),
                ),
                ExperienceCard(
                  title: 'about.experience.smartly.title'.tr(),
                  description: 'about.experience.smartly.description'.tr(),
                ),
                ExperienceCard(
                  title: 'about.experience.freelance.title'.tr(),
                  description: 'about.experience.freelance.description'.tr(),
                ),
                ExperienceCard(
                  title: 'about.experience.flutter_exp.title'.tr(),
                  description: 'about.experience.flutter_exp.description'.tr(),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildPlaceholder(String text) {
    return FadeIn(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing5xl),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
    );
  }
}
