import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class HomeBackground extends StatelessWidget {
  final bool isWeb;

  const HomeBackground({super.key, this.isWeb = false});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);

    return Stack(
      children: [
        if (!isWeb) ...[
          // Mobile: Large Faded Logo in background
          Center(
            child: Opacity(
              opacity: 0.03, // Very faded as in design
              child: Image.asset(
                AppAssets.logo,
                width: 400,
                height: 400,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
        
        // Web & Mobile: Outlined Circles (Border only)
        if (isWeb) ...[
          // Three large circles staggered
          Positioned(
            left: -100,
            top: 100,
            child: _OutlinedCircle(size: 500, color: bgColors.brandShapes),
          ),
          Positioned(
            right: -200,
            bottom: -100,
            child: _OutlinedCircle(size: 700, color: bgColors.brandShapes),
          ),
          Positioned(
            left: 400,
            top: 200,
            child: _OutlinedCircle(size: 600, color: bgColors.brandShapes),
          ),
        ] else ...[
          // Mobile: Fewer/Smaller outlined shapes if needed
          Positioned(
            left: -50,
            top: 50,
            child: _OutlinedCircle(size: 300, color: bgColors.brandShapes),
          ),
          Positioned(
            right: -100,
            bottom: 50,
            child: _OutlinedCircle(size: 400, color: bgColors.brandShapes),
          ),
        ],
      ],
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
            color: _isHovered ? widget.color.withOpacity(0.4) : widget.color.withOpacity(0.1),
            width: 1,
          ),
          color: _isHovered ? widget.color.withOpacity(0.02) : Colors.transparent,
        ),
      ),
    );
  }
}
