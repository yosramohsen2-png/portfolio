import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors/color_palette.dart';
import 'package:portfolio/core/theme/colors/icon_colors.dart';

class DarkIconColors extends IconColors {
  const DarkIconColors();

  @override
  Color get primaryDefault => ColorPalette.darkTextPrimaryDefault;
  @override
  Color get primaryDefaultChange => ColorPalette.darkIconPrimaryDefaultChange;
  @override
  Color get primaryHover => ColorPalette.darkIconPrimaryHover;
  @override
  Color get primaryShape => ColorPalette.darkIconPrimaryShape;
}
