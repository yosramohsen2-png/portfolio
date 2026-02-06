import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';
import 'package:portfolio/features/contact/presentation/widgets/contact_form.dart';
import 'package:portfolio/features/contact/presentation/widgets/social_links_section.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);

    return PageShell(
      currentRoute: '/contact',
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(width),
          vertical: AppDimensions.spacing8xl,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Headline Section
            Text(
              'contact.title'.tr(),
              textAlign: TextAlign.center,
              style: (isMobile
                      ? AppTypography.headlineLg(color: textColors.primaryDefault)
                      : AppTypography.headline3xl(color: textColors.primaryDefault))
                  .copyWith(fontWeight: FontWeight.w900, letterSpacing: -1.5),
            ),
            const SizedBox(height: AppDimensions.spacingXs),
            Text(
              'contact.subtitle'.tr(),
              textAlign: TextAlign.center,
              style: (isMobile
                      ? AppTypography.headlineSm(color: textColors.brandDefault)
                      : AppTypography.headlineMd(color: textColors.brandDefault))
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppDimensions.spacing9xl),

            // Content Layout
            if (isMobile)
              Column(
                children: [
                  const SocialLinksSection(),
                  const SizedBox(height: AppDimensions.spacing8xl),
                  const ContactForm(),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(flex: 1, child: SocialLinksSection()),
                  const SizedBox(width: AppDimensions.spacing10xl),
                  const Expanded(flex: 2, child: ContactForm()),
                ],
              ),
          ],
        ),
      ),
    );
  }

  double _getHorizontalPadding(double width) {
    if (width > AppDimensions.breakpointDesktop) return width * 0.15;
    if (width >= AppDimensions.breakpointTablet) return AppDimensions.spacing6xl;
    return AppDimensions.spacingXl;
  }
}
