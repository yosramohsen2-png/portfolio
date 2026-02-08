import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/shared/widgets/service_card.dart';

class ServicesSection extends StatelessWidget {
  final VoidCallback? onViewUiUx;
  final VoidCallback? onViewFlutter;

  const ServicesSection({
    super.key,
    this.onViewUiUx,
    this.onViewFlutter,
  });

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
              .copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 60),
        if (isMobile)
          Column(
            children: [
              _buildCard(
                icon: Icons.design_services_outlined,
                title: 'home.services.uiux.title'.tr(),
                description: 'home.services.uiux.description'.tr(),
                size: ServiceCardSize.large,
                onTap: onViewUiUx,
              ),
              const SizedBox(height: AppDimensions.spacing3xl),
              _buildCard(
                icon: Icons.code_outlined,
                title: 'home.services.flutter.title'.tr(),
                description: 'home.services.flutter.description'.tr(),
                size: ServiceCardSize.large,
                onTap: onViewFlutter,
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
                  onTap: onViewUiUx,
                ),
              ),
              const SizedBox(width: AppDimensions.spacing3xl),
              Expanded(
                child: _buildCard(
                  icon: Icons.code_outlined,
                  title: 'home.services.flutter.title'.tr(),
                  description: 'home.services.flutter.description'.tr(),
                  onTap: onViewFlutter,
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
    VoidCallback? onTap,
  }) {
    return ServiceCard(
      icon: icon,
      title: title,
      description: description,
      size: size,
      onTap: onTap,
    );
  }
}
