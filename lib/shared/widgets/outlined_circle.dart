import 'package:flutter/material.dart';

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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _isHovered 
                ? widget.color.withValues(alpha: 0.5) 
                : widget.color.withValues(alpha: 0.25),
            width: 1.5,
          ),
          color: _isHovered 
              ? widget.color.withValues(alpha: 0.08) 
              : widget.color.withValues(alpha: 0.03),
        ),
      ),
    );
  }
}
