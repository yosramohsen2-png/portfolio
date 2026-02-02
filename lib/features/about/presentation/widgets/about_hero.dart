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
        // Background Shapes (Pulse animation)
        if (!isMobile) ...[
          Positioned(
            top: -20,
            left: -width * 0.1,
            child: _buildShape(width * 0.3, 20.2, brightness),
          ),
          Positioned(
            top: -40,
            right: -width * 0.1,
            child: _buildShape(width * 0.4, -16.1, brightness),
          ),
        ],

        // Content
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Portrait / Avatar as seen in image
            FadeInDown(
              child: Container(
                width: isMobile ? 120 : 160,
                height: isMobile ? 120 : 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.backgroundColors(brightness).brandSolid, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.backgroundColors(brightness).brandSolid.withOpacity(0.2),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/user_avatar.png', // User should name their avatar file this
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: isDark ? Colors.grey[800] : Colors.grey[200],
                      child: Icon(Icons.person, size: 60, color: textColors.brandDefault),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.spacing3xl),

            // "About Me" Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: (isMobile
                      ? AppTypography.headlineLg(color: textColors.primaryDefault)
                      : AppTypography.headline3xl(color: textColors.primaryDefault))
                  .copyWith(fontWeight: FontWeight.w800, letterSpacing: -1),
            ),
            const SizedBox(height: AppDimensions.spacingMd),

            // Role in Gold
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
              constraints: const BoxConstraints(maxWidth: 900),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: AppTypography.bodyLg(
                  color: isDark ? textColors.primaryDefault : Colors.grey[600],
                ).copyWith(fontWeight: FontWeight.w500, height: 1.6),
              ),
            ),
            const SizedBox(height: AppDimensions.spacing3xl),

            // Golden divider (The Architect's line)
            Container(
              width: 140,
              height: 3,
              decoration: BoxDecoration(
                color: bgColors.brandSolid,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildShape(double size, double rotation, Brightness brightness) {
    return Pulse(
      duration: const Duration(seconds: 5),
      infinite: true,
      child: Transform.rotate(
        angle: rotation * math.pi / 180,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size * 0.15),
            border: Border.all(
              color: AppColors.backgroundColors(brightness).brandSolid.withOpacity(0.08),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
