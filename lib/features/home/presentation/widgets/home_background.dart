import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class HomeBackground extends StatelessWidget {
  final bool isWeb;

  const HomeBackground({
    super.key,
    this.isWeb = false,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);

    // If mobile, use the specific mobile decoration
    if (!isWeb) {
      return Stack(
        children: [
          Positioned(
            left: 69,
            top: -118,
            child: Transform.rotate(
              angle: -1 * 3.14159 / 180, // -1 degree
              child: Container(
                width: 216.08,
                height: 424.64,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.03), // Using direct opacity as per CSS
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
          ),
        ],
      );
    }

    // Web Decorations
    return Stack(
      children: [
        // Shape 1 (Top Right ish - Large stroke)
        Positioned(
          left: 593,
          top: 299, // Adjust based on parent relative positioning usually
          // Since we might need responsive positioning, we can use MediaQuery or percentages if we want to be smart,
          // but for "Pixel Perfect" conversion of the "Web" design provided:
          // We might need to anchor these to the center or edges. 
          // The CSS says "left: 593px".
          // I'll map these somewhat absolutely but wrapped in a large overflow container or responsive aligned.
          // For a background, purely absolute usually breaks on different screen sizes.
          // I will use a LayoutBuilder in the parent or just `Positioned` relative to a large Container.
          // Let's try to replicate nicely.
          child: Transform.rotate(
            angle: 20 * 3.14159 / 180,
            child: Container(
              width: 386.24,
              height: 386.24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22369600), // Circle mostly
                border: Border.all(
                  color: bgColors.brandShapes,
                  width: 2,
                ),
                color: bgColors.brandShapes.withOpacity(0.20),
              ),
            ),
          ),
        ),
        
        // Shape 2 (Left - Stroke)
        Positioned(
          left: 44,
          top: 346,
          child: Transform.rotate(
            angle: -16 * 3.14159 / 180,
            child: Container(
              width: 484.15,
              height: 484.15,
             decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22369600),
                border: Border.all(
                  color: bgColors.brandShapes,
                  width: 2,
                ),
                color: bgColors.brandShapes.withOpacity(0.20),
              ),
            ),
          ),
        ),

        // Shape 3 (Right - Stroke)
        Positioned(
          left: 787,
          top: 141.84,
          child: Transform.rotate(
            angle: -16 * 3.14159 / 180,
            child: Container(
               width: 510.17,
              height: 484.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22369600),
                border: Border.all(
                  color: bgColors.brandShapes,
                  width: 2,
                ),
                color: bgColors.brandShapes.withOpacity(0.20),
              ),
            ),
          ),
        ),

        // Shape 4 (Center - Filled Light)
        Positioned(
          left: 522,
          top: 451,
          child: Transform.rotate(
            angle: -16 * 3.14159 / 180,
             child: Container(
              width: 304.05,
              height: 288.54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22369600),
                color: bgColors.brandLight.withOpacity(0.0), // CSS says opacity 0? 
                // Ah, "opacity: 0" in the CSS snippet. Maybe it's hidden or animated in?
                // I will keep it as 0 opacity for now if CSS says so, or maybe it's a mistake in the snippet extraction.
                // The snippet says: "background: var(--semantic-background-brand-light, #FEF1B3); opacity: 0;"
                // If it's 0 it's invisible. I'll comment it out or leave as 0.
              ),
            ),
          ),
        ),
      ],
    );
  }
}
