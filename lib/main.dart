import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/injection_container.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'core/localization/locale_cubit.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependencies
  await initializeDependencies();
  
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => sl<ThemeCubit>(),
        ),
        BlocProvider<LocaleCubit>(
          create: (_) => sl<LocaleCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, localeState) {
              return ScreenUtilInit(
                designSize: const Size(375, 812), // Base design size for mobile
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) {
                  return MaterialApp.router(
                    title: 'Portfolio',
                    debugShowCheckedModeBanner: false,
                    
                    // Theme
                    theme: AppTheme.lightTheme,
                    darkTheme: AppTheme.darkTheme,
                    themeMode: themeState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                    
                    // Localization
                    locale: localeState.locale,
                    supportedLocales: const [
                      Locale('en'),
                      Locale('de'),
                    ],
                    
                    // Routing
                    routerConfig: AppRouter.router,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
