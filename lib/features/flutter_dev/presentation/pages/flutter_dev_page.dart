import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';
import 'package:portfolio/shared/widgets/custom_project_card.dart';
import 'package:portfolio/shared/widgets/section_hero.dart';
import 'package:portfolio/core/constants/app_assets.dart';

class FlutterDevPage extends StatefulWidget {
  const FlutterDevPage({super.key});

  @override
  State<FlutterDevPage> createState() => _FlutterDevPageState();
}

class _FlutterDevPageState extends State<FlutterDevPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;

    // Build the projects list inside build to ensure it reacts to locale changes
    final List<Map<String, dynamic>> projects = _getProjects(context);

    return KeyedSubtree(
      key: ValueKey(context.locale.languageCode),
      child: PageShell(
        currentRoute: '/flutter-dev',
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _getHorizontalPadding(width),
            vertical: isMobile ? 40 : 80,
          ),
          child: Column(
            children: [
              SectionHero(
                title: 'flutter_dev.title'.tr(),
                subtitle: 'flutter_dev.subtitle'.tr(),
                description: 'flutter_dev.description'.tr(),
              ),
              const SizedBox(height: 60),
              _buildProjectsGrid(projects, width),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getProjects(BuildContext context) {
    List<String> getTags(int projectIndex, int tagCount) {
      return List.generate(
        tagCount,
        (i) => "flutter_dev.projects.$projectIndex.tags.$i".tr(),
      );
    }

    final imageMapping = {
      0: AppAssets.flutterProject1,
      1: AppAssets.flutterProject2,
      2: AppAssets.flutterProject3,
      3: AppAssets.flutterProject4,
    };

    return List.generate(4, (index) {
      return {
        'title': "flutter_dev.projects.$index.title".tr(),
        'description': "flutter_dev.projects.$index.description".tr(),
        'tags': getTags(index, 3),
        'image': imageMapping[index] ?? AppAssets.flutterProject1,
      };
    });
  }

  Widget _buildProjectsGrid(List<Map<String, dynamic>> projects, double width) {
    int crossAxisCount = 1;
    if (width >= 1200) {
      crossAxisCount = 2;
    } else if (width >= 800) {
      crossAxisCount = 2;
    }

    return LayoutBuilder(builder: (context, constraints) {
      if (crossAxisCount == 1) {
        return Column(
          children: projects
              .map((p) => Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: CustomProjectCard(
                      imageUrl: p['image'],
                      title: p['title'],
                      description: p['description'],
                      tags: p['tags'],
                    ),
                  ))
              .toList(),
        );
      }

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 30,
          mainAxisSpacing: 50,
          childAspectRatio: 1.1,
        ),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final p = projects[index];
          return CustomProjectCard(
            imageUrl: p['image'],
            title: p['title'],
            description: p['description'],
            tags: p['tags'],
          );
        },
      );
    });
  }

  double _getHorizontalPadding(double width) {
    if (width > AppDimensions.breakpointDesktop) return width * 0.15;
    if (width >= AppDimensions.breakpointTablet) return 40;
    return 20;
  }
}
