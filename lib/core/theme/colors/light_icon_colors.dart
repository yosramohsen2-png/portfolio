import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors/color_palette.dart';
import 'package:portfolio/core/theme/colors/icon_colors.dart';

class LightIconColors extends IconColors {
  const LightIconColors();

  @override
  Color get primaryDefault => ColorPalette.lightIconPrimaryDefault;
  @override
  Color get primaryDefaultChange => ColorPalette.lightIconPrimaryDefaultChange;
  @override
  Color get primaryHover => ColorPalette.lightIconPrimaryHover;
  @override
  Color get primaryShape => ColorPalette.lightIconPrimaryShape;
}
