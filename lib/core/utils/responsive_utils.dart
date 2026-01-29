import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Utility class for responsive design
class ResponsiveUtils {
  /// Check if device is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < AppConstants.mobileBreakpoint;
  }

  /// Check if device is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppConstants.mobileBreakpoint &&
        width < AppConstants.desktopBreakpoint;
  }

  /// Check if device is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppConstants.desktopBreakpoint;
  }

  /// Get responsive value based on screen size
  static T getResponsiveValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context) && desktop != null) {
      return desktop;
    } else if (isTablet(context) && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }

  /// Get responsive padding
  static double getResponsivePadding(BuildContext context) {
    if (isDesktop(context)) {
      return AppConstants.paddingXLarge;
    } else if (isTablet(context)) {
      return AppConstants.paddingLarge;
    } else {
      return AppConstants.paddingMedium;
    }
  }

  /// Get max content width for desktop
  static double getMaxContentWidth(BuildContext context) {
    if (isDesktop(context)) {
      return 1200;
    } else if (isTablet(context)) {
      return 900;
    } else {
      return double.infinity;
    }
  }
}
