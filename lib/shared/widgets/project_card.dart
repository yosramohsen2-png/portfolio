import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/shared/widgets/badge_size.dart';
import 'package:portfolio/shared/widgets/badge_group.dart';

class ProjectCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final List<String> tags;
  final VoidCallback? onTap;
  final bool hasGradientOverlay;

  const ProjectCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.tags,
    this.onTap,
    this.hasGradientOverlay = false,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColors.primaryDefault,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.radius3xl),
            topRight: Radius.circular(AppDimensions.radius3xl),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.radius3xl),
                topRight: Radius.circular(AppDimensions.radius3xl),
              ),
              child: Stack(
                children: [
                  Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 256,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 256,
                        color: bgColors.primarySecondary,
                        child: Icon(
                          Icons.image_outlined,
                          size: 64,
                          color: textColors.brandDisabled,
                        ),
                      );
                    },
                  ),
                  if (hasGradientOverlay)
                    Container(
                      width: 319,
                      height: 256,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            const Color(0xFF031207),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Content
            Padding(
              padding: EdgeInsets.all(AppDimensions.spacingLg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  SizedBox(
                    height: 64,
                    child: Text(
                      title,
                      style: AppTypography.headlineXs(
                        color: textColors.primaryDefault,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: AppDimensions.spacingMd),

                  // Description
                  Text(
                    description,
                    style: AppTypography.bodyMd(
                      color: textColors.brandDisabled,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppDimensions.spacingXl),

                  // Tags
                  BadgeGroup(
                    labels: tags,
                    size: BadgeSize.small,
                  ),
                  SizedBox(height: AppDimensions.spacingXl),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
