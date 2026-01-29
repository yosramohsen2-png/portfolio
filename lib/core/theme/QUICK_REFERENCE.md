# Quick Reference - Design Tokens

## Colors

```dart
import 'package:portfolio/core/theme/app_colors.dart';

// Theme-aware colors
final brightness = Theme.of(context).brightness;
AppColors.textColors(brightness).brandDefault
AppColors.backgroundColors(brightness).primaryDefault
AppColors.iconColors(brightness).primaryHover
AppColors.borderColors(brightness).primaryDefault

// Direct access
AppColors.lightBgBrandSolid   // #FDC700
AppColors.darkTextPrimaryDefault  // #D9DBDE
```

## Spacing

```dart
import 'package:portfolio/core/theme/app_dimensions.dart';

AppDimensions.spacingXs    // 4px
AppDimensions.spacingMd    // 8px
AppDimensions.spacingLg    // 12px
AppDimensions.spacingXl    // 16px
AppDimensions.spacing2xl   // 20px
AppDimensions.spacing3xl   // 24px

// Responsive
final width = MediaQuery.of(context).size.width;
AppDimensions.responsiveSpacing(width)
```

## Icons

```dart
AppDimensions.iconSm    // 20px
AppDimensions.iconMd    // 24px
AppDimensions.iconLg    // 32px

Icon(Icons.home, size: AppDimensions.iconMd)
```

## Border Radius

```dart
AppDimensions.radiusXs     // 4px
AppDimensions.radiusSm     // 6px
AppDimensions.radiusMd     // 8px
AppDimensions.radiusLg     // 12px
AppDimensions.radiusFull   // 999px (circular)

BorderRadius.circular(AppDimensions.radiusMd)
```

## Typography

```dart
import 'package:portfolio/core/theme/app_typography.dart';

// Headlines
AppTypography.headline2xl()  // 72px
AppTypography.headlineXl()   // 60px
AppTypography.headlineLg()   // 48px

// Body
AppTypography.bodyLg()       // 18px
AppTypography.bodyMd()       // 16px

// With parameters
AppTypography.headlineXl(
  color: Colors.black,
  fontWeight: FontWeight.bold,
)

// Responsive
AppTypography.responsiveHeadline(width)
```

## Localization

```dart
import 'package:easy_localization/easy_localization.dart';

Text(context.tr('heroGreeting'))
Text(context.tr('heroTitle'))
```

## Complete Example

```dart
Container(
  padding: EdgeInsets.all(AppDimensions.spacingLg),
  decoration: BoxDecoration(
    color: AppColors.backgroundColors(brightness).primaryDefault,
    borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
  ),
  child: Text(
    context.tr('heroTitle'),
    style: AppTypography.headlineXl(
      color: AppColors.textColors(brightness).brandDefault,
    ),
  ),
)
```
