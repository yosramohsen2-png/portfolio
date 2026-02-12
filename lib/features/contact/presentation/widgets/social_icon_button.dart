import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButton extends StatefulWidget {
  final String iconAsset;
  final String url;

  const SocialIconButton({
    super.key,
    required this.iconAsset,
    required this.url,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(widget.url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColors = AppColors.backgroundColors(theme.brightness);
    final iconColors = AppColors.iconColors(theme.brightness);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _launchUrl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 56,
          height: 56,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isHovered 
                ? (theme.brightness == Brightness.light ? AppColors.lightBgBrandSolid : AppColors.darkBgBrandSolid)
                : bgColors.primarySecondary,
          ),
          child: Image.asset(
            widget.iconAsset,
            color: _isHovered 
                ? Colors.black 
                : iconColors.primaryDefault,
          ),
        ),
      ),
    );
  }
}
