import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class ContactTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int maxLines;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const ContactTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bgColors = AppColors.backgroundColors(theme.brightness);
    final textColors = AppColors.textColors(theme.brightness);

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      style: AppTypography.bodyMd(color: textColors.primaryDefault),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTypography.bodyMd(color: isDark ? AppColors.darkTextBrandDisabled : AppColors.lightTextBrandDisabled),
        filled: true,
        fillColor: bgColors.primaryDefault,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? AppColors.darkBorderPrimaryDisabled : AppColors.lightBorderPrimaryDisabled,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? AppColors.darkBgBrandSolid : AppColors.lightBgBrandSolid,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
