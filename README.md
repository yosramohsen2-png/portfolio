# Portfolio

A high-performance, responsive portfolio application built with Flutter, designed to showcase design and development skills. This project strictly adheres to a custom [Design System](DESIGN_SYSTEM.md) prototyped in Figma, ensuring pixel-perfect implementation across all device sizes.

## 🚀 Features

*   **Responsive Design**: Seamlessly adapts to Mobile, Tablet, and Desktop viewports.
*   **Design System Compliance**: strict adherence to `AppColors`, `AppTypography`, and `AppDimensions` for consistency.
*   **Localization**: Complete support for **English** and **German** languages, including dynamic project data.
*   **Dark/Light Mode**: Fully adaptive theming based on system preferences.
*   **Performance Optimized**: Efficient rendering and asset management for smooth 60fps animations.
*   **Automated Deployment**: CI/CD pipeline integrated with GitHub Actions for automatic deployment to GitHub Pages.

## 🛠️ Tech Stack

*   **Framework**: Flutter (Web, Mobile)
*   **State Management**: `flutter_bloc` (Cubit) for predictable state transitions.
*   **Architecture**: Clean Architecture principles capable of scaling.
*   **Localization**: `easy_localization` for robust internationalization.
*   **Navigation**: `go_router` for declarative routing.

## 🎨 Design System

This project is built upon a comprehensive Design System.
👉 **[Read the Design System Documentation](DESIGN_SYSTEM.md)**

## 📦 Getting Started

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/yosramohsen2-png/portfolio.git
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Run the application**:
    ```bash
    flutter run -d chrome
    ```

4.  **Generate Translations** (if modifying `.json` files):
    ```bash
    flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart
    ```

## 🚀 Deployment

The project is configured to automatically deploy to GitHub Pages on every push to the `main` branch.

**Workflow**: `.github/workflows/deploy.yml`

### Manual Build
To build the web version manually:
```bash
flutter build web --release --base-href "/portfolio/"
```
