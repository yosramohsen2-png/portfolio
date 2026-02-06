import 'package:flutter/material.dart';

class DrawerCloseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color bgColor;

  const DrawerCloseButton({super.key, required this.onPressed, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.close, size: 20),
      ),
    );
  }
}
