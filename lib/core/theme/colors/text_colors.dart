import 'package:flutter/material.dart';

abstract class TextColors {
  const TextColors();

  Color get brandDefault;
  Color get brandHover;
  Color get brandDisabled;

  Color get primaryDefault;
  Color get primaryHover;
  Color get primaryToggle;
  Color get primaryDisabled;
  Color get primaryDisabled2;
  Color get primaryDisabledCards;
  Color get primaryDisabledToggle;
}
