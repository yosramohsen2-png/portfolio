import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/localization/locale_cubit.dart';
import 'package:portfolio/features/home/presentation/widgets/home_background.dart';
import 'package:portfolio/features/home/presentation/widgets/home_hero_section.dart';
import 'package:portfolio/features/home/presentation/widgets/mobile_header.dart';
import 'package:portfolio/features/home/presentation/widgets/web_header_wrapper.dart';

/// Main content container for HomePage
/// Handles responsive layout switching between Mobile and Web
class HomeContent extends StatefulWidget {
  final bool isWeb;
  final BoxConstraints constraints;

  const HomeContent({
    super.key,
    required this.isWeb,
    required this.constraints,
  });

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String _selectedRoute = '/home';

  void _onRouteChanged(String route) {
    setState(() => _selectedRoute = route);
  }

  void _onLanguageChanged(String lang) {
    debugPrint("Language changed to: $lang");
    // Use LocaleCubit to change language globally
    if (lang == 'en') {
      debugPrint("Setting English...");
      context.read<LocaleCubit>().setEnglish();
    } else if (lang == 'de') {
      debugPrint("Setting German...");
      context.read<LocaleCubit>().setGerman();
    }
  }

  void _onViewUiUx() {
    debugPrint("View UI/UX Projects");
    // Navigate to UI/UX page
  }

  void _onViewFlutter() {
    debugPrint("View Flutter Projects");
    // Navigate to Flutter page
  }

  @override
  Widget build(BuildContext context) {
    // Watch LocaleCubit to get current language
    final localeState = context.watch<LocaleCubit>().state;
    final selectedLanguage = localeState.locale.languageCode;

    return Stack(
      children: [
        // Background Decorations
        Positioned.fill(
          child: HomeBackground(isWeb: widget.isWeb),
        ),

        // Main Content Column
        Column(
          children: [
            // Header
            _buildHeader(selectedLanguage),

            // Body
            Expanded(
              child: _buildBody(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader(String selectedLanguage) {
    if (widget.isWeb) {
      return WebHeaderWrapper(
        selectedRoute: _selectedRoute,
        onRouteChanged: _onRouteChanged,
        selectedLanguage: selectedLanguage,
        onLanguageChanged: _onLanguageChanged,
      );
    } else {
      return MobileHeader(
        selectedLanguage: selectedLanguage,
        onLanguageChanged: _onLanguageChanged,
      );
    }
  }

  Widget _buildBody() {
    // Mobile: padding 16 horizontal, 120 vertical (gap in CSS)
    // Web: padding 40 horizontal, 80 vertical gap
    final horizontalPadding = widget.isWeb ? 40.0 : 16.0;
    final verticalPadding = widget.isWeb ? 80.0 : 120.0;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Center(
          child: HomeHeroSection(
            isWeb: widget.isWeb,
            onViewUiUx: _onViewUiUx,
            onViewFlutter: _onViewFlutter,
          ),
        ),
      ),
    );
  }
}
