import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/shared/widgets/service_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);

    return Column(
      children: [
        Text(
          'home.services.title'.tr(),
          textAlign: TextAlign.center,
          style: (isMobile
                  ? AppTypography.headlineMd(color: textColors.primaryDefault)
                  : AppTypography.headlineLg(color: textColors.primaryDefault))
              .copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: AppDimensions.spacing8xl),
        if (isMobile)
          Column(
            children: [
              _buildCard(
                icon: Icons.design_services_outlined,
                title: 'home.services.uiux.title'.tr(),
                description: 'home.services.uiux.description'.tr(),
                size: ServiceCardSize.large,
              ),
              const SizedBox(height: AppDimensions.spacing3xl),
              _buildCard(
                icon: Icons.code_outlined,
                title: 'home.services.flutter.title'.tr(),
                description: 'home.services.flutter.description'.tr(),
                size: ServiceCardSize.large,
              ),
              const SizedBox(height: AppDimensions.spacing3xl),
              _buildCard(
                icon: Icons.palette_outlined,
                title: 'home.services.graphic.title'.tr(),
                description: 'home.services.graphic.description'.tr(),
                size: ServiceCardSize.large,
              ),
            ],
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildCard(
                  icon: Icons.design_services_outlined,
                  title: 'home.services.uiux.title'.tr(),
                  description: 'home.services.uiux.description'.tr(),
                ),
              ),
              const SizedBox(width: AppDimensions.spacing3xl),
              Expanded(
                child: _buildCard(
                  icon: Icons.code_outlined,
                  title: 'home.services.flutter.title'.tr(),
                  description: 'home.services.flutter.description'.tr(),
                ),
              ),
              const SizedBox(width: AppDimensions.spacing3xl),
              Expanded(
                child: _buildCard(
                  icon: Icons.palette_outlined,
                  title: 'home.services.graphic.title'.tr(),
                  description: 'home.services.graphic.description'.tr(),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String description,
    ServiceCardSize size = ServiceCardSize.large,
  }) {
    return ServiceCard(
      icon: icon,
      title: title,
      description: description,
      size: size,
    );
  }
}
