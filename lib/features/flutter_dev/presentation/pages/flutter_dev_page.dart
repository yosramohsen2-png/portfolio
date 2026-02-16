import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';
import 'package:portfolio/shared/widgets/project_card.dart';
import 'package:portfolio/features/flutter_dev/presentation/widgets/flutter_dev_hero.dart';

const String _githubUrl = 'https://github.com/yosramohsen2-png';

class FlutterDevPage extends StatelessWidget {
  const FlutterDevPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;

    // Access context.locale so the widget rebuilds when language changes
    final locale = context.locale;

    final List<Map<String, dynamic>> projects = _getProjects(locale);

    return PageShell(
      currentRoute: '/flutter-dev',
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: AppDimensions.breakpointDesktop,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: isMobile ? AppDimensions.spacing2xl : AppDimensions.spacing5xl,
                vertical: isMobile ? AppDimensions.spacing5xl : AppDimensions.spacing7xl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FlutterDevHero(),
                  SizedBox(height: AppDimensions.spacing6xl),
                  _buildProjectsLayout(projects, width),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getProjects(Locale locale) {
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
        'image': AppAssets.mongiz,
      },
      {
        'title': 'flutter_dev.projects.1.title'.tr(),
        'description': 'flutter_dev.projects.1.description'.tr(),
        'tags': getTags(1, 3),
        'image': AppAssets.edtech,
      },
      {
        'title': 'flutter_dev.projects.2.title'.tr(),
        'description': 'flutter_dev.projects.2.description'.tr(),
        'tags': getTags(2, 3),
        'image': AppAssets.electrohub,
      },
      {
        'title': 'flutter_dev.projects.3.title'.tr(),
        'description': 'flutter_dev.projects.3.description'.tr(),
        'tags': getTags(3, 3),
        'image': AppAssets.portfolioProject,
      },
    ];
  }

  Widget _buildProjectsLayout(List<Map<String, dynamic>> projects, double width) {
    final isMobile = width < AppDimensions.breakpointTablet;

    if (isMobile) {
      // Mobile: single column
      return Column(
        children: projects.map((p) => Padding(
          padding: EdgeInsets.only(bottom: AppDimensions.spacing3xl),
          child: _buildCard(p),
        )).toList(),
      );
    }

    // Desktop: build rows of 3 cards each using Expanded
    const int crossAxisCount = 3;
    final List<Widget> rows = [];

    for (int i = 0; i < projects.length; i += crossAxisCount) {
      final rowItems = projects.sublist(
        i,
        (i + crossAxisCount > projects.length) ? projects.length : i + crossAxisCount,
      );

      final List<Widget> rowChildren = [];
      for (int j = 0; j < rowItems.length; j++) {
        if (j > 0) {
          rowChildren.add(SizedBox(width: AppDimensions.spacing4xl));
        }
        rowChildren.add(
          Expanded(child: _buildCard(rowItems[j])),
        );
      }

      // If last row has fewer cards, add empty Expanded to maintain sizing
      final int remaining = crossAxisCount - rowItems.length;
      for (int k = 0; k < remaining; k++) {
        rowChildren.add(SizedBox(width: AppDimensions.spacing4xl));
        rowChildren.add(const Expanded(child: SizedBox()));
      }

      rows.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rowChildren,
      ));
    }

    return Column(
      children: rows
          .map((row) => Padding(
                padding: EdgeInsets.only(bottom: AppDimensions.spacing4xl),
                child: row,
              ))
          .toList(),
    );
  }

  Widget _buildCard(Map<String, dynamic> p) {
    return ProjectCard(
      imageUrl: p['image'] as String,
      title: p['title'] as String,
      description: p['description'] as String,
      tags: p['tags'] as List<String>,
      onTap: () => launchUrl(
        Uri.parse(_githubUrl),
        mode: LaunchMode.externalApplication,
      ),
    );
  }
}
