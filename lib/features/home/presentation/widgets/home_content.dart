import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/localization/locale_cubit.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/features/home/presentation/widgets/home_background.dart';
import 'package:portfolio/features/home/presentation/widgets/home_hero_section.dart';
import 'package:portfolio/features/home/presentation/widgets/mobile_header.dart';
import 'package:portfolio/features/home/presentation/widgets/web_header_wrapper.dart';

/// Main content container for HomePage
/// Handles responsive layout switching between Mobile and Web
class HomeContent extends StatefulWidget {
  final bool isWeb;
  final BoxConstraints constraints;

  const HomeContent({
    super.key,
    required this.isWeb,
    required this.constraints,
  });

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String _selectedRoute = '/home';
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
    if (widget.isWeb) {
      _mouseOffsetNotifier.value = details.localPosition;
    }
  }

  void _onRouteChanged(String route) {
    setState(() => _selectedRoute = route);
  }

  void _onLanguageChanged(String lang) {
    debugPrint("Language changed to: $lang");
    if (lang == 'en') {
      context.read<LocaleCubit>().setEnglish();
    } else if (lang == 'de') {
      context.read<LocaleCubit>().setGerman();
    }
  }

  void _onViewUiUx() {
    debugPrint("View UI/UX Projects");
  }

  void _onViewFlutter() {
    debugPrint("View Flutter Projects");
  }

  @override
  Widget build(BuildContext context) {
    final localeState = context.watch<LocaleCubit>().state;
    final selectedLanguage = localeState.locale.languageCode;

    return MouseRegion(
      onHover: _onMouseMove,
      child: Stack(
        children: [
          // Background Decorations - Only this part responds to mouse/scroll continuously
          Positioned.fill(
            child: HomeBackground(
              isWeb: widget.isWeb,
              scrollOffsetListenable: _scrollOffsetNotifier,
              mouseOffsetListenable: _mouseOffsetNotifier,
            ),
          ),
  
          // Main Content Column - Built once (or on language change), not on every mouse move
          Column(
            children: [
              _buildHeader(selectedLanguage),
              Expanded(
                child: _buildBody(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String selectedLanguage) {
    if (widget.isWeb) {
      return WebHeaderWrapper(
        selectedRoute: _selectedRoute,
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

  Widget _buildBody() {
    final horizontalPadding = widget.isWeb ? AppDimensions.spacing5xl : AppDimensions.spacingXl;
    final verticalPadding = widget.isWeb ? AppDimensions.spacing7xl : AppDimensions.spacing8xl;

    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Center(
          child: HomeHeroSection(
            isWeb: widget.isWeb,
            onViewUiUx: _onViewUiUx,
            onViewFlutter: _onViewFlutter,
          ),
        ),
      ),
    );
  }
}
