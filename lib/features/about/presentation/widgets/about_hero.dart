import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
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
            top: -100,
            child: _buildCircularLine(width * 0.5, brightness),
          ),
          Positioned(
            top: -150,
            child: _buildCircularLine(width * 0.7, brightness),
          ),
        ],

        // Content
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Portrait with Glow
            FadeInDown(
              child: Container(
                width: isMobile ? 120 : 180,
                height: isMobile ? 120 : 180,
                padding: const EdgeInsets.all(4), // Space for border/glow
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.backgroundColors(brightness).brandSolid.withOpacity(0.35),
                      blurRadius: 50,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.backgroundColors(brightness).brandSolid,
                      width: 2.5,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/user_avatar.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: bgColors.primarySecondary,
                        child: Icon(Icons.person, size: 80, color: textColors.brandDefault),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.spacing3xl),

            // "About Me"
            Text(
              title,
              textAlign: TextAlign.center,
              style: (isMobile
                      ? AppTypography.headlineLg(color: textColors.primaryDefault)
                      : AppTypography.headline3xl(color: textColors.primaryDefault))
                  .copyWith(fontWeight: FontWeight.w900, letterSpacing: -1.5),
            ),
            const SizedBox(height: AppDimensions.spacingMd),

            // Role
            Text(
              role,
              textAlign: TextAlign.center,
              style: (isMobile
                      ? AppTypography.headlineSm(color: textColors.brandDefault)
                      : AppTypography.headlineMd(color: textColors.brandDefault))
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppDimensions.spacing3xl),

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
            const SizedBox(height: AppDimensions.spacing3xl),

            // Golden underline
            Container(
              width: 140,
              height: 3.5,
              decoration: BoxDecoration(
                color: bgColors.brandSolid,
                borderRadius: BorderRadius.circular(10),
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
            color: AppColors.backgroundColors(brightness).brandSolid.withOpacity(0.1),
            width: 0.8,
          ),
        ),
      ),
    );
  }
}
