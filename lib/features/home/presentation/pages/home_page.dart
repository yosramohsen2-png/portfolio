import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/features/home/presentation/widgets/home_background.dart';
import 'package:portfolio/features/home/presentation/widgets/home_hero_section.dart';
import 'package:portfolio/features/home/presentation/widgets/mobile_header.dart';
import 'package:portfolio/core/theme/theme_cubit.dart';
import 'package:portfolio/shared/widgets/web_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedRoute = '/home';
  String _selectedLanguage = 'en';

  void _onRouteChanged(String route) {
    setState(() {
      _selectedRoute = route;
    });
    // Navigation logic would go here
  }

  void _onLanguageChanged(String lang) {
    setState(() {
      _selectedLanguage = lang;
    });
    // Language change logic would go here
  }

  void _onThemeToggle(BuildContext context) {
    context.read<ThemeCubit>().toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);

    return Scaffold(
      backgroundColor: bgColors.primaryDefault,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWeb = constraints.maxWidth > 900; // Breakpoint for Web Layout

          return Stack(
            children: [
              // 1. Background Decorations
              Positioned.fill(
                child: HomeBackground(isWeb: isWeb),
              ),

              // 2. Main Content
              Column(
                children: [
                  // Header
                  if (isWeb)
                    WebHeader(
                      selectedRoute: _selectedRoute,
                      onRouteChanged: _onRouteChanged,
                      selectedLanguage: _selectedLanguage,
                      onLanguageChanged: _onLanguageChanged,
                      onThemeToggle: () => _onThemeToggle(context),
                    )
                  else
                    MobileHeader(
                      selectedLanguage: _selectedLanguage,
                      onLanguageChanged: _onLanguageChanged,
                      onThemeToggle: () async => _onThemeToggle(context),
                    ),

                  // Scrollable Body
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isWeb ? 0 : 16.0,
                          vertical: isWeb ? 0 : 24.0,
                        ),
                        child: Center(
                          child: Container(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight - (isWeb ? 88 : 64),
                            ),
                            alignment: Alignment.center,
                            child: HomeHeroSection(
                              isWeb: isWeb,
                              onViewUiUx: () {
                                debugPrint("View UI/UX Projects");
                              },
                              onViewFlutter: () {
                                debugPrint("View Flutter Projects");
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
