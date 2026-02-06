import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors/color_palette.dart';
import 'package:portfolio/core/theme/colors/background_colors.dart';

class DarkBackgroundColors extends BackgroundColors {
  const DarkBackgroundColors();

  @override
  Color get brandLight => ColorPalette.darkBgBrandLight;
  @override
  Color get brandHover => ColorPalette.darkBgBrandHover;
  @override
  Color get brandSolid => ColorPalette.darkBgBrandSolid;
  @override
  Color get brandShapes => ColorPalette.darkBgBrandShapes;

  @override
  Color get primaryDefault => ColorPalette.darkBgPrimaryDefault;
  @override
  Color get primarySurface => ColorPalette.darkBgPrimarySurface;
  @override
  Color get primarySecondary => ColorPalette.darkBgPrimarySecondary;
  @override
  Color get primaryHover => ColorPalette.darkBgPrimaryHover;
  @override
  Color get primaryDisabled => ColorPalette.darkBgPrimaryDisabled;
}
