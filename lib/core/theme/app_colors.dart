import 'package:flutter/material.dart';

/// App color palette with semantic naming for light and dark themes
class AppColors {
  AppColors._();

  // ============================================================================
  // LIGHT THEME COLORS
  // ============================================================================

  /// Light Theme - Text Colors
  static const lightTextBrandDefault = Color(0xFFFDC700);
  static const lightTextBrandHover = Color(0xFFCB9F00);
  static const lightTextBrandDisabled = Color(0xFF7C8692);

  static const lightTextPrimaryDefault = Color(0xFF010207);
  static const lightTextPrimaryHover = Color(0xFF02040A);
  static const lightTextPrimaryToggle = Color(0xFF02040A);
  static const lightTextPrimaryDisabled = Color(0xFF654F00);
  static const lightTextPrimaryDisabled2 = Color(0xFF3E434B);
  static const lightTextPrimaryDisabledCards = Color(0xFF5C6470);
  static const lightTextPrimaryDisabledToggle = Color(0xFF7B8594);

  /// Light Theme - Background Colors
  static const lightBgBrandLight = Color(0xFFFEF1B3);
  static const lightBgBrandHover = Color(0xFFFEE366);
  static const lightBgBrandSolid = Color(0xFFFDC700);
  static const lightBgBrandShapes = Color(0xFFFDC700);

  static const lightBgPrimaryDefault = Color(0xFFF7F8F9);
  static const lightBgPrimarySurface = Color(0xFF5C6470);
  static const lightBgPrimarySecondary = Color(0xFFEBEDF0);
  static const lightBgPrimaryHover = Color(0xFFD1D6DD);
  static const lightBgPrimaryDisabled = Color(0x80FEF1B3); // 50% opacity

  /// Light Theme - Icon Colors
  static const lightIconPrimaryDefault = Color(0xFF030712);
  static const lightIconPrimaryDefaultChange = Color(0xFF030712);
  static const lightIconPrimaryHover = Color(0xFFFDC700);
  static const lightIconPrimaryShape = Color(0x80FEF1B3); // 50% opacity

  /// Light Theme - Border Colors
  static const lightBorderPrimaryDefault = Color(0xFFFDC700);
  static const lightBorderPrimaryCards = Color(0xFFFEE366);
  static const lightBorderPrimaryDisabled = Color(0xFFD9DBDE);

  // ============================================================================
  // DARK THEME COLORS
  // ============================================================================

  /// Dark Theme - Text Colors
  static const darkTextBrandDefault = Color(0xFFFDC700);
  static const darkTextBrandHover = Color(0xFFCB9F00);
  static const darkTextBrandDisabled = Color(0xFF7C8692);

  static const darkTextPrimaryDefault = Color(0xFFD9DBDE);
  static const darkTextPrimaryHover = Color(0xFF7C8692);
  static const darkTextPrimaryToggle = Color(0xFF02050D);
  static const darkTextPrimaryDisabled = Color(0xFFFDC700);
  static const darkTextPrimaryDisabled2 = Color(0xFFA9B1BD);
  static const darkTextPrimaryDisabledCards = Color(0xFF02050D);
  static const darkTextPrimaryDisabledToggle = Color(0xFFB1B6BD);

  /// Dark Theme - Background Colors
  static const darkBgBrandLight = Color(0x80FEF1B3); // 50% opacity
  static const darkBgBrandHover = Color(0xFFFEE366);
  static const darkBgBrandSolid = Color(0xFFFDC700);
  static const darkBgBrandShapes = Color(0xFF654F00);

  static const darkBgPrimaryDefault = Color(0xFF1F2125);
  static const darkBgPrimarySurface = Color(0xFFB7BEC9);
  static const darkBgPrimarySecondary = Color(0xFF3E434B);
  static const darkBgPrimaryHover = Color(0xFF3E434B);
  static const darkBgPrimaryDisabled = Color(0xFFFEF1B3);

  /// Dark Theme - Icon Colors
  static const darkIconPrimaryDefault = Color(0xFF1F2125);
  static const darkIconPrimaryDefaultChange = Color(0xFFA9B1BD);
  static const darkIconPrimaryHover = Color(0xFFFDC700);
  static const darkIconPrimaryShape = Color(0x80FEF1B3); // 50% opacity

  /// Dark Theme - Border Colors
  static const darkBorderPrimaryDefault = Color(0xFFFDC700);
  static const darkBorderPrimaryCards = Color(0xFF654F00);
  static const darkBorderPrimaryDisabled = Color(0xFFEBEDF0);

  // ============================================================================
  // SEMANTIC COLOR HELPERS
  // ============================================================================

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

// ============================================================================
// TEXT COLOR CLASSES
// ============================================================================

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

class LightTextColors extends TextColors {
  const LightTextColors();

  @override
  Color get brandDefault => AppColors.lightTextBrandDefault;
  @override
  Color get brandHover => AppColors.lightTextBrandHover;
  @override
  Color get brandDisabled => AppColors.lightTextBrandDisabled;

