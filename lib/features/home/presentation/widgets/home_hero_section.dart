import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:animate_do/animate_do.dart';

/// Hero Section for Home Page
/// Mobile: gap 40px between elements, buttons stacked
/// Web: gap 24px between text elements, buttons horizontal with 60px gap
class HomeHeroSection extends StatelessWidget {
  final bool isWeb;
  final VoidCallback onViewUiUx;
  final VoidCallback onViewFlutter;

  const HomeHeroSection({
    super.key,
    this.isWeb = false,
    required this.onViewUiUx,
    required this.onViewFlutter,
  });

  @override
  Widget build(BuildContext context) {
    final textColors = AppColors.textColors(Theme.of(context).brightness);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Hello I'm - Mobile: 18px, Web: 20px
        FadeInDown(
          from: 50, // Move from further away
          duration: const Duration(milliseconds: 1000),
          child: _HelloText(isWeb: isWeb, textColors: textColors),
        ),
        SizedBox(height: isWeb ? AppDimensions.spacing3xl : AppDimensions.spacingXl),

        // Name - Mobile: 48px, Web: 82px
        FadeInDown(
          from: 80, // Even more movement for the name
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 1000),
          child: _NameText(isWeb: isWeb, textColors: textColors),
        ),
        SizedBox(height: isWeb ? AppDimensions.spacing3xl : AppDimensions.spacingXl),

        // Tagline - Mobile: 30px, Web: 36px
        FadeIn(
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 1500),
          child: _TaglineText(isWeb: isWeb, textColors: textColors),
        ),
        SizedBox(height: isWeb ? AppDimensions.spacing3xl : AppDimensions.spacingLg),

        // Description - Mobile: 18px, Web: 20px
        FadeInUp(
          from: 60,
          delay: const Duration(milliseconds: 600),
          duration: const Duration(milliseconds: 1000),
          child: _DescriptionText(isWeb: isWeb, textColors: textColors),
        ),
        SizedBox(height: isWeb ? AppDimensions.spacing6xl : AppDimensions.spacing5xl),

        // Buttons
        FadeInUp(
          from: 40,
          delay: const Duration(milliseconds: 800),
          duration: const Duration(milliseconds: 1000),
          child: _ActionButtons(
            isWeb: isWeb,
            onViewUiUx: onViewUiUx,
            onViewFlutter: onViewFlutter,
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// Sub-Widgets with Localization
// ============================================================================

class _HelloText extends StatelessWidget {
  final bool isWeb;
  final TextColors textColors;

  const _HelloText({required this.isWeb, required this.textColors});

  @override
  Widget build(BuildContext context) {
    // Using a more visible color than brandDisabled for better clarity
    final color = Theme.of(context).brightness == Brightness.light
        ? textColors.primaryDefault.withOpacity(0.7)
        : textColors.primaryDefault.withOpacity(0.8);

    return Text(
      'home.hello'.tr(),
      style: isWeb
          ? AppTypography.bodyXl(color: color, fontWeight: FontWeight.w500)
          : AppTypography.bodyLg(color: color, fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
    );
  }
}

class _NameText extends StatelessWidget {
  final bool isWeb;
  final TextColors textColors;

  const _NameText({required this.isWeb, required this.textColors});

  @override
  Widget build(BuildContext context) {
    return Text(
      'home.name'.tr(),
      style: isWeb
          ? AppTypography.headline3xl(color: textColors.primaryDefault, fontWeight: FontWeight.w700)
          : AppTypography.headlineLg(color: textColors.primaryDefault, fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    );
  }
}

class _TaglineText extends StatelessWidget {
  final bool isWeb;
  final TextColors textColors;

  const _TaglineText({required this.isWeb, required this.textColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Text(
        'home.tagline'.tr(),
        style: isWeb
            ? AppTypography.headlineMd(color: textColors.brandDefault, fontWeight: FontWeight.w700)
            : AppTypography.headlineSm(color: textColors.brandDefault, fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _DescriptionText extends StatelessWidget {
  final bool isWeb;
  final TextColors textColors;

  const _DescriptionText({required this.isWeb, required this.textColors});

  @override
  Widget build(BuildContext context) {
    // Increased visibility for description text
    final color = Theme.of(context).brightness == Brightness.light
        ? textColors.primaryDefault.withOpacity(0.8)
        : textColors.primaryDefault.withOpacity(0.9);

    return Container(
      constraints: BoxConstraints(maxWidth: isWeb ? 800 : 350),
      child: Text(
        'home.description'.tr(),
        style: isWeb
            ? AppTypography.bodyXl(color: color, fontWeight: FontWeight.w500)
            : AppTypography.bodyLg(color: color, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final bool isWeb;
  final VoidCallback onViewUiUx;
  final VoidCallback onViewFlutter;

  const _ActionButtons({
    required this.isWeb,
    required this.onViewUiUx,
    required this.onViewFlutter,
  });

  @override
  Widget build(BuildContext context) {
    if (isWeb) {
      // Web: Horizontal, content-sized
      return Wrap(
        spacing: 24,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: [
          _UiUxButton(onPressed: onViewUiUx),
          _FlutterButton(onPressed: onViewFlutter),
        ],
      );
    } else {
      // Mobile: Vertical, content-sized and centered
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _UiUxButton(onPressed: onViewUiUx),
          const SizedBox(height: 16),
          _FlutterButton(onPressed: onViewFlutter),
        ],
      );
    }
  }
}

class _UiUxButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? minWidth;

  const _UiUxButton({required this.onPressed, this.width, this.minWidth});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      label: 'home.view_uiux'.tr(),
      onPressed: onPressed,
      variant: ButtonVariant.filled,
      leadingIconAsset: AppAssets.pallet,
      trailingIconAsset: AppAssets.arrow,
      width: width,
      minWidth: minWidth,
    );
  }
}

class _FlutterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? minWidth;

  const _FlutterButton({required this.onPressed, this.width, this.minWidth});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      label: 'home.view_flutter'.tr(),
      onPressed: onPressed,
      variant: ButtonVariant.outlined,
      leadingIconAsset: AppAssets.mobile,
      trailingIconAsset: AppAssets.arrow,
      width: width,
      minWidth: minWidth,
    );
  }
}
