import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/features/about/presentation/widgets/certificate_card.dart';

/// Tab content widget displaying all certificates in a responsive grid layout.
class CertificatesTabContent extends StatelessWidget {
  const CertificatesTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;

    final certificates = _buildCertificates();
    const spacing = AppDimensions.spacing3xl;

    if (isMobile) {
      // Mobile: single column, scrollable list
      return Column(
        children: List.generate(certificates.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: index == certificates.length - 1 ? 0 : spacing,
            ),
            child: FadeInUp(
              delay: Duration(milliseconds: 120 * index),
              duration: const Duration(milliseconds: 500),
              child: certificates[index],
            ),
          );
        }),
      );
    }

    // Tablet / Desktop: Responsive Wrap layout
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        int crossAxisCount = 1;
        if (availableWidth > 900) {
          crossAxisCount = 3;
        } else if (availableWidth > 580) {
          crossAxisCount = 2;
        }

        final cardWidth =
            (availableWidth - (spacing * (crossAxisCount - 1))) /
                crossAxisCount -
            0.5;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(certificates.length, (index) {
            return SizedBox(
              width: cardWidth,
              child: FadeInUp(
                delay: Duration(milliseconds: 100 * index),
                duration: const Duration(milliseconds: 500),
                child: certificates[index],
              ),
            );
          }),
        );
      },
    );
  }

  List<Widget> _buildCertificates() {
    return [
      CertificateCard(
        assetPath: AppAssets.certificateMasar,
        title: 'certificates.masar.title'.tr(),
        description: 'certificates.masar.description'.tr(),
      ),
      CertificateCard(
        assetPath: AppAssets.certificateCradis,
        title: 'certificates.cradis.title'.tr(),
        description: 'certificates.cradis.description'.tr(),
      ),
      CertificateCard(
        assetPath: AppAssets.certificateFlutter,
        title: 'certificates.flutter.title'.tr(),
        description: 'certificates.flutter.description'.tr(),
      ),
    ];
  }
}
