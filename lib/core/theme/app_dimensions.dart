/// App dimensions including spacing, icon sizes, border radius, border width, and effects
class AppDimensions {
  AppDimensions._();

  // ============================================================================
  // SPACING
  // ============================================================================

  /// No spacing (0)
  static const double spacingNone = 0;

  /// Extra extra small spacing (2)
  static const double spacingXxs = 2;

  /// Extra small spacing (4)
  static const double spacingXs = 4;

  /// Small spacing (6)
  static const double spacingSm = 6;

  /// Medium spacing (8)
  static const double spacingMd = 8;

  /// Large spacing (12)
  static const double spacingLg = 12;

  /// Extra large spacing (16)
  static const double spacingXl = 16;

  /// 2x Extra large spacing (20)
  static const double spacing2xl = 20;

  /// 3x Extra large spacing (24)
  static const double spacing3xl = 24;

  /// 4x Extra large spacing (32)
  static const double spacing4xl = 32;

  /// 5x Extra large spacing (40)
  static const double spacing5xl = 40;

  /// 6x Extra large spacing (60)
  static const double spacing6xl = 60;

  /// 7x Extra large spacing (80)
  static const double spacing7xl = 80;

  /// 8x Extra large spacing (120)
  static const double spacing8xl = 120;

  /// 9x Extra large spacing (160)
  static const double spacing9xl = 160;

  /// 10x Extra large spacing (200)
  static const double spacing10xl = 200;

  // ============================================================================
  // ICON SIZES
  // ============================================================================

  /// 3x Extra small icon (12)
  static const double icon3xs = 12;

  /// 2x Extra small icon (14)
  static const double icon2xs = 14;

  /// Extra small icon (16)
  static const double iconXs = 16;

  /// Small icon (20)
  static const double iconSm = 20;

  /// Medium icon (24)
  static const double iconMd = 24;

  /// Large icon (32)
  static const double iconLg = 32;

  /// Extra large icon (60)
  static const double iconXl = 60;

  /// 2x Extra large icon (80)
  static const double icon2xl = 80;

  // ============================================================================
  // BORDER RADIUS
  // ============================================================================

  /// No border radius (0)
  static const double radiusNone = 0;

  /// Minimal border radius (1)
  static const double radiusNone2 = 1;

  /// 2x Extra small border radius (2)
  static const double radius2xs = 2;

  /// Extra small border radius (4)
  static const double radiusXs = 4;

  /// Small border radius (6)
  static const double radiusSm = 6;

  /// Medium border radius (8)
  static const double radiusMd = 8;

  /// Large border radius (12)
  static const double radiusLg = 12;

  /// Extra large border radius (16)
  static const double radiusXl = 16;

  /// 2x Extra large border radius (20)
  static const double radius2xl = 20;

  /// 3x Extra large border radius (24)
  static const double radius3xl = 24;

  /// Full border radius for circular elements (999)
  static const double radiusFull = 999;

  // ============================================================================
  // BREAKPOINTS
  // ============================================================================

  /// Mobile breakpoint (375)
  static const double breakpointMobile = 375;

  /// Tablet breakpoint (768)
  static const double breakpointTablet = 768;

  /// Desktop breakpoint (1440)
  static const double breakpointDesktop = 1440;

  // ============================================================================
  // BORDER WIDTH
  // ============================================================================

  /// No border (0)
  static const double borderWidthNone = 0;

  /// Extra small border (1)
  static const double borderWidthXs = 1;

  /// Small border (2)
  static const double borderWidthSm = 2;

  /// Medium border (4)
  static const double borderWidthMd = 4;

  /// Large border (6)
  static const double borderWidthLg = 6;

  // ============================================================================
  // EFFECTS (Shadows, Blur, etc.)
  // ============================================================================

  /// No effect (0)
  static const double effectNone = 0;

  /// Extra extra small effect (2)
  static const double effectXxs = 2;

  /// Extra small effect (4)
  static const double effectXs = 4;

  /// Small effect (6)
  static const double effectSm = 6;

  /// Medium effect (8)
  static const double effectMd = 8;

  /// Large effect (12)
  static const double effectLg = 12;

  /// Extra large effect (16)
  static const double effectXl = 16;

  /// 2x Extra large effect (20)
  static const double effect2xl = 20;

  /// 3x Extra large effect (24)
  static const double effect3xl = 24;

  /// 4x Extra large effect (40)
  static const double effect4xl = 40;

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  /// Get responsive spacing based on screen width
  static double responsiveSpacing(double width, {
    double mobile = spacingMd,
    double tablet = spacingLg,
    double desktop = spacingXl,
  }) {
    if (width < breakpointMobile) {
      return mobile;
    } else if (width < breakpointTablet) {
      return tablet;
    } else {
      return desktop;
    }
  }

  /// Get responsive icon size based on screen width
  static double responsiveIconSize(double width, {
    double mobile = iconSm,
    double tablet = iconMd,
    double desktop = iconLg,
  }) {
    if (width < breakpointMobile) {
      return mobile;
    } else if (width < breakpointTablet) {
      return tablet;
    } else {
      return desktop;
    }
  }

  /// Get responsive border radius based on screen width
  static double responsiveRadius(double width, {
    double mobile = radiusSm,
    double tablet = radiusMd,
    double desktop = radiusLg,
  }) {
    if (width < breakpointMobile) {
      return mobile;
    } else if (width < breakpointTablet) {
      return tablet;
    } else {
      return desktop;
    }
  }
}
