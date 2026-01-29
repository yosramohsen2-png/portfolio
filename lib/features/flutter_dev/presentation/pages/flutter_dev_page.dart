import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/utils/responsive_utils.dart';

/// Flutter Development portfolio page
class FlutterDevPage extends StatelessWidget {
  const FlutterDevPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_dev.title'),
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
                  'flutter_dev.subtitle',
                  style: theme.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  'flutter_dev.description',
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
