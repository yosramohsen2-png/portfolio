import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/reviews/data/datasources/reviews_local_data_source.dart';
import '../../features/reviews/data/datasources/reviews_local_data_source_impl.dart';
import '../../features/reviews/data/repositories/reviews_repository_impl.dart';
import '../../features/reviews/domain/repositories/reviews_repository.dart';
import '../../features/reviews/domain/usecases/add_review_use_case.dart';
import '../../features/reviews/domain/usecases/get_reviews_use_case.dart';
import '../../features/reviews/domain/usecases/delete_review_use_case.dart';
import '../../features/reviews/presentation/cubit/reviews_cubit.dart';
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

  // Reviews Feature
  sl.registerLazySingleton<ReviewsLocalDataSource>(
      () => ReviewsLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<ReviewsRepository>(
      () => ReviewsRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetReviewsUseCase(sl()));
  sl.registerLazySingleton(() => AddReviewUseCase(sl()));
  sl.registerLazySingleton(() => DeleteReviewUseCase(sl()));
  sl.registerFactory(() => ReviewsCubit(
        getReviewsUseCase: sl(),
        addReviewUseCase: sl(),
        deleteReviewUseCase: sl(),
      ));
}
