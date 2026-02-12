import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/shared/widgets/badge.dart' as shared_badge;
import 'package:portfolio/shared/widgets/badge_size.dart';

class CustomProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> tags;
  final String? githubUrl;
  final String? behanceUrl;
  final bool isNetworkImage;

  const CustomProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.tags,
    this.githubUrl,
    this.behanceUrl,
    this.isNetworkImage = false,
  });

  @override
  State<CustomProjectCard> createState() => _CustomProjectCardState();
}

class _CustomProjectCardState extends State<CustomProjectCard> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    final url = widget.behanceUrl ?? widget.githubUrl;
    if (url == null) return;
    final uri = Uri.parse(url);
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
      cursor: (widget.githubUrl != null || widget.behanceUrl != null) 
          ? SystemMouseCursors.click 
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: _launchUrl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: bgColors.primaryDefault,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: borderColors.primaryDisabled,
              width: 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    )
                  ]
                : [],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: Stack(
                    children: [
                      Container(color: bgColors.primarySecondary),
                      Positioned.fill(
                        child: AnimatedScale(
                          scale: _isHovered ? 1.05 : 1.0,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOutCubic,
                          child: widget.isNetworkImage 
                            ? Image.network(widget.imageUrl, fit: BoxFit.cover)
                            : Image.asset(widget.imageUrl, fit: BoxFit.cover),
                        ),
                      ),
                      // Hover Overlay
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: _isHovered ? 1.0 : 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withValues(alpha: 0.4),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Content Section
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: AppTypography.headlineSm(color: textColors.primaryDefault)
                          .copyWith(fontWeight: FontWeight.w700),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.description,
                      style: AppTypography.bodySm(color: textColors.primaryDisabled2)
                          .copyWith(height: 1.4),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                    // Tags Section
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.tags.map((tag) => shared_badge.Badge(
                        label: tag,
                        size: BadgeSize.small,
                      )).toList(),
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
