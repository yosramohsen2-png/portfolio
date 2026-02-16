import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/shared/widgets/badge_size.dart';
import 'package:portfolio/shared/widgets/badge_group.dart';

class ProjectCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final List<String> tags;
  final VoidCallback? onTap;

  const ProjectCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.tags,
    this.onTap,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isImageHovered = false;

  // Design spec image height: 256px = spacing9xl(192) + spacing6xl(56) + spacingMd(8)
  static const double _imageHeight =
      AppDimensions.spacing9xl + AppDimensions.spacing6xl + AppDimensions.spacingMd;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
    final isNetworkImage = widget.imageUrl.startsWith('http');

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        // Card container: padding top:4, bottom:16, left:4, right:4
        padding: EdgeInsetsDirectional.only(
          top: AppDimensions.spacingXs,
          bottom: AppDimensions.spacingXl,
          start: AppDimensions.spacingXs,
          end: AppDimensions.spacingXs,
        ),
        decoration: BoxDecoration(
          // background: primaryDefault with 0.20 opacity
          color: bgColors.primaryDefault.withOpacity(0.2),
          borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
          // border: 1px borderPrimaryDisabled
          border: Border.all(
            color: borderColors.primaryDisabled,
            width: AppDimensions.borderWidthXs,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section with hover (zoom + shadow + dark gradient)
            MouseRegion(
              onEnter: (_) => setState(() => _isImageHovered = true),
              onExit: (_) => setState(() => _isImageHovered = false),
              cursor: SystemMouseCursors.click,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
                  boxShadow: _isImageHovered
                      ? [
                          BoxShadow(
                            color: textColors.primaryDefault.withOpacity(0.15),
                            blurRadius: AppDimensions.effect2xl,
                            offset: Offset(0, AppDimensions.spacingSm),
                          ),
                        ]
                      : [],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
                  child: Stack(
                    children: [
                      // Image with zoom
                      AnimatedScale(
                        scale: _isImageHovered ? 1.05 : 1.0,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                        child: _buildImage(isNetworkImage, bgColors, textColors),
                      ),
                      // Dark gradient overlay from bottom (depth effect)
                      Positioned.fill(
                        child: AnimatedOpacity(
                          opacity: _isImageHovered ? 0.7 : 0.0,
                          duration: const Duration(milliseconds: 400),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: const [0.3, 1.0],
                                colors: [
                                  textColors.primaryDefault.withOpacity(0.0),
                                  textColors.primaryDefault.withOpacity(0.87),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: AppDimensions.spacingXl),

            // Content section: padding 4px horizontal
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: AppDimensions.spacingXs,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title: headlineXs (24px/32px, w700)
                  SizedBox(
                    height: AppDimensions.spacing6xl + AppDimensions.spacingXs,
                    child: Text(
                      widget.title,
                      style: AppTypography.headlineXs(
                        color: textColors.primaryDefault,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  SizedBox(height: AppDimensions.spacingMd),

                  // Description: bodyMd (16px/24px, w500)
                  Text(
                    widget.description,
                    style: AppTypography.bodyMd(
                      color: textColors.brandDisabled,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppDimensions.spacingXl),

            // Tags section
            BadgeGroup(
              labels: widget.tags,
              size: BadgeSize.small,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(bool isNetworkImage, dynamic bgColors, dynamic textColors) {
    if (isNetworkImage) {
      return Image.network(
        widget.imageUrl,
        width: double.infinity,
        height: _imageHeight,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            _buildErrorPlaceholder(bgColors, textColors),
      );
    }
    return Image.asset(
      widget.imageUrl,
      width: double.infinity,
      height: _imageHeight,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) =>
          _buildErrorPlaceholder(bgColors, textColors),
    );
  }

  Widget _buildErrorPlaceholder(dynamic bgColors, dynamic textColors) {
    return Container(
      width: double.infinity,
      height: _imageHeight,
      color: bgColors.primarySecondary,
      child: Icon(
        Icons.image_outlined,
        size: AppDimensions.iconXl,
        color: textColors.brandDisabled,
      ),
    );
  }
}
