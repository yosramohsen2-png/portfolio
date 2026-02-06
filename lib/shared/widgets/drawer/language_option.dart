import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class LanguageOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color brandColor;

  const LanguageOption({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.brandColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 36,
        decoration: BoxDecoration(
          color: isSelected ? brandColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: AppTypography.bodyMd(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
