import 'package:flutter/material.dart';
import 'package:portfolio/features/home/presentation/widgets/home_hero_section.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageShell(
      currentRoute: '/',
      body: HomeHeroSection(
        isWeb: MediaQuery.of(context).size.width > 900,
        onViewUiUx: () {},
        onViewFlutter: () {},
      ),
    );
  }
}
