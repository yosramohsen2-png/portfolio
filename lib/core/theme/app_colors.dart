import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors/color_palette.dart';
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

  // LIGHT THEME CONSTANTS (For theme files and legacy code)
  static const lightTextBrandDefault = ColorPalette.lightTextBrandDefault;
  static const lightTextBrandHover = ColorPalette.lightTextBrandHover;
  static const lightTextBrandDisabled = ColorPalette.lightTextBrandDisabled;
  static const lightTextPrimaryDefault = ColorPalette.lightTextPrimaryDefault;
  static const lightTextPrimaryHover = ColorPalette.lightTextPrimaryHover;
  static const lightTextPrimaryToggle = ColorPalette.lightTextPrimaryToggle;
  static const lightTextPrimaryDisabled = ColorPalette.lightTextPrimaryDisabled;
  static const lightTextPrimaryDisabled2 = ColorPalette.lightTextPrimaryDisabled2;
  static const lightTextPrimaryDisabledCards = ColorPalette.lightTextPrimaryDisabledCards;
  static const lightTextPrimaryDisabledToggle = ColorPalette.lightTextPrimaryDisabledToggle;

  static const lightBgBrandLight = ColorPalette.lightBgBrandLight;
  static const lightBgBrandHover = ColorPalette.lightBgBrandHover;
  static const lightBgBrandSolid = ColorPalette.lightBgBrandSolid;
  static const lightBgBrandShapes = ColorPalette.lightBgBrandShapes;
  static const lightBgPrimaryDefault = ColorPalette.lightBgPrimaryDefault;
  static const lightBgPrimarySurface = ColorPalette.lightBgPrimarySurface;
  static const lightBgPrimarySecondary = ColorPalette.lightBgPrimarySecondary;
  static const lightBgPrimaryHover = ColorPalette.lightBgPrimaryHover;
  static const lightBgPrimaryDisabled = ColorPalette.lightBgPrimaryDisabled;

  static const lightIconPrimaryDefault = ColorPalette.lightIconPrimaryDefault;
  static const lightIconPrimaryDefaultChange = ColorPalette.lightIconPrimaryDefaultChange;
  static const lightIconPrimaryHover = ColorPalette.lightIconPrimaryHover;
  static const lightIconPrimaryShape = ColorPalette.lightIconPrimaryShape;

  static const lightBorderPrimaryDefault = ColorPalette.lightBorderPrimaryDefault;
  static const lightBorderPrimaryCards = ColorPalette.lightBorderPrimaryCards;
  static const lightBorderPrimaryDisabled = ColorPalette.lightBorderPrimaryDisabled;

  // DARK THEME CONSTANTS (For theme files and legacy code)
  static const darkTextBrandDefault = ColorPalette.darkTextBrandDefault;
  static const darkTextBrandHover = ColorPalette.darkTextBrandHover;
  static const darkTextBrandDisabled = ColorPalette.darkTextBrandDisabled;
  static const darkTextPrimaryDefault = ColorPalette.darkTextPrimaryDefault;
  static const darkTextPrimaryHover = ColorPalette.darkTextPrimaryHover;
  static const darkTextPrimaryToggle = ColorPalette.darkTextPrimaryToggle;
  static const darkTextPrimaryDisabled = ColorPalette.darkTextPrimaryDisabled;
  static const darkTextPrimaryDisabled2 = ColorPalette.darkTextPrimaryDisabled2;
  static const darkTextPrimaryDisabledCards = ColorPalette.darkTextPrimaryDisabledCards;
  static const darkTextPrimaryDisabledToggle = ColorPalette.darkTextPrimaryDisabledToggle;

  static const darkBgBrandLight = ColorPalette.darkBgBrandLight;
  static const darkBgBrandHover = ColorPalette.darkBgBrandHover;
  static const darkBgBrandSolid = ColorPalette.darkBgBrandSolid;
  static const darkBgBrandShapes = ColorPalette.darkBgBrandShapes;
  static const darkBgPrimaryDefault = ColorPalette.darkBgPrimaryDefault;
  static const darkBgPrimarySurface = ColorPalette.darkBgPrimarySurface;
  static const darkBgPrimarySecondary = ColorPalette.darkBgPrimarySecondary;
  static const darkBgPrimaryHover = ColorPalette.darkBgPrimaryHover;
  static const darkBgPrimaryDisabled = ColorPalette.darkBgPrimaryDisabled;

  static const darkIconPrimaryDefault = ColorPalette.darkIconPrimaryDefault;
  static const darkIconPrimaryDefaultChange = ColorPalette.darkIconPrimaryDefaultChange;
  static const darkIconPrimaryHover = ColorPalette.darkIconPrimaryHover;
  static const darkIconPrimaryShape = ColorPalette.darkIconPrimaryShape;

  static const darkBorderPrimaryDefault = ColorPalette.darkBorderPrimaryDefault;
  static const darkBorderPrimaryCards = ColorPalette.darkBorderPrimaryCards;
  static const darkBorderPrimaryDisabled = ColorPalette.darkBorderPrimaryDisabled;

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
