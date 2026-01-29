import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

class CustomTextField extends StatelessWidget {
  final String? placeholder;
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType? keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    this.placeholder,
    this.controller,
    this.maxLines = 1,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);
    final borderColors = AppColors.borderColors(brightness);

    return Container(
      decoration: BoxDecoration(
        color: bgColors.primaryDefault,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        border: Border.all(
          color: borderColors.primaryDisabled,
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
        style: AppTypography.bodyMd(
          color: textColors.primaryDefault,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: AppTypography.bodyMd(
            color: textColors.brandDisabled,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingMd,
            vertical: AppDimensions.spacingLg,
          ),
        ),
      ),
    );
  }
}

class CustomTextArea extends StatelessWidget {
  final String? placeholder;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomTextArea({
    super.key,
    this.placeholder,
    this.controller,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      placeholder: placeholder,
      controller: controller,
      maxLines: 6,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
