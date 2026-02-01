import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class HomeBackground extends StatelessWidget {
  final bool isWeb;
  final ValueListenable<double> scrollOffsetListenable;
  final ValueListenable<Offset> mouseOffsetListenable;

  const HomeBackground({
    super.key,
    this.isWeb = false,
    required this.scrollOffsetListenable,
    required this.mouseOffsetListenable,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);

    return ValueListenableBuilder<double>(
      valueListenable: scrollOffsetListenable,
      builder: (context, scrollOffset, _) {
        return ValueListenableBuilder<Offset>(
          valueListenable: mouseOffsetListenable,
          builder: (context, mouseOffset, _) {
            return Stack(
              children: [
                if (!isWeb) ...[
                  // Mobile: Large Faded Logo in background
                  Center(
                    child: Opacity(
                      opacity: 0.12, // Increased visibility
                      child: Image.asset(
                        AppAssets.logo,
                        width: 400,
                        height: 400,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high, // Improve scaling quality
                        isAntiAlias: true,
                      ),
                    ),
                  ),
                ],
                
                if (isWeb) ...[
                  // Web: Three large circles with parallax and mouse tracking
                  Positioned(
                    left: -100 + (mouseOffset.dx * 0.04),
                    top: 100 - (scrollOffset * 0.6) + (mouseOffset.dy * 0.04),
                    child: _OutlinedCircle(size: 500, color: bgColors.brandShapes),
                  ),
                  Positioned(
                    right: -200 - (mouseOffset.dx * 0.06),
                    bottom: -100 + (scrollOffset * 0.9) - (mouseOffset.dy * 0.06),
                    child: _OutlinedCircle(size: 700, color: bgColors.brandShapes),
                  ),
                  Positioned(
                    left: 400 + (mouseOffset.dx * 0.03),
                    top: 400 - (scrollOffset * 0.4) + (mouseOffset.dy * 0.03),
                    child: _OutlinedCircle(size: 600, color: bgColors.brandShapes),
                  ),
                ] else ...[
                  // Mobile: Noticeable parallax
                  Positioned(
                    left: -50,
                    top: 150 - (scrollOffset * 0.5),
                    child: _OutlinedCircle(size: 300, color: bgColors.brandShapes),
                  ),
                  Positioned(
                    right: -100,
                    bottom: 100 + (scrollOffset * 0.7),
                    child: _OutlinedCircle(size: 400, color: bgColors.brandShapes),
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }
}

class _OutlinedCircle extends StatefulWidget {
  final double size;
  final Color color;

  const _OutlinedCircle({required this.size, required this.color});

  @override
  State<_OutlinedCircle> createState() => _OutlinedCircleState();
}

class _OutlinedCircleState extends State<_OutlinedCircle> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _isHovered ? widget.color.withOpacity(0.5) : widget.color.withOpacity(0.25), // Increased border opacity
            width: 1.5,
          ),
          color: _isHovered ? widget.color.withOpacity(0.08) : widget.color.withOpacity(0.03), // Added subtle fill
        ),
      ),
    );
  }
}
