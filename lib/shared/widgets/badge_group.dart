import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/shared/widgets/badge.dart';

class BadgeGroup extends StatelessWidget {
  final List<String> labels;
  final BadgeSize size;
  final double? spacing;
  final double? runSpacing;

  const BadgeGroup({
    super.key,
    required this.labels,
    this.size = BadgeSize.medium,
    this.spacing,
    this.runSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final horizontalSpacing = spacing ?? AppDimensions.spacingXl;
    final verticalSpacing = runSpacing ?? AppDimensions.spacingMd;

    return Wrap(
      spacing: horizontalSpacing,
      runSpacing: verticalSpacing,
      children: labels.map((label) {
        return Badge(
          label: label,
          size: size,
        );
      }).toList(),
    );
  }
}
