import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/shared/widgets/primary_button.dart';

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
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);

    // Responsive fonts
    // Mobile:
    // Hello I'm: 18px
    // Name: 48px
    // Tagline: 30px
    // Desc: 18px
    
    // Web:
    // Hello I'm: 20px
    // Name: 82px
    // Tagline: 36px
    // Desc: 20px

    final helloStyle = isWeb
        ? AppTypography.bodyXl(
            color: textColors.brandDisabled,
            fontWeight: FontWeight.w500,
          )
        : AppTypography.bodyLg(
            color: textColors.brandDisabled,
            fontWeight: FontWeight.w500,
          );

    final nameStyle = isWeb
        ? AppTypography.headline3xl(
            color: textColors.primaryDefault,
            fontWeight: FontWeight.w700,
          )
        : AppTypography.headlineLg(
            color: textColors.primaryDefault,
            fontWeight: FontWeight.w700,
          ); // Arial in design for mobile? "font-family: Arial". I'll stick to AppTypography (Inter) for consistency unless specified.

    final taglineStyle = isWeb
        ? AppTypography.headlineMd(
            color: textColors.brandDefault,
            fontWeight: FontWeight.w700,
          )
        : AppTypography.headlineSm(
            color: textColors.brandDefault,
            fontWeight: FontWeight.w700,
          );

    final descStyle = isWeb
        ? AppTypography.bodyXl(
            color: textColors.brandDisabled,
            fontWeight: FontWeight.w500,
          )
        : AppTypography.bodyLg(
            color: textColors.brandDisabled,
            fontWeight: FontWeight.w500,
          );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, // All centered
      children: [
        // 1. Hello I'm
        Text(
          "Hello, I'm",
          style: helloStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: isWeb ? 24 : 16),

        // 2. Yosra Mohsen
        Text(
          "Yosra Mohsen",
          style: nameStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: isWeb ? 24 : 16),

        // 3. Tagline
        Container(
          constraints: BoxConstraints(maxWidth: 800),
          child: Text(
            "I Design the Dream.\nI Build the Reality",
            style: taglineStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: isWeb ? 24 : 12),

        // 4. Description
        Container(
          constraints: BoxConstraints(maxWidth: isWeb ? 800 : 350),
          child: Text(
            "I’ve always been obsessed with how things work under the hood. To me, a great app is a story that starts with a pixel and ends with a solid line of code. I bridge the gap between \"how it looks\" and \"how it performs,\" making sure every user journey is a masterpiece.",
            style: descStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: isWeb ? 60 : 40),

        // 5. Buttons
        if (isWeb) ...[
          Wrap(
            spacing: 60,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildUiUxButton(context, width: 285),
              _buildFlutterButton(context, width: 285),
            ],
          )
        ] else ...[
          // Mobile: Stacked
          SizedBox(
            width: double.infinity,
            child: _buildUiUxButton(context),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: _buildFlutterButton(context),
          ),
        ],
      ],
    );
  }

  Widget _buildUiUxButton(BuildContext context, {double? width}) {
    // Icon Logic: Design shows specific icons.
    // "View UI/UX Projects": Icon is a grid/layout icon.
    // We can use a standard icon for now.
    return PrimaryButton(
      label: "View UI/UX Projects",
      onPressed: onViewUiUx,
      variant: ButtonVariant.filled,
      leadingIcon: Icons.grid_view, // Close match to 4-squares
      trailingIcon: Icons.arrow_forward, // Arrow
      width: width,
    );
  }

  Widget _buildFlutterButton(BuildContext context, {double? width}) {
    // "View Flutter Projects": Icon is a phone/code icon.
    return PrimaryButton(
      label: "View Flutter Projects",
      onPressed: onViewFlutter,
      variant: ButtonVariant.outlined,
      leadingIcon: Icons.phone_android, // Close match
      trailingIcon: Icons.arrow_forward, // Arrow
      width: width,
    );
  }
}
