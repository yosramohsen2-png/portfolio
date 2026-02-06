import 'package:flutter/material.dart';

abstract class BackgroundColors {
  const BackgroundColors();

  Color get brandLight;
  Color get brandHover;
  Color get brandSolid;
  Color get brandShapes;

  Color get primaryDefault;
  Color get primarySurface;
  Color get primarySecondary;
  Color get primaryHover;
  Color get primaryDisabled;
}
