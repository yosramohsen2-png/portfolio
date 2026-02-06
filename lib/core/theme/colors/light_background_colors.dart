import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors/color_palette.dart';
import 'package:portfolio/core/theme/colors/background_colors.dart';

class LightBackgroundColors extends BackgroundColors {
  const LightBackgroundColors();

  @override
  Color get brandLight => ColorPalette.lightBgBrandLight;
  @override
  Color get brandHover => ColorPalette.lightBgBrandHover;
  @override
  Color get brandSolid => ColorPalette.lightBgBrandSolid;
  @override
  Color get brandShapes => ColorPalette.lightBgBrandShapes;

  @override
  Color get primaryDefault => ColorPalette.lightBgPrimaryDefault;
  @override
  Color get primarySurface => ColorPalette.lightBgPrimarySurface;
  @override
  Color get primarySecondary => ColorPalette.lightBgPrimarySecondary;
  @override
  Color get primaryHover => ColorPalette.lightBgPrimaryHover;
  @override
  Color get primaryDisabled => ColorPalette.lightBgPrimaryDisabled;
}
