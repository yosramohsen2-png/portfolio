# Portfolio Design System

 This document outlines the design tokens and guidelines used throughout the Portfolio application. The strict adherence to this system ensures consistency, scalability, and pixel-perfect implementation matching the Figma prototypes.

## 1. Typography (`AppTypography`)

Our typography system is built on a responsive scale, ensuring readability across all devices.

### Headings
| Style | Size (Desktop) | Weight | Line Height | Usage |
|-------|---------------|--------|-------------|-------|
| `headline3xl` | 82px | Bold | 1.1 | Hero Titles (Desktop) |
| `headline2xl` | 72px | Bold | 1.1 | Large Display |
| `headlineXl` | 60px | Bold | 1.2 | Hero Subtitles, Section Headers |
| `headlineLg` | 48px | Bold | 1.2 | Hero Titles (Mobile) |
| `headlineMd` | 36px | Bold | 1.2 | Section Headers (Mobile) |
| `headlineSm` | 30px | SemiBold | 1.3 | Card Titles, Subheaders |
| `headlineXs` | 24px | SemiBold | 1.3 | Small Titles |

### Body
| Style | Size | Weight | Usage |
|-------|------|--------|-------|
| `bodyXl` | 20px | Regular | Large Body Text |
| `bodyLg` | 18px | Regular | Standard Body Text |
| `bodyMd` | 16px | Regular | Small Body Text, Card Descriptions |
| `bodySm` | 14px | Regular | Captions, Metadata |

### Labels
| Style | Size | Weight | Usage |
|-------|------|--------|-------|
| `labelMd` | 14px | Medium | Buttons, Badges |
| `labelSm` | 12px | Medium | Small Badges, Tags |

---

## 2. Color Palette (`AppColors`)

The application supports fully adaptive **Light** and **Dark** themes.

### Brand Colors
*   **Brand Solid**: Primary accent color used for buttons, highlights, and decorative lines.
*   **Brand Hover**: Darker/Lighter variation for interactive states.
*   **Brand Light**: Subtle tint for backgrounds or badges.

### Text Colors
*   **Primary Default**: High-contrast text for headings.
*   **Secondary**: Medium-contrast for body text.
*   **Disabled**: Low-contrast for placeholders or inactive text.

### Background Colors
*   **Primary Default**: Main page background.
*   **Primary Surface**: Card or section background.
*   **Primary Secondary**: Subtle background for inputs or wells.

---

## 3. Dimensions (`AppDimensions`)

All spacing, sizing, and layout decisions utilize a predefined scale to maintain vertical rhythm and consistent whitespace.

### Spacing Scale
| Token | Value | Token | Value |
|-------|-------|-------|-------|
| `spacingXxs` | 2px | `spacing3xl` | 24px |
| `spacingXs` | 4px | `spacing4xl` | 32px |
| `spacingSm` | 6px | `spacing5xl` | 40px |
| `spacingMd` | 8px | `spacing6xl` | 60px |
| `spacingLg` | 12px | `spacing7xl` | 80px |
| `spacingXl` | 16px | `spacing8xl` | 120px |
| `spacing2xl` | 20px | `spacing9xl` | 160px |

### Border Radius
| Token | Value | Usage |
|-------|-------|-------|
| `radiusSm` | 6px | Small buttons, tags |
| `radiusMd` | 8px | Standard inputs, cards |
| `radiusLg` | 12px | Large cards |
| `radius3xl` | 24px | Project Cards, Hero Elements |
| `radiusFull` | 999px | Pills, Circular Avatars |

### Breakpoints
*   **Mobile**: < 768px
*   **Tablet**: 768px - 1440px
*   **Desktop**: >= 1440px

---

## 4. Usage Guidelines

1.  **Never Hardcode Values**: Always use `AppDimensions.spacing...` or `AppColors.text...`.
2.  **Responsive Typography**: Use `AppTypography.responsiveHeadline(width)` or strictly switch between styles based on `isMobile` checks.
3.  **Localization**: All text must be wrapped in `.tr()` and defined in `assets/translations`.
