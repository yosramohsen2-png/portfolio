import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio/core/constants/app_assets.dart';
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
    final isDark = brightness == Brightness.dark;
    final textColors = AppColors.textColors(brightness);
    final bgColors = AppColors.backgroundColors(brightness);

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        // Subtle background circular lines as seen in Image 1
        if (!isMobile) ...[
          Positioned(
            top: -200,
            child: _buildCircularLine(width * 0.6, brightness),
          ),
          Positioned(
            top: -280,
            child: _buildCircularLine(width * 0.85, brightness),
          ),
          Positioned(
            top: -350,
            child: _buildCircularLine(width * 1.1, brightness),
          ),
        ],

        // Content
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInDown(
              child: Container(
                width: isMobile ? 120 : 180,
                height: isMobile ? 120 : 180,
                padding: const EdgeInsets.all(
                  AppDimensions.spacingXs,
                ), // Space for border/glow
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.backgroundColors(
                        brightness,
                      ).brandSolid.withValues(alpha: 0.35),
                      blurRadius: AppDimensions.effect4xl,
                      spreadRadius: AppDimensions.effectLg,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.backgroundColors(brightness).brandSolid,
                      width: AppDimensions.borderWidthSm,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      AppAssets.userAvatar,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: bgColors.primarySecondary,
                        child: Icon(
                          Icons.person,
                          size: AppDimensions.icon2xl,
                          color: textColors.brandDefault,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),

            // "About Me"
            Text(
              title,
              textAlign: TextAlign.center,
              style:
                  (isMobile
                          ? AppTypography.headlineLg(
                              color: textColors.primaryDefault,
                            )
                          : AppTypography.headline3xl(
                              color: textColors.primaryDefault,
                            ))
                      .copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.5,
                      ),
            ),
            const SizedBox(height: AppDimensions.spacingXs),

            // Role
            Text(
              role,
              textAlign: TextAlign.center,
              style:
                  (isMobile
                          ? AppTypography.headlineSm(
                              color: textColors.brandDefault,
                            )
                          : AppTypography.headlineMd(
                              color: textColors.brandDefault,
                            ))
                      .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppDimensions.spacing2xl),

            // Description
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 850),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: AppTypography.bodyLg(
                  color: textColors.primaryDisabled2,
                ).copyWith(fontWeight: FontWeight.w500, height: 1.7),
              ),
            ),
            const SizedBox(height: AppDimensions.spacing2xl),

            // Golden underline
            Container(
              width: 140,
              height: AppDimensions.borderWidthSm + AppDimensions.borderWidthXs,
              decoration: BoxDecoration(
                color: bgColors.brandSolid,
                borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCircularLine(double size, Brightness brightness) {
    return Pulse(
      duration: const Duration(seconds: 10),
      infinite: true,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.backgroundColors(
              brightness,
            ).brandSolid.withValues(alpha: 0.1),
            width: AppDimensions.borderWidthXs * 0.8,
          ),
        ),
      ),
    );
  }
}
