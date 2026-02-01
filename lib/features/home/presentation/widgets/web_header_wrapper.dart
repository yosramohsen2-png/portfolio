import 'package:flutter/material.dart';
import 'package:portfolio/shared/widgets/web_header.dart';

/// Wrapper for WebHeader to handle callbacks
class WebHeaderWrapper extends StatelessWidget {
  final String selectedRoute;
  final ValueChanged<String> onRouteChanged;
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  const WebHeaderWrapper({
    super.key,
    required this.selectedRoute,
    required this.onRouteChanged,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return WebHeader(
      selectedRoute: selectedRoute,
      onRouteChanged: onRouteChanged,
      selectedLanguage: selectedLanguage,
      onLanguageChanged: onLanguageChanged,
      onThemeToggle: () {}, // ThemeToggle handles itself internally now
    );
  }
}
