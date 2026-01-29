import 'package:flutter/material.dart';

/// App typography system with font sizes, line heights, and text styles
class AppTypography {
  AppTypography._();

  // ============================================================================
  // FONT SIZES
  // ============================================================================

  /// Headline 3XL font size (82)
  static const double fontSizeHeadline3xl = 82;

  /// Headline 2XL font size (72)
  static const double fontSizeHeadline2xl = 72;

  /// Headline XL font size (60)
  static const double fontSizeHeadlineXl = 60;

  /// Headline Large font size (48)
  static const double fontSizeHeadlineLg = 48;

  /// Headline Medium font size (36)
  static const double fontSizeHeadlineMd = 36;

  /// Headline Small font size (30)
  static const double fontSizeHeadlineSm = 30;

  /// Headline Extra Small font size (24)
  static const double fontSizeHeadlineXs = 24;

  /// Body Extra Large font size (20)
  static const double fontSizeBodyXl = 20;

  /// Body Large font size (18)
  static const double fontSizeBodyLg = 18;

  /// Body Medium font size (16)
  static const double fontSizeBodyMd = 16;

  /// Body Small font size (14)
  static const double fontSizeBodySm = 14;

  /// Label Medium font size (14)
  static const double fontSizeLabelMd = 14;

  /// Label Small font size (12)
  static const double fontSizeLabelSm = 12;

  // ============================================================================
  // LINE HEIGHTS
  // ============================================================================

  /// Headline 2XL line height (90)
  static const double lineHeightHeadline2xl = 90;

  /// Headline XL line height (72)
  static const double lineHeightHeadlineXl = 72;

  /// Headline Large line height (60)
  static const double lineHeightHeadlineLg = 60;

  /// Headline Medium line height (44)
  static const double lineHeightHeadlineMd = 44;

  /// Headline Small line height (38)
  static const double lineHeightHeadlineSm = 38;

  /// Headline Extra Small line height (32)
  static const double lineHeightHeadlineXs = 32;

  /// Body Extra Large line height (30)
  static const double lineHeightBodyXl = 30;

  /// Body Large line height (28)
  static const double lineHeightBodyLg = 28;

  /// Body Medium line height (24)
  static const double lineHeightBodyMd = 24;

  /// Body Small line height (20)
  static const double lineHeightBodySm = 20;

  /// Label line height (18)
  static const double lineHeightLabel = 18;

  // ============================================================================
  // TEXT STYLES - HEADLINES
  // ============================================================================

  /// Headline 3XL text style
  static TextStyle headline3xl({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSizeHeadline3xl,
        height: lineHeightHeadline2xl / fontSizeHeadline3xl,
        color: color,
        fontWeight: fontWeight ?? FontWeight.bold,
        letterSpacing: letterSpacing,
      );

  /// Headline 2XL text style
  static TextStyle headline2xl({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSizeHeadline2xl,
        height: lineHeightHeadline2xl / fontSizeHeadline2xl,
        color: color,
        fontWeight: fontWeight ?? FontWeight.bold,
        letterSpacing: letterSpacing,
      );

  /// Headline XL text style
  static TextStyle headlineXl({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSizeHeadlineXl,
        height: lineHeightHeadlineXl / fontSizeHeadlineXl,
        color: color,
        fontWeight: fontWeight ?? FontWeight.bold,
        letterSpacing: letterSpacing,
      );

  /// Headline Large text style
  static TextStyle headlineLg({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSizeHeadlineLg,
        height: lineHeightHeadlineLg / fontSizeHeadlineLg,
        color: color,
        fontWeight: fontWeight ?? FontWeight.bold,
        letterSpacing: letterSpacing,
      );

  /// Headline Medium text style
  static TextStyle headlineMd({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSizeHeadlineMd,
        height: lineHeightHeadlineMd / fontSizeHeadlineMd,
        color: color,
        fontWeight: fontWeight ?? FontWeight.bold,
        letterSpacing: letterSpacing,
      );

  /// Headline Small text style
  static TextStyle headlineSm({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSizeHeadlineSm,
        height: lineHeightHeadlineSm / fontSizeHeadlineSm,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w600,
        letterSpacing: letterSpacing,
      );

  /// Headline Extra Small text style
  static TextStyle headlineXs({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSizeHeadlineXs,
        height: lineHeightHeadlineXs / fontSizeHeadlineXs,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w600,
        letterSpacing: letterSpacing,
      );

  // ============================================================================
  // TEXT STYLES - BODY
  // ============================================================================

  /// Body Extra Large text style
  static TextStyle bodyXl({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSizeBodyXl,
        height: lineHeightBodyXl / fontSizeBodyXl,
        color: color,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: letterSpacing,
      );

  /// Body Large text style
  static TextStyle bodyLg({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSizeBodyLg,
        height: lineHeightBodyLg / fontSizeBodyLg,
        color: color,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: letterSpacing,
      );

  /// Body Medium text style
  static TextStyle bodyMd({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSizeBodyMd,
        height: lineHeightBodyMd / fontSizeBodyMd,
        color: color,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: letterSpacing,
      );

  /// Body Small text style
  static TextStyle bodySm({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSizeBodySm,
        height: lineHeightBodySm / fontSizeBodySm,
        color: color,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: letterSpacing,
      );

  // ============================================================================
  // TEXT STYLES - LABELS
  // ============================================================================

  /// Label Medium text style
  static TextStyle labelMd({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSizeLabelMd,
        height: lineHeightLabel / fontSizeLabelMd,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w500,
        letterSpacing: letterSpacing,
      );

  /// Label Small text style
  static TextStyle labelSm({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSizeLabelSm,
        height: lineHeightLabel / fontSizeLabelSm,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w500,
        letterSpacing: letterSpacing,
      );

  // ============================================================================
  // RESPONSIVE TEXT STYLES
  // ============================================================================

  /// Get responsive headline based on screen width
  static TextStyle responsiveHeadline(
    double width, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    if (width >= 1440) {
      return headline2xl(color: color, fontWeight: fontWeight);
    } else if (width >= 768) {
      return headlineXl(color: color, fontWeight: fontWeight);
    } else if (width >= 375) {
      return headlineLg(color: color, fontWeight: fontWeight);
    } else {
      return headlineMd(color: color, fontWeight: fontWeight);
    }
  }

  /// Get responsive body text based on screen width
  static TextStyle responsiveBody(
    double width, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    if (width >= 1440) {
      return bodyXl(color: color, fontWeight: fontWeight);
    } else if (width >= 768) {
      return bodyLg(color: color, fontWeight: fontWeight);
    } else {
      return bodyMd(color: color, fontWeight: fontWeight);
    }
  }

  // ============================================================================
  // TEXT THEME
  // ============================================================================

  /// Create a complete TextTheme from the typography system
  static TextTheme textTheme({Color? color}) {
    return TextTheme(
      displayLarge: headline3xl(color: color),
      displayMedium: headline2xl(color: color),
      displaySmall: headlineXl(color: color),
      headlineLarge: headlineLg(color: color),
      headlineMedium: headlineMd(color: color),
      headlineSmall: headlineSm(color: color),
      titleLarge: headlineXs(color: color),
      titleMedium: bodyXl(color: color),
      titleSmall: bodyLg(color: color),
      bodyLarge: bodyMd(color: color),
      bodyMedium: bodySm(color: color),
      bodySmall: labelMd(color: color),
      labelLarge: labelMd(color: color),
      labelMedium: labelMd(color: color),
      labelSmall: labelSm(color: color),
    );
  }
}
