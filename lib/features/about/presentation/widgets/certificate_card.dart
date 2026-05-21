import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/core/theme/colors/color_palette.dart';

/// Card widget displaying a single certificate image with title and description.
/// On tap → opens a full-screen dialog preview of the certificate.
class CertificateCard extends StatefulWidget {
  final String assetPath;
  final String title;
  final String description;

  const CertificateCard({
    super.key,
    required this.assetPath,
    required this.title,
    required this.description,
  });

  @override
  State<CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<CertificateCard> {
  bool _isHovered = false;

  void _openPreview(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (ctx) => _CertificatePreviewDialog(assetPath: widget.assetPath),
    );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
    final textColors = AppColors.textColors(brightness);
    final isDark = brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _openPreview(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: bgColors.primaryDefault,
            borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
            border: Border.all(
              color: _isHovered
                  ? borderColors.primaryDefault
                  : borderColors.primaryDisabled,
              width: _isHovered
                  ? AppDimensions.borderWidthSm
                  : AppDimensions.borderWidthXs,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: isDark
                          ? ColorPalette.darkTextBrandDefault.withValues(
                              alpha: 0.25,
                            )
                          : ColorPalette.lightBorderPrimaryDefault.withValues(
                              alpha: 0.3,
                            ),
                      blurRadius: AppDimensions.effect2xl,
                      spreadRadius: 2,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: AppDimensions.effectMd,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Certificate Image
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.radius3xl),
                  topRight: Radius.circular(AppDimensions.radius3xl),
                ),
                child: AnimatedScale(
                  scale: _isHovered ? 1.03 : 1.0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  child: AspectRatio(
                    aspectRatio: 1.414, // A4 landscape ratio
                    child: Image.asset(widget.assetPath, fit: BoxFit.cover),
                  ),
                ),
              ),

              // Text Content
              Padding(
                padding: const EdgeInsets.all(AppDimensions.spacing3xl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tap hint badge
                    Row(
                      children: [
                        Icon(
                          Icons.open_in_full_rounded,
                          size: AppDimensions.iconXs,
                          color: textColors.brandDefault,
                        ),
                        const SizedBox(width: AppDimensions.spacingXs),
                        Text(
                          'Tap to view',
                          style: AppTypography.labelSm(
                            color: textColors.brandDefault,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.spacingMd),

                    // Title
                    Text(
                      widget.title,
                      style: AppTypography.headlineXs(
                        color: textColors.primaryDefault,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppDimensions.spacingSm),

                    // Description
                    Text(
                      widget.description,
                      style: AppTypography.bodySm(
                        color: textColors.primaryDisabled2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Full-screen dialog to preview the certificate image
class _CertificatePreviewDialog extends StatelessWidget {
  final String assetPath;

  const _CertificatePreviewDialog({required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Stack(
          children: [
            // Centered zoomable image
            Center(
              child: GestureDetector(
                onTap: () {}, // Prevent closing when tapping image
                child: InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 60,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusLg,
                      ),
                      child: Image.asset(assetPath, fit: BoxFit.contain),
                    ),
                  ),
                ),
              ),
            ),

            // Close Button top-right
            Positioned(
              top: 48,
              right: 24,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),

            // Hint text bottom
            Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Tap anywhere outside to close  •  Pinch to zoom',
                  style: AppTypography.bodySm(
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
