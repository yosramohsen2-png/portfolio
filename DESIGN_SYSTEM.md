# Design System Documentation

This document explains how to use the design tokens in your Flutter portfolio application.

## 📁 File Structure

```
lib/core/
├── theme/
│   ├── app_colors.dart         # Color palette (light/dark themes)
│   ├── app_dimensions.dart     # Spacing, sizes, borders
│   └── app_typography.dart     # Font sizes, line heights, text styles
└── l10n/
    ├── app_en.arb             # English translations
    └── app_de.arb             # German translations
```

## 🎨 Colors (`app_colors.dart`)

### Usage

```dart
import 'package:portfolio/core/theme/app_colors.dart';

// Direct color access
Container(
  color: AppColors.lightBgBrandSolid, // Light theme brand color
)

// Theme-aware colors
final brightness = Theme.of(context).brightness;
final textColors = AppColors.textColors(brightness);
final bgColors = AppColors.backgroundColors(brightness);

Text(
  'Hello',
  style: TextStyle(color: textColors.brandDefault),
)

Container(
  color: bgColors.primaryDefault,
)
```

### Color Categories

#### Text Colors
- **Brand**: `brandDefault`, `brandHover`, `brandDisabled`
- **Primary**: `primaryDefault`, `primaryHover`, `primaryToggle`, `primaryDisabled`

#### Background Colors
- **Brand**: `brandLight`, `brandHover`, `brandSolid`, `brandShapes`
- **Primary**: `primaryDefault`, `primarySurface`, `primarySecondary`, `primaryHover`

#### Icon Colors
- `primaryDefault`, `primaryDefaultChange`, `primaryHover`, `primaryShape`

#### Border Colors
- `primaryDefault`, `primaryCards`, `primaryDisabled`

---

## 📏 Dimensions (`app_dimensions.dart`)

### Spacing

```dart
import 'package:portfolio/core/theme/app_dimensions.dart';

// Fixed spacing
Padding(
  padding: EdgeInsets.all(AppDimensions.spacingMd), // 8px
)

SizedBox(height: AppDimensions.spacing2xl), // 20px

// Responsive spacing
final width = MediaQuery.of(context).size.width;
Padding(
  padding: EdgeInsets.all(
    AppDimensions.responsiveSpacing(width),
  ),
)
```

### Spacing Scale
- `spacingNone` = 0
- `spacingXxs` = 2
- `spacingXs` = 4
- `spacingSm` = 6
- `spacingMd` = 8
- `spacingLg` = 12
- `spacingXl` = 16
- `spacing2xl` = 20
- `spacing3xl` = 24
- `spacing4xl` = 32
- `spacing5xl` = 40
- `spacing6xl` = 60
- `spacing7xl` = 80
- `spacing8xl` = 120
- `spacing9xl` = 160
- `spacing10xl` = 200

### Icon Sizes

```dart
Icon(
  Icons.home,
  size: AppDimensions.iconMd, // 24px
)
```

### Icon Scale
- `icon3xs` = 12
- `icon2xs` = 14
- `iconXs` = 16
- `iconSm` = 20
- `iconMd` = 24
- `iconLg` = 32
- `iconXl` = 60
- `icon2xl` = 80

### Border Radius

```dart
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(AppDimensions.radiusMd), // 8px
  ),
)
```

### Border Radius Scale
- `radiusNone` = 0
- `radius2xs` = 2
- `radiusXs` = 4
- `radiusSm` = 6
- `radiusMd` = 8
- `radiusLg` = 12
- `radiusXl` = 16
- `radius2xl` = 20
- `radius3xl` = 24
- `radiusFull` = 999 (for circular elements)

### Breakpoints
- `breakpointMobile` = 375
- `breakpointTablet` = 768
- `breakpointDesktop` = 1440

---

## ✍️ Typography (`app_typography.dart`)

### Usage

```dart
import 'package:portfolio/core/theme/app_typography.dart';

// Using text styles
Text(
  'Headline',
  style: AppTypography.headlineXl(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
)

Text(
  'Body text',
  style: AppTypography.bodyMd(color: Colors.grey[800]),
)

// Responsive typography
final width = MediaQuery.of(context).size.width;
Text(
  'Responsive Headline',
  style: AppTypography.responsiveHeadline(width),
)
```

### Text Styles

#### Headlines
- `headline3xl()` - 82px / 90 line-height
- `headline2xl()` - 72px / 90 line-height
- `headlineXl()` - 60px / 72 line-height
- `headlineLg()` - 48px / 60 line-height
- `headlineMd()` - 36px / 44 line-height
- `headlineSm()` - 30px / 38 line-height
- `headlineXs()` - 24px / 32 line-height

#### Body Text
- `bodyXl()` - 20px / 30 line-height
- `bodyLg()` - 18px / 28 line-height
- `bodyMd()` - 16px / 24 line-height
- `bodySm()` - 14px / 20 line-height

#### Labels
- `labelMd()` - 14px / 18 line-height
- `labelSm()` - 12px / 18 line-height

### Complete TextTheme

```dart
// Get a complete Material TextTheme
final textTheme = AppTypography.textTheme(color: Colors.black);

MaterialApp(
  theme: ThemeData(
    textTheme: textTheme,
  ),
)
```

---

## 🌍 Localization

### Setup in `main.dart`

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

MaterialApp(
  localizationsDelegates: const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('en'), // English
    Locale('de'), // German
  ],
  // ...
)
```

### Usage

```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// In your widget
final l10n = AppLocalizations.of(context)!;

Text(l10n.navHome), // "Home" in English, "Startseite" in German
Text(l10n.contactTitle), // "Get In Touch" / "Kontaktieren Sie mich"
```

### Generate Localization Files

After updating ARB files, run:

```bash
flutter gen-l10n
```

or simply:

```bash
flutter run
```

Flutter will automatically generate the localization classes.

---

## 🎯 Complete Usage Example

```dart
import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final bgColors = AppColors.backgroundColors(brightness);
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(AppDimensions.spacingLg),
      decoration: BoxDecoration(
        color: bgColors.primaryDefault,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(
          color: AppColors.borderColors(brightness).primaryDefault,
          width: AppDimensions.borderWidthSm,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppDimensions.spacingMd,
        children: [
          Text(
            l10n.homeTitle,
            style: AppTypography.responsiveHeadline(
              width,
              color: textColors.brandDefault,
            ),
          ),
          Text(
            l10n.homeDescription,
            style: AppTypography.bodyMd(
              color: textColors.primaryDefault,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: bgColors.brandSolid,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.spacing2xl,
                vertical: AppDimensions.spacingMd,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
              ),
            ),
            onPressed: () {},
            child: Text(
              l10n.homeCTA,
              style: AppTypography.labelMd(
                color: textColors.primaryDefault,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## 🚀 Next Steps

1. **Run** `flutter pub get` to install dependencies
2. **Run** `flutter gen-l10n` to generate localization files
3. **Import** the theme files in your widgets
4. **Use** the design tokens throughout your application
5. **Customize** colors, dimensions, or typography as needed

---

## 📝 Notes

- All colors support both **light** and **dark** themes
- Dimensions include **responsive helpers** for adaptive layouts
- Typography includes **responsive text styles** based on screen width
- Localization supports **English** and **German** out of the box
- Design tokens are organized following **Figma design system** structure

Happy coding! 🎨✨
