import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';
import 'package:portfolio/features/flutter_dev/presentation/widgets/project_card.dart';
import 'package:portfolio/features/flutter_dev/presentation/widgets/flutter_dev_hero.dart';

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

    return PageShell(
      currentRoute: '/flutter-dev',
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(width),
          vertical: isMobile ? 40 : 80,
        ),
        child: Column(
          children: [
            const FlutterDevHero(),
            const SizedBox(height: 60),
            _buildProjectsGrid(projects, width),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getProjects(BuildContext context) {
    // Helper to safely get tags from localization
    List<String> getTags(int projectIndex, int tagCount) {
      return List.generate(tagCount, (i) => 
        'flutter_dev.projects.$projectIndex.tags.$i'.tr()
      );
    }

    return [
      {
        'title': 'flutter_dev.projects.0.title'.tr(),
        'description': 'flutter_dev.projects.0.description'.tr(),
        'tags': getTags(0, 4),
        'image': AppAssets.project1,
        'url': 'https://github.com/yosramohsen2-png/Mongiz-App',
      },
      {
        'title': 'flutter_dev.projects.1.title'.tr(),
        'description': 'flutter_dev.projects.1.description'.tr(),
        'tags': getTags(1, 3),
        'image': AppAssets.project2,
        'url': 'https://github.com/yosramohsen2-png/EdTech-LMS',
      },
      {
        'title': 'flutter_dev.projects.2.title'.tr(),
        'description': 'flutter_dev.projects.2.description'.tr(),
        'tags': getTags(2, 3),
        'image': AppAssets.project3,
        'url': 'https://github.com/yosramohsen2-png/ElectroHub',
      },
      {
        'title': 'flutter_dev.projects.3.title'.tr(),
        'description': 'flutter_dev.projects.3.description'.tr(),
        'tags': getTags(3, 3),
        'image': AppAssets.project4,
        'url': 'https://github.com/yosramohsen2-png/portfolio',
      },
    ];
  }

  Widget _buildProjectsGrid(List<Map<String, dynamic>> projects, double width) {
    if (width < AppDimensions.breakpointTablet) {
      return Column(
        children: projects.map((p) => Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: ProjectCard(
            title: p['title'] as String,
            description: p['description'] as String,
            imagePath: p['image'] as String,
            tags: p['tags'] as List<String>,
            githubUrl: p['url'] as String,
          ),
        )).toList(),
      );
    }

    // Grid for Tablet/Desktop - Showing 3 columns for standard web widths (>= 1000)
    int crossAxisCount = width >= 1000 ? 3 : 2;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 32,
        mainAxisSpacing: 32,
        childAspectRatio: 0.8,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final p = projects[index];
        return ProjectCard(
          title: p['title'] as String,
          description: p['description'] as String,
          imagePath: p['image'] as String,
          tags: p['tags'] as List<String>,
          githubUrl: p['url'] as String,
        );
      },
    );
  }

  double _getHorizontalPadding(double width) {
    if (width > AppDimensions.breakpointDesktop) return width * 0.08;
    if (width >= AppDimensions.breakpointTablet) return 40;
    return 20;
  }
}
