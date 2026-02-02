import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class AboutHero extends StatelessWidget {
  final String title;
  final String role;
  final String description;

  const AboutHero({
    super.key,
    required this.title,
    required this.role,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background Shapes (as seen in HTML desktop-2)
        if (!isMobile) ...[
          Positioned(
            top: -50,
            left: -100,
            child: _buildShape(386, 20.2),
          ),
          Positioned(
            top: -100,
            right: -100,
            child: _buildShape(510, -16.1),
          ),
        ],

        // Content
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Mask group icon placeholder
            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.brandGold.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Icon(
                Icons.person_outline,
                size: 40,
                color: AppColors.brandGold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingXl),

            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: (isMobile
                      ? AppTypography.headlineLg(color: textColors.primaryDefault)
                      : AppTypography.headline3xl(color: textColors.primaryDefault))
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppDimensions.spacingMd),

            // Role
            Text(
              role,
              textAlign: TextAlign.center,
              style: (isMobile
                      ? AppTypography.headlineSm(color: AppColors.brandGold)
                      : AppTypography.headlineMd(color: AppColors.brandGold))
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppDimensions.spacing3xl),

            // Description
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: AppTypography.bodyLg(
                  color: textColors.primaryDisabled,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.spacing3xl),

            // Golden divider
            Container(
              width: 134,
              height: 2,
              color: AppColors.brandGold,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildShape(double size, double rotation) {
    return Pulse(
      duration: const Duration(seconds: 4),
      infinite: true,
      child: Transform.rotate(
        angle: rotation * math.pi / 180,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size * 0.1),
            border: Border.all(
              color: AppColors.brandGold.withOpacity(0.15),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
