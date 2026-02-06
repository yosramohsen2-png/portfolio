import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';
import 'package:portfolio/shared/widgets/project_card.dart';

class FlutterDevPage extends StatelessWidget {
  const FlutterDevPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final isMobile = width < AppDimensions.breakpointTablet;

    // Manual mapping for now to ensure it works with easy_localization
    final List<Map<String, dynamic>> projects = [
      {
        'title': 'flutter_dev.projects.0.title'.tr(),
        'description': 'flutter_dev.projects.0.description'.tr(),
        'tags': ['Flutter', 'BLoC', 'Firebase'], // Simplified for now
        'image': 'https://images.unsplash.com/photo-1551288049-bbbda536639a?q=80&w=500',
      },
      {
        'title': 'flutter_dev.projects.1.title'.tr(),
        'description': 'flutter_dev.projects.1.description'.tr(),
        'tags': ['Flutter', 'Hive', 'REST API'],
        'image': 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=500',
      },
      {
        'title': 'flutter_dev.projects.2.title'.tr(),
        'description': 'flutter_dev.projects.2.description'.tr(),
        'tags': ['Flutter', 'Riverpod', 'WebSockets'],
        'image': 'https://images.unsplash.com/photo-1611162617213-7d7a39e9b1d7?q=80&w=500',
      },
    ];

    return PageShell(
      currentRoute: '/flutter-dev',
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(width),
          vertical: AppDimensions.spacing8xl,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            Text(
              'flutter_dev.title'.tr(),
              textAlign: TextAlign.center,
              style: (isMobile
                      ? AppTypography.headlineLg(color: textColors.primaryDefault)
                      : AppTypography.headline3xl(color: textColors.primaryDefault))
                  .copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: AppDimensions.spacingXs),
            Text(
              'flutter_dev.subtitle'.tr(),
              textAlign: TextAlign.center,
              style: (isMobile
                      ? AppTypography.headlineSm(color: textColors.brandDefault)
                      : AppTypography.headlineMd(color: textColors.brandDefault))
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppDimensions.spacing4xl),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Text(
                'flutter_dev.description'.tr(),
                textAlign: TextAlign.center,
                style: AppTypography.bodyXl(
                  color: textColors.brandDisabled,
                  fontWeight: FontWeight.w500,
                ).copyWith(height: 1.6),
              ),
            ),
            const SizedBox(height: AppDimensions.spacing10xl),

            // Projects Grid
            _buildProjectsGrid(projects, width),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsGrid(List<Map<String, dynamic>> projects, double width) {
    int crossAxisCount = 1;
    if (width >= 1200) {
      crossAxisCount = 3;
    } else if (width >= 800) {
      crossAxisCount = 2;
    }

    if (crossAxisCount == 1) {
      return Column(
        children: projects.map((p) => Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.spacing6xl),
          child: _buildProjectCard(p),
        )).toList(),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: AppDimensions.spacing3xl,
            mainAxisSpacing: AppDimensions.spacing6xl,
            childAspectRatio: 0.75,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return _buildProjectCard(projects[index]);
          },
        );
      }
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    return ProjectCard(
      imageUrl: project['image'],
      title: project['title'],
      description: project['description'],
      tags: List<String>.from(project['tags']),
      onTap: () {},
    );
  }

  double _getHorizontalPadding(double width) {
    if (width > AppDimensions.breakpointDesktop) return width * 0.10;
    if (width >= AppDimensions.breakpointTablet) return AppDimensions.spacing6xl;
    return AppDimensions.spacingXl;
  }
}
