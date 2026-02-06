import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors/color_palette.dart';
import 'package:portfolio/core/theme/colors/border_colors.dart';

class DarkBorderColors extends BorderColors {
  const DarkBorderColors();

  @override
  Color get primaryDefault => ColorPalette.darkBorderPrimaryDefault;
  @override
  Color get primaryCards => ColorPalette.darkBorderPrimaryCards;
  @override
  Color get primaryDisabled => ColorPalette.darkBorderPrimaryDisabled;
}
