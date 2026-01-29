import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/theme_cubit.dart';
import '../localization/locale_cubit.dart';

final sl = GetIt.instance;

/// Initialize all dependencies
Future<void> initializeDependencies() async {
  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Core - Theme
  sl.registerFactory<ThemeCubit>(() => ThemeCubit(sl()));

  // Core - Localization
  sl.registerFactory<LocaleCubit>(() => LocaleCubit(sl()));

  // TODO: Register feature-specific dependencies here
  // Example:
  // sl.registerFactory<HomeBloc>(() => HomeBloc());
}
