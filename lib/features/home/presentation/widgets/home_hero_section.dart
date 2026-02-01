import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/shared/widgets/primary_button.dart';

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
        _HelloText(isWeb: isWeb, textColors: textColors),
        SizedBox(height: isWeb ? 24 : 16),

        // Name - Mobile: 48px, Web: 82px
        _NameText(isWeb: isWeb, textColors: textColors),
        SizedBox(height: isWeb ? 24 : 16),

        // Tagline - Mobile: 30px, Web: 36px
        _TaglineText(isWeb: isWeb, textColors: textColors),
        SizedBox(height: isWeb ? 24 : 12),

        // Description - Mobile: 18px, Web: 20px
        _DescriptionText(isWeb: isWeb, textColors: textColors),
        SizedBox(height: isWeb ? 60 : 40),

        // Buttons
        _ActionButtons(
          isWeb: isWeb,
          onViewUiUx: onViewUiUx,
          onViewFlutter: onViewFlutter,
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
    return Text(
      'home.hello'.tr(),
      style: isWeb
          ? AppTypography.bodyXl(color: textColors.brandDisabled, fontWeight: FontWeight.w500)
          : AppTypography.bodyLg(color: textColors.brandDisabled, fontWeight: FontWeight.w500),
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
    return Container(
      constraints: BoxConstraints(maxWidth: isWeb ? 800 : 350),
      child: Text(
        'home.description'.tr(),
        style: isWeb
            ? AppTypography.bodyXl(color: textColors.brandDisabled, fontWeight: FontWeight.w500)
            : AppTypography.bodyLg(color: textColors.brandDisabled, fontWeight: FontWeight.w500),
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
      // Web: Horizontal with adaptive width but consistent min-size
      return Wrap(
        spacing: 40, // Better spacing for smaller web screens
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: [
          _UiUxButton(onPressed: onViewUiUx, minWidth: 320),
          _FlutterButton(onPressed: onViewFlutter, minWidth: 320),
        ],
      );
    } else {
      // Mobile: Stacked with 24px gap
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: _UiUxButton(onPressed: onViewUiUx),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: _FlutterButton(onPressed: onViewFlutter),
          ),
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
