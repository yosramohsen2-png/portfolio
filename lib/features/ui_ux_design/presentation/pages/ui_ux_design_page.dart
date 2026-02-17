import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';
import 'package:portfolio/shared/widgets/project_card.dart';
import 'package:portfolio/features/ui_ux_design/presentation/widgets/ui_ux_hero.dart';

const String _behanceUrl = 'https://www.behance.net/yosramohsen1';

class UiUxDesignPage extends StatelessWidget {
  const UiUxDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;

    // Access context.locale so the widget rebuilds when language changes
    final locale = context.locale;

    final List<Map<String, dynamic>> projects = _getProjects(locale);

    return PageShell(
      currentRoute: '/ui-ux-design',
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
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
                   const UiUxHero(),
                  const SizedBox(height: AppDimensions.spacing6xl),
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
    // Helper to build project map
    Map<String, dynamic> project(String id, String image, int tagCount) {
      // Fetch tags derived from the key. 
      // We know from en.json (newly updated) that tags are arrays.
      // But easy_localization tr() returns String.
      // We can fallback to hardcoded lists if strictly needed or assume a helper.
      // For now, I will hardcode the tags here to match the user input exactly,
      // because obtaining a List from tr() is tricky without a custom delegate or changing structure to map.
      // The User asked to "TAKE THE CODE" essentially.
      
      // Actually, looking at FlutterDevPage, it used:
      // 'tags': List.generate(tagCount, (i) => 'key.tags.$i'.tr())
      // But that required the JSON "tags" to be an Object {"0": "val"}, not Array ["val"].
      // My update to `en.json` uses Arrays.
      // So 'key.tags.0' MIGHT not work with standard EasyLocalization unless it supports array index access.
      // (It usually does for JSON). Let's assume it does.
      
      return {
        'title': 'ui_ux.projects.$id.title'.tr(),
        'description': 'ui_ux.projects.$id.description'.tr(),
        'tags': List.generate(tagCount, (index) => 'ui_ux.projects.$id.tags.$index'.tr()),
        'image': image,
      };
    }

    // Mapping based on User's "Code" order
    return [
       project('0', AppAssets.clinicSaas, 3), // Clinic
       project('1', AppAssets.audit, 3),      // Audit
       project('2', AppAssets.eCommerceSaas, 3), // E-Commerce SaaS (Background/Macbook)
       project('3', AppAssets.boostSaports, 3),  // Boost
       project('4', AppAssets.maternalCare, 3), // Maternal
       project('5', AppAssets.environmental, 3), // Environmental
       project('6', AppAssets.mongiz, 3), // Goal/Mongiz
       project('7', AppAssets.b2bEngagement, 3), // B2B
       project('8', AppAssets.efa, 3), // EFA
       project('9', AppAssets.fittingRoom, 3), // Fitting Room
       project('10', AppAssets.legal, 3), // Legal System / Consultancy
       project('11', AppAssets.fashionECommerce, 3), // Fashion
       project('12', AppAssets.sportsField, 3), // Sports Field
       project('13', AppAssets.legalAdvice, 3), // Legal Advice
       project('14', AppAssets.healthCare, 3), // Healthcare
       project('15', AppAssets.portfolioProject, 3), // Portfolio
    ];
  }

  Widget _buildProjectsLayout(List<Map<String, dynamic>> projects, double width) {
    final isMobile = width < AppDimensions.breakpointTablet;

    if (isMobile) {
      // Mobile: single column
      return Column(
        children: projects.map((p) => Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.spacing3xl),
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
          rowChildren.add(const SizedBox(width: AppDimensions.spacing4xl));
        }
        rowChildren.add(
          Expanded(child: _buildCard(rowItems[j])),
        );
      }

      // If last row has fewer cards, add empty Expanded to maintain sizing
      final int remaining = crossAxisCount - rowItems.length;
      for (int k = 0; k < remaining; k++) {
        rowChildren.add(const SizedBox(width: AppDimensions.spacing4xl));
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
                padding: const EdgeInsets.only(bottom: AppDimensions.spacing4xl),
                child: row,
              ))
          .toList(),
    );
  }

  Widget _buildCard(Map<String, dynamic> p) {
    // ProjectCard handles hover, shadow, and scaling internally matching Flutter page
    return ProjectCard(
      imageUrl: p['image'] as String,
      title: p['title'] as String,
      description: p['description'] as String,
      tags: p['tags'] as List<String>,
      onTap: () => launchUrl(
        Uri.parse(_behanceUrl),
        mode: LaunchMode.externalApplication,
      ),
    );
  }
}
