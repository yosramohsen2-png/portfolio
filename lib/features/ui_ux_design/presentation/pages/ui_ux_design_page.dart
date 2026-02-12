import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';
import 'package:portfolio/shared/widgets/custom_project_card.dart';
import 'package:portfolio/shared/widgets/section_hero.dart';
import 'package:portfolio/core/constants/app_assets.dart';

class UiUxDesignPage extends StatefulWidget {
  const UiUxDesignPage({super.key});

  @override
  State<UiUxDesignPage> createState() => _UiUxDesignPageState();
}

class _UiUxDesignPageState extends State<UiUxDesignPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;

    // Build the projects list inside build to ensure it reacts to locale changes
    final List<Map<String, dynamic>> projects = _getProjects(context);

    return KeyedSubtree(
      key: ValueKey(context.locale.languageCode),
      child: PageShell(
        currentRoute: '/ui-ux-design',
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _getHorizontalPadding(width),
            vertical: isMobile ? 40 : 80,
          ),
          child: Column(
            children: [
              SectionHero(
                title: 'ui_ux.title'.tr(),
                subtitle: 'ui_ux.subtitle'.tr(),
                description: 'ui_ux.description'.tr(),
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
        (i) => "ui_ux.projects.$projectIndex.tags.$i".tr(),
      );
    }

    // Mapping images to project indices
    final imageMapping = {
      0: AppAssets.uiuxProject1, // 4 flutter & 16 design
      1: AppAssets.uiuxProject2, // 1 flutter, 7 design
      2: AppAssets.uiuxProject3, // Property 1=MacBook #13 3
      3: AppAssets.uiuxProject4, // Property 1=image 7
      4: AppAssets.uiuxProject5, // Property 1=image 8
      5: AppAssets.uiuxProject6, // Property 1=image 9
    };

    // Mapping Behance URLs to project indices
    final behanceUrls = {
      0: "https://www.behance.net/gallery/215777717/Furniture-App",
      1: "https://www.behance.net/gallery/215682885/Coffee-App",
      2: "https://www.behance.net/gallery/215681989/Smart-Learning-App",
      3: "https://www.behance.net/gallery/198642751/Furniture-e-commerce-Application",
      4: "https://www.behance.net/gallery/198642391/Food-Delivery-Application",
      5: "https://www.behance.net/gallery/198641951/Health-Guard-Application",
    };

    return List.generate(6, (index) {
      return {
        'title': "ui_ux.projects.$index.title".tr(),
        'description': "ui_ux.projects.$index.description".tr(),
        'tags': getTags(index, 3),
        'image': imageMapping[index] ?? AppAssets.uiuxProject1,
        'behanceUrl': behanceUrls[index] ?? "",
      };
    });
  }

  Widget _buildProjectsGrid(List<Map<String, dynamic>> projects, double width) {
    int crossAxisCount = 1;
    if (width >= 1200) {
      crossAxisCount = 3;
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
                      behanceUrl: p['behanceUrl'],
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
          childAspectRatio: 0.85,
        ),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final p = projects[index];
          return CustomProjectCard(
            imageUrl: p['image'],
            title: p['title'],
            description: p['description'],
            tags: p['tags'],
            behanceUrl: p['behanceUrl'],
          );
        },
      );
    });
  }

  double _getHorizontalPadding(double width) {
    if (width > AppDimensions.breakpointDesktop) return width * 0.10;
    if (width >= AppDimensions.breakpointTablet) return 40;
    return 20;
  }
}
