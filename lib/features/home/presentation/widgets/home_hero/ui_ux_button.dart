import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/shared/widgets/primary_button.dart';

class UiUxButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? minWidth;

  const UiUxButton({
    super.key,
    required this.onPressed,
    this.width,
    this.minWidth,
  });

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
