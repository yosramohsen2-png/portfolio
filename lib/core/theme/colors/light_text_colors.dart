import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors/color_palette.dart';
import 'package:portfolio/core/theme/colors/text_colors.dart';

class LightTextColors extends TextColors {
  const LightTextColors();

  @override
  Color get brandDefault => ColorPalette.lightTextBrandDefault;
  @override
  Color get brandHover => ColorPalette.lightTextBrandHover;
  @override
  Color get brandDisabled => ColorPalette.lightTextBrandDisabled;

  @override
  Color get primaryDefault => ColorPalette.lightTextPrimaryDefault;
  @override
  Color get primaryHover => ColorPalette.lightTextPrimaryHover;
  @override
  Color get primaryToggle => ColorPalette.lightTextPrimaryToggle;
  @override
  Color get primaryDisabled => ColorPalette.lightTextPrimaryDisabled;
  @override
  Color get primaryDisabled2 => ColorPalette.lightTextPrimaryDisabled2;
  @override
  Color get primaryDisabledCards => ColorPalette.lightTextPrimaryDisabledCards;
  @override
  Color get primaryDisabledToggle => ColorPalette.lightTextPrimaryDisabledToggle;
}
