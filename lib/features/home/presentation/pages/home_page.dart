import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/utils/responsive_utils.dart';

/// Home page - Portfolio landing page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: ResponsiveUtils.getMaxContentWidth(context),
          ),
          padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 800),
                child: Text(
                  'home.title',
                  style: theme.textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                delay: const Duration(milliseconds: 200),
                child: Text(
                  'home.subtitle',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                delay: const Duration(milliseconds: 400),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text('home.cta_button'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
