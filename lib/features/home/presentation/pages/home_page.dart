import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/shared/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedRoute = '/home';
  String _selectedLanguage = 'en';
  // Mock data for choice button
  String _selectedExperienceType = 'Experience';

  void _onRouteChanged(String route) {
    setState(() => _selectedRoute = route);
    // TODO: Implement actual navigation
  }

  void _onLanguageChanged(String lang) {
    setState(() => _selectedLanguage = lang);
    // TODO: Implement localization
  }

  void _onThemeToggle() {
    // TODO: Implement theme toggling
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);

    return Scaffold(
      backgroundColor: bgColors.primaryDefault,
      drawer: !isDesktop
          ? MobileNavDrawer(
              selectedRoute: _selectedRoute,
              selectedLanguage: _selectedLanguage,
              onRouteChanged: _onRouteChanged,
              onLanguageChanged: _onLanguageChanged,
              onThemeToggle: _onThemeToggle,
            )
          : null,
      body: Column(
        children: [
          // Header
          if (isDesktop)
            WebHeader(
              selectedRoute: _selectedRoute,
              onRouteChanged: _onRouteChanged,
              selectedLanguage: _selectedLanguage,
              onLanguageChanged: _onLanguageChanged,
              onThemeToggle: _onThemeToggle,
            )
          else
            MobileHeader(
              onMenuTap: () => Scaffold.of(context).openDrawer(),
              onThemeToggle: _onThemeToggle,
            ),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 120 : AppDimensions.spacingMd,
                vertical: AppDimensions.spacing3xl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Section
                  HeroSection(
                    greeting: "Hello, I'm",
                    name: "Your Name",
                    subtitle: "UI/UX Designer & Flutter Developer",
                    description:
                        "Crafting beautiful digital experiences with user-centered design and powerful mobile applications.",
                    size: isDesktop
                        ? HeroSectionSize.large
                        : width >= 768
                            ? HeroSectionSize.medium
                            : HeroSectionSize.small,
                    alignment:
                        isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                    highlightLastWord: true,
                  ),
                  SizedBox(height: isDesktop ? 80 : 40),

                  // Choice Button (Experience/Skills)
                   Center(
                     child: ChoiceButton(
                      options: const ['Experience', 'Skills', 'Values'],
                      selectedOption: _selectedExperienceType,
                      onOptionSelected: (val) =>
                          setState(() => _selectedExperienceType = val),
                                     ),
                   ),
                   SizedBox(height: isDesktop ? 60 : 30),

                  // Projects Grid
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final cardWidth = isDesktop ? 350.0 : constraints.maxWidth;
                      // Simple wrap layout for demo
                      return Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        alignment: WrapAlignment.center,
                        children: [
                          ProjectCard(
                            imageUrl: 'https://placehold.co/600x400/png',
                            title: 'E-Commerce Platform',
                            description:
                                'Complete redesign of a modern e-commerce platform with focus on user journey.',
                            tags: const ['Figma', 'User Research', 'Prototyping'],
                            hasGradientOverlay: true,
                          ),
                          ProjectCard(
                            imageUrl: 'https://placehold.co/600x400/000000/FFFFFF/png',
                            title: 'Finance Dashboard',
                            description:
                                'Real-time financial tracking dashboard for personal wealth management.',
                            tags: const ['Flutter', 'Bloc', 'Clean Arch'],
                          ),
                           ProjectCard(
                            imageUrl: 'https://placehold.co/600x400/png',
                            title: 'Health & Fitness App',
                            description:
                                'Mobile application for tracking workouts and nutrition plans.',
                            tags: const ['UI Design', 'Mobile Dev'],
                          ),
                        ],
                      );
                    },
                  ),
                  
                  SizedBox(height: isDesktop ? 80 : 40),
                  
                  // Services Section Title
                  Center(
                    child: Text(
                      "What I Do",
                      style: isDesktop 
                          ? AppTypography.headline2xl(fontWeight: FontWeight.w700)
                          : AppTypography.headlineMd(fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: isDesktop ? 60 : 30),
                  
                  // Service Cards (Example)
                   Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        alignment: WrapAlignment.center,
                        children: [
                          ServiceCard(
                            icon: Icons.design_services,
                            title: 'UI/UX Design',
                            description: 'Creating intuitive and beautiful user interfaces with tools like Figma.',
                            size: isDesktop ? ServiceCardSize.large : ServiceCardSize.small,
                          ),
                          ServiceCard(
                            icon: Icons.code,
                            title: 'Flutter Dev',
                            description: 'Building cross-platform mobile applications with high performance.',
                            size: isDesktop ? ServiceCardSize.large : ServiceCardSize.small,
                            isSelected: true, // Example
                          ),
                        ],
                   ),
                   
                   SizedBox(height: 100), // Bottom spacer
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
