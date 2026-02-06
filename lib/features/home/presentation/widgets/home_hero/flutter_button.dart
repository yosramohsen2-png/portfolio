import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/shared/widgets/primary_button.dart';

class FlutterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? minWidth;

  const FlutterButton({
    super.key,
    required this.onPressed,
    this.width,
    this.minWidth,
  });

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
