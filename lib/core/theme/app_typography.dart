import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/typography/font_sizes.dart';
import 'package:portfolio/core/theme/typography/line_heights.dart';

/// App typography system with text styles
class AppTypography {
  AppTypography._();

  // HEADLINES
  static TextStyle headline3xl({Color? color, FontWeight? fontWeight, double? letterSpacing}) =>
      TextStyle(
        fontSize: FontSizes.headline3xl,
        height: LineHeights.headline2xl / FontSizes.headline3xl,
        color: color,
        fontWeight: fontWeight ?? FontWeight.bold,
        letterSpacing: letterSpacing,
      );

  static TextStyle headline2xl({Color? color, FontWeight? fontWeight, double? letterSpacing}) =>
      TextStyle(
        fontSize: FontSizes.headline2xl,
        height: LineHeights.headline2xl / FontSizes.headline2xl,
        color: color,
        fontWeight: fontWeight ?? FontWeight.bold,
        letterSpacing: letterSpacing,
      );

  static TextStyle headlineXl({Color? color, FontWeight? fontWeight, double? letterSpacing}) =>
      TextStyle(
        fontSize: FontSizes.headlineXl,
        height: LineHeights.headlineXl / FontSizes.headlineXl,
        color: color,
        fontWeight: fontWeight ?? FontWeight.bold,
        letterSpacing: letterSpacing,
      );

  static TextStyle headlineLg({Color? color, FontWeight? fontWeight, double? letterSpacing}) =>
      TextStyle(
        fontSize: FontSizes.headlineLg,
        height: LineHeights.headlineLg / FontSizes.headlineLg,
        color: color,
        fontWeight: fontWeight ?? FontWeight.bold,
        letterSpacing: letterSpacing,
      );

  static TextStyle headlineMd({Color? color, FontWeight? fontWeight, double? letterSpacing}) =>
      TextStyle(
        fontSize: FontSizes.headlineMd,
        height: LineHeights.headlineMd / FontSizes.headlineMd,
        color: color,
        fontWeight: fontWeight ?? FontWeight.bold,
        letterSpacing: letterSpacing,
      );

  static TextStyle headlineSm({Color? color, FontWeight? fontWeight, double? letterSpacing}) =>
      TextStyle(
        fontSize: FontSizes.headlineSm,
        height: LineHeights.headlineSm / FontSizes.headlineSm,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w600,
        letterSpacing: letterSpacing,
      );

  static TextStyle headlineXs({Color? color, FontWeight? fontWeight, double? letterSpacing}) =>
      TextStyle(
        fontSize: FontSizes.headlineXs,
        height: LineHeights.headlineXs / FontSizes.headlineXs,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w600,
        letterSpacing: letterSpacing,
      );

  // BODY
  static TextStyle bodyXl({Color? color, FontWeight? fontWeight, double? letterSpacing}) =>
      TextStyle(
        fontSize: FontSizes.bodyXl,
        height: LineHeights.bodyXl / FontSizes.bodyXl,
        color: color,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: letterSpacing,
      );

  static TextStyle bodyLg({Color? color, FontWeight? fontWeight, double? letterSpacing}) =>
      TextStyle(
        fontSize: FontSizes.bodyLg,
        height: LineHeights.bodyLg / FontSizes.bodyLg,
        color: color,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: letterSpacing,
      );

  static TextStyle bodyMd({Color? color, FontWeight? fontWeight, double? letterSpacing}) =>
      TextStyle(
        fontSize: FontSizes.bodyMd,
        height: LineHeights.bodyMd / FontSizes.bodyMd,
        color: color,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: letterSpacing,
      );

  static TextStyle bodySm({Color? color, FontWeight? fontWeight, double? letterSpacing}) =>
      TextStyle(
        fontSize: FontSizes.bodySm,
        height: LineHeights.bodySm / FontSizes.bodySm,
        color: color,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: letterSpacing,
      );

  // LABELS
  static TextStyle labelMd({Color? color, FontWeight? fontWeight, double? letterSpacing}) =>
      TextStyle(
        fontSize: FontSizes.labelMd,
        height: LineHeights.label / FontSizes.labelMd,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w500,
        letterSpacing: letterSpacing,
      );

  static TextStyle labelSm({Color? color, FontWeight? fontWeight, double? letterSpacing}) =>
      TextStyle(
        fontSize: FontSizes.labelSm,
        height: LineHeights.label / FontSizes.labelSm,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w500,
        letterSpacing: letterSpacing,
      );

  // RESPONSIVE STYLES
  static TextStyle responsiveHeadline(double width, {Color? color, FontWeight? fontWeight}) {
    if (width >= 1440) return headline2xl(color: color, fontWeight: fontWeight);
    if (width >= 768) return headlineXl(color: color, fontWeight: fontWeight);
    if (width >= 375) return headlineLg(color: color, fontWeight: fontWeight);
    return headlineMd(color: color, fontWeight: fontWeight);
  }

  static TextStyle responsiveBody(double width, {Color? color, FontWeight? fontWeight}) {
    if (width >= 1440) return bodyXl(color: color, fontWeight: fontWeight);
    if (width >= 768) return bodyLg(color: color, fontWeight: fontWeight);
    return bodyMd(color: color, fontWeight: fontWeight);
  }

  // TEXT THEME
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
