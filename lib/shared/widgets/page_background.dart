import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/shared/widgets/outlined_circle.dart';

class PageBackground extends StatelessWidget {
  final bool isWeb;
  final ValueListenable<double> scrollOffsetListenable;
  final ValueListenable<Offset> mouseOffsetListenable;

  const PageBackground({
    super.key,
    this.isWeb = false,
    required this.scrollOffsetListenable,
    required this.mouseOffsetListenable,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);

    return ValueListenableBuilder<double>(
      valueListenable: scrollOffsetListenable,
      builder: (context, scrollOffset, _) {
        return ValueListenableBuilder<Offset>(
          valueListenable: mouseOffsetListenable,
          builder: (context, mouseOffset, _) {
            return Stack(
              children: [
                if (!isWeb) ...[
                  Center(
                    child: Opacity(
                      opacity: 0.4,
                      child: Image.asset(
                        AppAssets.bgLogo,
                        width: MediaQuery.of(context).size.width * 0.8,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                        isAntiAlias: true,
                      ),
                    ),
                  ),
                ],

                if (isWeb) ...[
                  Positioned(
                    left: -100 + (mouseOffset.dx * 0.04),
                    top: 100 - (scrollOffset * 0.6) + (mouseOffset.dy * 0.04),
                    child: OutlinedCircle(
                      size: 500,
                      color: bgColors.brandShapes,
                    ),
                  ),
                  Positioned(
                    right: -200 - (mouseOffset.dx * 0.06),
                    bottom:
                        -100 + (scrollOffset * 0.9) - (mouseOffset.dy * 0.06),
                    child: OutlinedCircle(
                      size: 700,
                      color: bgColors.brandShapes,
                    ),
                  ),
                  Positioned(
                    left: 400 + (mouseOffset.dx * 0.03),
                    top: 400 - (scrollOffset * 0.4) + (mouseOffset.dy * 0.03),
                    child: OutlinedCircle(
                      size: 600,
                      color: bgColors.brandShapes,
                    ),
                  ),
                ] else ...[
                  Positioned(
                    left: -50,
                    top: 150 - (scrollOffset * 0.5),
                    child: OutlinedCircle(
                      size: 300,
                      color: bgColors.brandShapes,
                    ),
                  ),
                  Positioned(
                    right: -100,
                    bottom: 100 + (scrollOffset * 0.7),
                    child: OutlinedCircle(
                      size: 400,
                      color: bgColors.brandShapes,
                    ),
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }
}
