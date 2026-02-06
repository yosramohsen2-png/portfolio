import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors/text_colors.dart';
import 'package:portfolio/core/theme/colors/light_text_colors.dart';
import 'package:portfolio/core/theme/colors/dark_text_colors.dart';
import 'package:portfolio/core/theme/colors/background_colors.dart';
import 'package:portfolio/core/theme/colors/light_background_colors.dart';
import 'package:portfolio/core/theme/colors/dark_background_colors.dart';
import 'package:portfolio/core/theme/colors/icon_colors.dart';
import 'package:portfolio/core/theme/colors/light_icon_colors.dart';
import 'package:portfolio/core/theme/colors/dark_icon_colors.dart';
import 'package:portfolio/core/theme/colors/border_colors.dart';
import 'package:portfolio/core/theme/colors/light_border_colors.dart';
import 'package:portfolio/core/theme/colors/dark_border_colors.dart';

/// App color system entry point
class AppColors {
  AppColors._();

  /// Get text colors based on brightness
  static TextColors textColors(Brightness brightness) {
    return brightness == Brightness.light
        ? const LightTextColors()
        : const DarkTextColors();
  }

  /// Get background colors based on brightness
  static BackgroundColors backgroundColors(Brightness brightness) {
    return brightness == Brightness.light
        ? const LightBackgroundColors()
        : const DarkBackgroundColors();
  }

  /// Get icon colors based on brightness
  static IconColors iconColors(Brightness brightness) {
    return brightness == Brightness.light
        ? const LightIconColors()
        : const DarkIconColors();
  }

  /// Get border colors based on brightness
  static BorderColors borderColors(Brightness brightness) {
    return brightness == Brightness.light
        ? const LightBorderColors()
        : const DarkBorderColors();
  }
}
