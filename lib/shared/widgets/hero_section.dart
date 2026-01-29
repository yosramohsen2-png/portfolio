import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';

enum HeroSectionSize { large, medium, small }

class HeroSection extends StatelessWidget {
  final String greeting;
  final String name;
  final String subtitle;
  final String description;
  final HeroSectionSize size;
  final CrossAxisAlignment alignment;
  final bool highlightLastWord;

  const HeroSection({
    super.key,
    required this.greeting,
    required this.name,
    required this.subtitle,
    required this.description,
    this.size = HeroSectionSize.medium,
    this.alignment = CrossAxisAlignment.center,
    this.highlightLastWord = false,
  });

  TextAlign get _textAlign {
    switch (alignment) {
      case CrossAxisAlignment.center:
        return TextAlign.center;
      case CrossAxisAlignment.start:
        return TextAlign.start;
      default:
        return TextAlign.start;
    }
  }

  double get _spacing {
    switch (size) {
      case HeroSectionSize.large:
        return AppDimensions.spacing3xl;
      case HeroSectionSize.medium:
      case HeroSectionSize.small:
        return AppDimensions.spacingXl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);

    return Column(
      crossAxisAlignment: alignment,
      children: [
        // Greeting
        Text(
          greeting,
          textAlign: _textAlign,
          style: _getGreetingStyle(textColors),
        ),
        SizedBox(height: _spacing),

        // Name
        SizedBox(
          height: 64,
          child: _buildName(textColors),
        ),
        SizedBox(height: _spacing),

        // Subtitle
        Text(
          subtitle,
          textAlign: _textAlign,
          style: _getSubtitleStyle(textColors),
        ),
        SizedBox(height: _spacing),

        // Description
        Text(
          description,
          textAlign: _textAlign,
          style: _getDescriptionStyle(textColors),
        ),
      ],
    );
  }

  Widget _buildName(TextColors textColors) {
    if (!highlightLastWord) {
      return Text(
        name,
        textAlign: _textAlign,
        style: _getNameStyle(textColors),
      );
    }

    // Split name into words
    final words = name.split(' ');
    if (words.length < 2) {
      return Text(
        name,
        textAlign: _textAlign,
        style: _getNameStyle(textColors),
      );
    }

    final firstName = words.sublist(0, words.length - 1).join(' ');
    final lastName = words.last;

    return RichText(
      textAlign: _textAlign,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$firstName ',
            style: _getNameStyle(textColors),
          ),
          TextSpan(
            text: lastName,
            style: _getNameStyle(textColors).copyWith(
              color: textColors.brandDefault,
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _getGreetingStyle(TextColors textColors) {
    final color = textColors.brandDisabled;

    switch (size) {
      case HeroSectionSize.large:
        return AppTypography.bodyXl(
          color: color,
          fontWeight: FontWeight.w500,
        );
      case HeroSectionSize.medium:
        return AppTypography.bodyLg(
          color: color,
          fontWeight: FontWeight.w500,
        );
      case HeroSectionSize.small:
        return AppTypography.bodyMd(
          color: color,
          fontWeight: FontWeight.w500,
        );
    }
  }

  TextStyle _getNameStyle(TextColors textColors) {
    final color = textColors.primaryDefault;

    switch (size) {
      case HeroSectionSize.large:
        return AppTypography.headline3xl(
          color: color,
          fontWeight: FontWeight.w700,
        );
      case HeroSectionSize.medium:
        return AppTypography.headlineLg(
          color: color,
          fontWeight: FontWeight.w700,
        );
      case HeroSectionSize.small:
        return AppTypography.headlineMd(
          color: color,
          fontWeight: FontWeight.w700,
        );
    }
  }

  TextStyle _getSubtitleStyle(TextColors textColors) {
    final color = textColors.brandDefault;

    switch (size) {
      case HeroSectionSize.large:
        return AppTypography.headlineMd(
          color: color,
          fontWeight: FontWeight.w700,
        );
      case HeroSectionSize.medium:
        return AppTypography.headlineSm(
          color: color,
          fontWeight: FontWeight.w700,
        );
      case HeroSectionSize.small:
        return AppTypography.headlineXs(
          color: color,
          fontWeight: FontWeight.w700,
        );
    }
  }

  TextStyle _getDescriptionStyle(TextColors textColors) {
    final color = textColors.brandDisabled;

    switch (size) {
      case HeroSectionSize.large:
        return AppTypography.bodyXl(
          color: color,
          fontWeight: FontWeight.w500,
        );
      case HeroSectionSize.medium:
        return AppTypography.bodyLg(
          color: color,
          fontWeight: FontWeight.w500,
        );
      case HeroSectionSize.small:
        return AppTypography.bodyMd(
          color: color,
          fontWeight: FontWeight.w500,
        );
    }
  }
}
