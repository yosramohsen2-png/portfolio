import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/utils/responsive_utils.dart';

/// About page - Personal information and skills
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('about.title'),
      ),
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
                child: Text(
                  'about.subtitle',
                  style: theme.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  'about.description',
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
