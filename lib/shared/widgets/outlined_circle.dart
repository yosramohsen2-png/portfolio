import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class OutlinedCircle extends StatefulWidget {
  final double size;
  final Color color;

  const OutlinedCircle({super.key, required this.size, required this.color});

  @override
  State<OutlinedCircle> createState() => _OutlinedCircleState();
}

class _OutlinedCircleState extends State<OutlinedCircle> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Pulse(
        duration: const Duration(seconds: 10),
        infinite: true,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Main Shape
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _isHovered 
                      ? widget.color.withValues(alpha: 0.4) 
                      : widget.color.withValues(alpha: 0.15),
                  width: 1.0,
                ),
                color: _isHovered 
                    ? widget.color.withValues(alpha: 0.05) 
                    : widget.color.withValues(alpha: 0.02),
              ),
            ),
            // Inner Ring (Simplified)
            Container(
              width: widget.size * 0.7,
              height: widget.size * 0.7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.color.withValues(alpha: 0.04),
                  width: 0.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
