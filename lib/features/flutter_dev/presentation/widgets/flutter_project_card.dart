import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/shared/widgets/badge_group.dart';
import 'package:portfolio/shared/widgets/badge_size.dart';

class FlutterProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> tags;
  final String githubUrl;

  const FlutterProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.tags,
    required this.githubUrl,
  });

  @override
  State<FlutterProjectCard> createState() => _FlutterProjectCardState();
}

class _FlutterProjectCardState extends State<FlutterProjectCard> {
  bool _isHovered = false;

  // Design spec image height: 256px = spacing9xl(192) + spacing6xl(56) + spacingMd(8)
  static const double _imageHeight =
      AppDimensions.spacing9xl + AppDimensions.spacing6xl + AppDimensions.spacingMd;

  Future<void> _launchUrl() async {
    final uri = Uri.parse(widget.githubUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _launchUrl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsetsDirectional.only(
            start: AppDimensions.spacingXs,
            end: AppDimensions.spacingXs,
            bottom: AppDimensions.spacingXl,
          ),
          decoration: BoxDecoration(
            color: bgColors.primaryDefault.withOpacity(0.2),
            borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
            border: Border.all(
              color: _isHovered
                  ? bgColors.brandSolid
                  : borderColors.primaryDisabled,
              width: AppDimensions.borderWidthXs,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: textColors.primaryDefault.withOpacity(0.08),
                      blurRadius: AppDimensions.effectLg,
                      offset: Offset(0, AppDimensions.spacingXs),
                    ),
                  ]
                : [],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              ClipRRect(
                borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
                child: SizedBox(
                  height: _imageHeight,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(color: bgColors.primarySecondary),
                      Positioned.fill(
                        child: AnimatedScale(
                          scale: _isHovered ? 1.05 : 1.0,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                          child: Image.asset(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                _buildErrorPlaceholder(bgColors, textColors),
                          ),
                        ),
                      ),
                      // Dark gradient overlay from bottom (depth on hover)
                      Positioned.fill(
                        child: AnimatedOpacity(
                          opacity: _isHovered ? 0.7 : 0.0,
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

              SizedBox(height: AppDimensions.spacingXl),

              // Content Section
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: AppDimensions.spacingXs,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppDimensions.spacingXl),

              // Tags Section
              BadgeGroup(
                labels: widget.tags,
                size: BadgeSize.small,
              ),
            ],
          ),
        ),
      ),
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
