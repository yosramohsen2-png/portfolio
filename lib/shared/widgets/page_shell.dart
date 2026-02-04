import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/localization/locale_cubit.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/features/home/presentation/widgets/home_background.dart';
import 'package:portfolio/features/home/presentation/widgets/mobile_header.dart';
import 'package:portfolio/features/home/presentation/widgets/web_header_wrapper.dart';
import 'package:portfolio/shared/widgets/custom_drawer.dart';

/// A shared shell for all pages to ensure consistent header, drawer, and background.
class PageShell extends StatefulWidget {
  final Widget body;
  final String currentRoute;

  const PageShell({
    super.key,
    required this.body,
    required this.currentRoute,
  });

  @override
  State<PageShell> createState() => _PageShellState();
}

class _PageShellState extends State<PageShell> {
  late ScrollController _scrollController;
  final ValueNotifier<double> _scrollOffsetNotifier = ValueNotifier(0.0);
  final ValueNotifier<Offset> _mouseOffsetNotifier = ValueNotifier(Offset.zero);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _scrollOffsetNotifier.dispose();
    _mouseOffsetNotifier.dispose();
    super.dispose();
  }

  void _onScroll() {
    _scrollOffsetNotifier.value = _scrollController.offset;
  }

  void _onMouseMove(PointerEvent details) {
    _mouseOffsetNotifier.value = details.localPosition;
  }

  void _onLanguageChanged(String lang) {
    if (lang == 'en') {
      context.read<LocaleCubit>().setEnglish();
    } else if (lang == 'de') {
      context.read<LocaleCubit>().setGerman();
    }
  }

  void _onRouteChanged(String route) {
    if (widget.currentRoute != route) {
      context.go(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localeState = context.watch<LocaleCubit>().state;
    final selectedLanguage = localeState.locale.languageCode;
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWeb = constraints.maxWidth >= AppDimensions.breakpointTablet;

        return Scaffold(
          backgroundColor: bgColors.primaryDefault,
          drawer: isWeb ? null : CustomDrawer(currentRoute: widget.currentRoute),
          body: MouseRegion(
            onHover: isWeb ? _onMouseMove : null,
            child: Stack(
              children: [
                // Background Decorations
                Positioned.fill(
                  child: HomeBackground(
                    isWeb: isWeb,
                    scrollOffsetListenable: _scrollOffsetNotifier,
                    mouseOffsetListenable: _mouseOffsetNotifier,
                  ),
                ),

                // Main Content
                Column(
                  children: [
                    _buildHeader(isWeb, selectedLanguage),
                    Expanded(
                      child: _buildBody(isWeb),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(bool isWeb, String selectedLanguage) {
    if (isWeb) {
      return WebHeaderWrapper(
        selectedRoute: widget.currentRoute,
        onRouteChanged: _onRouteChanged,
        selectedLanguage: selectedLanguage,
        onLanguageChanged: _onLanguageChanged,
      );
    } else {
      return MobileHeader(
        selectedLanguage: selectedLanguage,
        onLanguageChanged: _onLanguageChanged,
      );
    }
  }

  Widget _buildBody(bool isWeb) {
    final horizontalPadding = isWeb ? AppDimensions.spacing5xl : AppDimensions.spacingXl;
    final verticalPadding = isWeb ? AppDimensions.spacing7xl : AppDimensions.spacing8xl;

    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Center(
          child: FadeIn(
            duration: const Duration(milliseconds: 800),
            child: widget.body,
          ),
        ),
      ),
    );
  }
}
