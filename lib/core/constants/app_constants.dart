/// Core application constants
class AppConstants {
  // App Info
  static const String appName = 'Portfolio';
  static const String appVersion = '1.0.0';
  
  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 300);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 500);
  static const Duration longAnimationDuration = Duration(milliseconds: 800);
  
  // Breakpoints for responsive design
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;
  
  // Padding & Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;
  
  // Border Radius
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  
  // Navigation Routes
  static const String homeRoute = '/';
  static const String uiUxDesignRoute = '/ui-ux-design';
  static const String flutterDevRoute = '/flutter-dev';
  static const String aboutRoute = '/about';
  static const String contactRoute = '/contact';
}
