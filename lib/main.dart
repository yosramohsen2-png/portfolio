import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/di/injection_container.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'core/localization/locale_cubit.dart';
import 'core/routing/app_router.dart';
import 'features/reviews/presentation/cubit/reviews_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize EasyLocalization
  await EasyLocalization.ensureInitialized();

  // Retrieve Supabase credentials from Environment
  const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  // Fail-fast validation: Ensure keys are provided before app launch
  if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
    throw AssertionError(
      'CRITICAL CONFIGURATION ERROR: Supabase environment variables are missing! '
      'Please build/run the application with --dart-define parameters: '
      '--dart-define=SUPABASE_URL=YOUR_URL --dart-define=SUPABASE_ANON_KEY=YOUR_KEY'
    );
  }

  // Initialize Supabase
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
  
  // Initialize dependencies
  await initializeDependencies();
  
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('de')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const PortfolioApp(),
    ),
  );
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Precache critical and common assets for instant launch loading
    precacheImage(const AssetImage(AppAssets.logo), context);
    precacheImage(const AssetImage(AppAssets.logoDark), context);
    precacheImage(const AssetImage(AppAssets.bgLogo), context);
    precacheImage(const AssetImage(AppAssets.userAvatar), context);
    precacheImage(const AssetImage(AppAssets.me), context);
  }

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
        BlocProvider<ReviewsCubit>(
          create: (_) => sl<ReviewsCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, localeState) {
              // Sync EasyLocalization with LocaleCubit
              if (context.locale != localeState.locale) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.setLocale(localeState.locale);
                });
              }
              
              return ScreenUtilInit(
                designSize: const Size(375, 812),
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
                    
                    // Localization from EasyLocalization
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    
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
