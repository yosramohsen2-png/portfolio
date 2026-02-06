import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors/color_palette.dart';
import 'package:portfolio/core/theme/colors/border_colors.dart';

class LightBorderColors extends BorderColors {
  const LightBorderColors();

  @override
  Color get primaryDefault => ColorPalette.lightBorderPrimaryDefault;
  @override
  Color get primaryCards => ColorPalette.lightBorderPrimaryCards;
  @override
  Color get primaryDisabled => ColorPalette.lightBorderPrimaryDisabled;
}
