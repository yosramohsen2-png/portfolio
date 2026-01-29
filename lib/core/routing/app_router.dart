import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/ui_ux_design/presentation/pages/ui_ux_design_page.dart';
import '../../features/flutter_dev/presentation/pages/flutter_dev_page.dart';
import '../../features/about/presentation/pages/about_page.dart';
import '../../features/contact/presentation/pages/contact_page.dart';
import '../constants/app_constants.dart';

/// Application routing configuration using GoRouter
class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: AppConstants.homeRoute,
    routes: [
      GoRoute(
        path: AppConstants.homeRoute,
        name: 'home',
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const HomePage(),
        ),
      ),
      GoRoute(
        path: AppConstants.uiUxDesignRoute,
        name: 'ui_ux_design',
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const UiUxDesignPage(),
        ),
      ),
      GoRoute(
        path: AppConstants.flutterDevRoute,
        name: 'flutter_dev',
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const FlutterDevPage(),
        ),
      ),
      GoRoute(
        path: AppConstants.aboutRoute,
        name: 'about',
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const AboutPage(),
        ),
      ),
      GoRoute(
        path: AppConstants.contactRoute,
        name: 'contact',
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const ContactPage(),
        ),
      ),
    ],
  );

  /// Build page with fade transition animation
  static Page<dynamic> _buildPageWithTransition(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
