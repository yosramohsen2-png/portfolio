import 'package:portfolio/core/theme/dimensions/spacing_dimensions.dart';
import 'package:portfolio/core/theme/dimensions/icon_dimensions.dart';
import 'package:portfolio/core/theme/dimensions/radius_dimensions.dart';
import 'package:portfolio/core/theme/dimensions/breakpoint_dimensions.dart';
import 'package:portfolio/core/theme/dimensions/border_dimensions.dart';
import 'package:portfolio/core/theme/dimensions/effect_dimensions.dart';

/// App dimensions system
class AppDimensions {
  AppDimensions._();

  // SPACING
  static const spacingNone = SpacingDimensions.spacingNone;
  static const spacingXxs = SpacingDimensions.spacingXxs;
  static const spacingXs = SpacingDimensions.spacingXs;
  static const spacingSm = SpacingDimensions.spacingSm;
  static const spacingMd = SpacingDimensions.spacingMd;
  static const spacingLg = SpacingDimensions.spacingLg;
  static const spacingXl = SpacingDimensions.spacingXl;
  static const spacing2xl = SpacingDimensions.spacing2xl;
  static const spacing3xl = SpacingDimensions.spacing3xl;
  static const spacing4xl = SpacingDimensions.spacing4xl;
  static const spacing5xl = SpacingDimensions.spacing5xl;
  static const spacing6xl = SpacingDimensions.spacing6xl;
  static const spacing7xl = SpacingDimensions.spacing7xl;
  static const spacing8xl = SpacingDimensions.spacing8xl;
  static const spacing9xl = SpacingDimensions.spacing9xl;
  static const spacing10xl = SpacingDimensions.spacing10xl;

  // ICON SIZES
  static const icon3xs = IconDimensions.icon3xs;
  static const icon2xs = IconDimensions.icon2xs;
  static const iconXs = IconDimensions.iconXs;
  static const iconSm = IconDimensions.iconSm;
  static const iconMd = IconDimensions.iconMd;
  static const iconLg = IconDimensions.iconLg;
  static const iconXl = IconDimensions.iconXl;
  static const icon2xl = IconDimensions.icon2xl;

  // BORDER RADIUS
  static const radiusNone = RadiusDimensions.radiusNone;
  static const radiusNone2 = RadiusDimensions.radiusNone2;
  static const radius2xs = RadiusDimensions.radius2xs;
  static const radiusXs = RadiusDimensions.radiusXs;
  static const radiusSm = RadiusDimensions.radiusSm;
  static const radiusMd = RadiusDimensions.radiusMd;
  static const radiusLg = RadiusDimensions.radiusLg;
  static const radiusXl = RadiusDimensions.radiusXl;
  static const radius2xl = RadiusDimensions.radius2xl;
  static const radius3xl = RadiusDimensions.radius3xl;
  static const radiusFull = RadiusDimensions.radiusFull;

  // BREAKPOINTS
  static const breakpointMobile = BreakpointDimensions.mobile;
  static const breakpointTablet = BreakpointDimensions.tablet;
  static const breakpointDesktop = BreakpointDimensions.desktop;

  // BORDER WIDTH
  static const borderWidthNone = BorderDimensions.borderWidthNone;
  static const borderWidthXs = BorderDimensions.borderWidthXs;
  static const borderWidthSm = BorderDimensions.borderWidthSm;
  static const borderWidthMd = BorderDimensions.borderWidthMd;
  static const borderWidthLg = BorderDimensions.borderWidthLg;

  // EFFECTS
  static const effectNone = EffectDimensions.effectNone;
  static const effectXxs = EffectDimensions.effectXxs;
  static const effectXs = EffectDimensions.effectXs;
  static const effectSm = EffectDimensions.effectSm;
  static const effectMd = EffectDimensions.effectMd;
  static const effectLg = EffectDimensions.effectLg;
  static const effectXl = EffectDimensions.effectXl;
  static const effect2xl = EffectDimensions.effect2xl;
  static const effect3xl = EffectDimensions.effect3xl;
  static const effect4xl = EffectDimensions.effect4xl;

  // RESPONSIVE METHODS
  static double responsiveSpacing(double width, {double mobile = spacingMd, double tablet = spacingLg, double desktop = spacingXl}) {
    if (width < breakpointMobile) return mobile;
    if (width < breakpointTablet) return tablet;
    return desktop;
  }

  static double responsiveIconSize(double width, {double mobile = iconSm, double tablet = iconMd, double desktop = iconLg}) {
    if (width < breakpointMobile) return mobile;
    if (width < breakpointTablet) return tablet;
    return desktop;
  }

  static double responsiveRadius(double width, {double mobile = radiusSm, double tablet = radiusMd, double desktop = radiusLg}) {
    if (width < breakpointMobile) return mobile;
    if (width < breakpointTablet) return tablet;
    return desktop;
  }
}
