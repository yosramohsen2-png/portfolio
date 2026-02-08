import 'package:flutter/material.dart';
import 'package:portfolio/features/contact/presentation/widgets/social_icon_button.dart';
import 'package:portfolio/core/constants/app_assets.dart';

class SocialLinksIcons extends StatelessWidget {
  const SocialLinksIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 40,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: const [
        SocialIconButton(
          iconAsset: AppAssets.bihance,
          url: 'https://www.behance.net/yosramohsen1',
        ),
        SocialIconButton(
          iconAsset: AppAssets.linkedin,
          url: 'https://www.linkedin.com/in/yosra-mohsen-56868b19b/',
        ),
        SocialIconButton(
          iconAsset: AppAssets.github,
          url: 'https://github.com/yosramohsen2-png',
        ),
        SocialIconButton(
          iconAsset: AppAssets.whatsapp,
          url: 'https://wa.me/201117511154',
        ),
      ],
    );
  }
}
