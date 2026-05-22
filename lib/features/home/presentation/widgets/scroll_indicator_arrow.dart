import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';

/// An animated glowing and bouncing scroll indicator arrow.
/// It automatically fades out after 5 seconds to provide a clean UX
/// and stops its AnimationController to optimize performance.
class ScrollIndicatorArrow extends StatefulWidget {
  const ScrollIndicatorArrow({super.key});

  @override
  State<ScrollIndicatorArrow> createState() => _ScrollIndicatorArrowState();
}

class _ScrollIndicatorArrowState extends State<ScrollIndicatorArrow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _bounceAnimation;
  late final Animation<double> _glowAnimation;
  bool _isVisible = true;
  bool _animationStopped = false;
  Timer? _fadeTimer;
  Timer? _stopTimer;

  @override
  void initState() {
    super.initState();

    // Loop animation for bounce and glow pulse (duration 1.5 seconds)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // Vertical translation (bounce) from 0.0 to 12.0 pixels
    _bounceAnimation = Tween<double>(begin: 0.0, end: 12.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Glow blur radius from 4.0 to 16.0 pixels
    _glowAnimation = Tween<double>(begin: 4.0, end: 16.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.repeat(reverse: true);

    // Start 5 seconds fade out timer
    _fadeTimer = Timer(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _isVisible = false;
        });

        // Wait for the AnimatedOpacity transition (300ms) to complete before stopping controller
        _stopTimer = Timer(const Duration(milliseconds: 300), () {
          if (mounted) {
            _controller.stop();
            setState(() {
              _animationStopped = true;
            });
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _fadeTimer?.cancel();
    _stopTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_animationStopped) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final textColors = AppColors.textColors(theme.brightness);
    final arrowColor = textColors.brandDefault;

    return AnimatedOpacity(
      opacity: _isVisible ? 0.8 : 0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      child: IgnorePointer(
        ignoring: !_isVisible,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _bounceAnimation.value),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: arrowColor.withValues(alpha: 0.4),
                      blurRadius: _glowAnimation.value,
                      spreadRadius: _glowAnimation.value / 4,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.keyboard_double_arrow_down_rounded,
                  color: arrowColor,
                  size: 32,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
