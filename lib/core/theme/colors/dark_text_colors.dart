import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors/color_palette.dart';
import 'package:portfolio/core/theme/colors/text_colors.dart';

class DarkTextColors extends TextColors {
  const DarkTextColors();

  @override
  Color get brandDefault => ColorPalette.darkTextBrandDefault;
  @override
  Color get brandHover => ColorPalette.darkTextBrandHover;
  @override
  Color get brandDisabled => ColorPalette.darkTextBrandDisabled;

  @override
  Color get primaryDefault => ColorPalette.darkTextPrimaryDefault;
  @override
  Color get primaryHover => ColorPalette.darkTextPrimaryHover;
  @override
  Color get primaryToggle => ColorPalette.darkTextPrimaryToggle;
  @override
  Color get primaryDisabled => ColorPalette.darkTextPrimaryDisabled;
  @override
  Color get primaryDisabled2 => ColorPalette.darkTextPrimaryDisabled2;
  @override
  Color get primaryDisabledCards => ColorPalette.darkTextPrimaryDisabledCards;
  @override
  Color get primaryDisabledToggle => ColorPalette.darkTextPrimaryDisabledToggle;
}