  @override
  Color get primaryDefault => AppColors.lightTextPrimaryDefault;
  @override
  Color get primaryHover => AppColors.lightTextPrimaryHover;
  @override
  Color get primaryToggle => AppColors.lightTextPrimaryToggle;
  @override
  Color get primaryDisabled => AppColors.lightTextPrimaryDisabled;
  @override
  Color get primaryDisabled2 => AppColors.lightTextPrimaryDisabled2;
  @override
  Color get primaryDisabledCards => AppColors.lightTextPrimaryDisabledCards;
  @override
  Color get primaryDisabledToggle => AppColors.lightTextPrimaryDisabledToggle;
}

class DarkTextColors extends TextColors {
  const DarkTextColors();

  @override
  Color get brandDefault => AppColors.darkTextBrandDefault;
  @override
  Color get brandHover => AppColors.darkTextBrandHover;
  @override
  Color get brandDisabled => AppColors.darkTextBrandDisabled;

  @override
  Color get primaryDefault => AppColors.darkTextPrimaryDefault;
  @override
  Color get primaryHover => AppColors.darkTextPrimaryHover;
  @override
  Color get primaryToggle => AppColors.darkTextPrimaryToggle;
  @override
  Color get primaryDisabled => AppColors.darkTextPrimaryDisabled;
  @override
  Color get primaryDisabled2 => AppColors.darkTextPrimaryDisabled2;
  @override
  Color get primaryDisabledCards => AppColors.darkTextPrimaryDisabledCards;
  @override
  Color get primaryDisabledToggle => AppColors.darkTextPrimaryDisabledToggle;
}

// ============================================================================
// BACKGROUND COLOR CLASSES
// ============================================================================

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

class LightBackgroundColors extends BackgroundColors {
  const LightBackgroundColors();

  @override
  Color get brandLight => AppColors.lightBgBrandLight;
  @override
  Color get brandHover => AppColors.lightBgBrandHover;
  @override
  Color get brandSolid => AppColors.lightBgBrandSolid;
  @override
  Color get brandShapes => AppColors.lightBgBrandShapes;

  @override
  Color get primaryDefault => AppColors.lightBgPrimaryDefault;
  @override
  Color get primarySurface => AppColors.lightBgPrimarySurface;
  @override
  Color get primarySecondary => AppColors.lightBgPrimarySecondary;
  @override
  Color get primaryHover => AppColors.lightBgPrimaryHover;
  @override
  Color get primaryDisabled => AppColors.lightBgPrimaryDisabled;
}

class DarkBackgroundColors extends BackgroundColors {
  const DarkBackgroundColors();

  @override
  Color get brandLight => AppColors.darkBgBrandLight;
  @override
  Color get brandHover => AppColors.darkBgBrandHover;
  @override
  Color get brandSolid => AppColors.darkBgBrandSolid;
  @override
  Color get brandShapes => AppColors.darkBgBrandShapes;

  @override
  Color get primaryDefault => AppColors.darkBgPrimaryDefault;
  @override
  Color get primarySurface => AppColors.darkBgPrimarySurface;
  @override
  Color get primarySecondary => AppColors.darkBgPrimarySecondary;
  @override
  Color get primaryHover => AppColors.darkBgPrimaryHover;
  @override
  Color get primaryDisabled => AppColors.darkBgPrimaryDisabled;
}

// ============================================================================
// ICON COLOR CLASSES
// ============================================================================

abstract class IconColors {
  const IconColors();

  Color get primaryDefault;
  Color get primaryDefaultChange;
  Color get primaryHover;
  Color get primaryShape;
}

class LightIconColors extends IconColors {
  const LightIconColors();

  @override
  Color get primaryDefault => AppColors.lightIconPrimaryDefault;
  @override
  Color get primaryDefaultChange => AppColors.lightIconPrimaryDefaultChange;
  @override
  Color get primaryHover => AppColors.lightIconPrimaryHover;
  @override
  Color get primaryShape => AppColors.lightIconPrimaryShape;
}

class DarkIconColors extends IconColors {
  const DarkIconColors();

  @override
  Color get primaryDefault => AppColors.darkIconPrimaryDefault;
  @override
  Color get primaryDefaultChange => AppColors.darkIconPrimaryDefaultChange;
  @override
  Color get primaryHover => AppColors.darkIconPrimaryHover;
  @override
  Color get primaryShape => AppColors.darkIconPrimaryShape;
}

// ============================================================================
// BORDER COLOR CLASSES
// ============================================================================

abstract class BorderColors {
  const BorderColors();

  Color get primaryDefault;
  Color get primaryCards;
  Color get primaryDisabled;
}

class LightBorderColors extends BorderColors {
  const LightBorderColors();

  @override
  Color get primaryDefault => AppColors.lightBorderPrimaryDefault;
  @override
  Color get primaryCards => AppColors.lightBorderPrimaryCards;
  @override
  Color get primaryDisabled => AppColors.lightBorderPrimaryDisabled;
}

class DarkBorderColors extends BorderColors {
  const DarkBorderColors();

  @override
  Color get primaryDefault => AppColors.darkBorderPrimaryDefault;
  @override
  Color get primaryCards => AppColors.darkBorderPrimaryCards;
  @override
  Color get primaryDisabled => AppColors.darkBorderPrimaryDisabled;
}
